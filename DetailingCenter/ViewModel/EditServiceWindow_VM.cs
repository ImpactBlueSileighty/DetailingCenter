using DetailingCenter.Model.EF;
using static DetailingCenter.Model.EF.AppData;
using DetailingCenter.View.Windows;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DetailingCenter.ViewModel
{
    class EditServiceWindow_VM : INotifyPropertyChanged
    {
        public string InputName { get; set; }

        public List<ServiceType> ServiceTypes { get; set; }
        public ServiceType SelectedServiceType { get; set; }

        public string InputDuration { get; set; }

        public string InputCost { get; set; }

        public string InputDescription { get; set; }

        public string WindowName { get; set; }

        private Service _currentService;

        public EditServiceWindow_VM(Service SelectedService)
        {
            _currentService = SelectedService;

            ServiceTypes = new List<ServiceType>();
            ServiceTypes.Add(new ServiceType
            {
                Name = "Enter the type"
            });

            ServiceTypes.AddRange(context.ServiceType.ToList());
            SelectedServiceType = ServiceTypes[0];

            if (_currentService != null)
            {
                InputName = _currentService.Name;
                SelectedServiceType = _currentService.ServiceType;
                InputDuration = _currentService.Duration.ToString();
                InputCost = _currentService.Cost.ToString();
                InputDescription = _currentService.Description;

                WindowName = "Edit service";
            }
            else
            {
                WindowName = "Add service";
            }
        }

        public void SaveChanges() // Edit or Add Service data and save it to DB
        {

            try
            {

                if (_currentService == null)
                {
                    _currentService = new Service()
                    {
                        Name = InputName,
                        ServiceType = SelectedServiceType,
                        Duration = Convert.ToDecimal(InputDuration),
                        Cost = Convert.ToDecimal(InputCost),
                        Description = InputDescription
                    };
                    context.Service.Add(_currentService);
                }
                else
                {
                    _currentService.Name = InputName;
                    _currentService.ServiceType = SelectedServiceType;
                    _currentService.Duration = Convert.ToDecimal(InputDuration);
                    _currentService.Cost = Convert.ToDecimal(InputCost);
                    _currentService.Description = InputDescription;
                }
                context.SaveChanges();

            }
            catch
            {
                string message = "You have not completed all the fields.";
                var exceptionWindow = new ExceptionWindow(message);
                exceptionWindow.ShowDialog();

            }
        }





        //Implementation of the interface INotifyPropertyChanged
        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged(string name)
        {
            if (this.PropertyChanged != null)
                this.PropertyChanged(this, new PropertyChangedEventArgs(name));
        }
    }
}
