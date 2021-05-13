using DetailingCenter.Model.EF;
using static DetailingCenter.Model.EF.AppData;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DetailingCenter.View.Windows;

namespace DetailingCenter
{

    class ServicePage_VM : INotifyPropertyChanged
    {

        public Service SelectedService { get; set; }
        public List<Service> Services { get; set; }

        //Filter properties 

        public List<ServiceType> ServiceTypesCmb { get; private set; }
        private ServiceType _selectedServiceTypeCmb;
        public ServiceType SelectedServiceTypeCmb
        {
            get => _selectedServiceTypeCmb;
            set
            {
                _selectedServiceTypeCmb = value;

                if (value != null && value.Name != "All")
                {
                    ServicesCmb = SelectedServiceTypeCmb.Service.ToList();
                }
                else
                {
                    ServicesCmb = context.Service.ToList();
                }
                OnPropertyChanged(nameof(ServicesCmb));
                Filter();
            }

        }

        public List<Service> ServicesCmb { get; private set; }
        private Service _selectedServiceCmb;
        public Service SelectedServiceCmb
        {
            get => _selectedServiceCmb;
            set
            {
                _selectedServiceCmb = value;
                Filter();
                OnPropertyChanged(nameof(Services));
            }
        }

        private string _inputRangeCostFrom;
        public string InputRangeCostFrom
        {
            get => _inputRangeCostFrom;

            set
            {
                _inputRangeCostFrom = value;

                Filter();
            }
        }

        private string _inputRangeCostTo;
        public string InputRangeCostTo
        {
            get => _inputRangeCostTo; 

            set
            {
                _inputRangeCostTo = value;

                Filter();
            }
        }


        //Constructor
        public ServicePage_VM()
        {
            ServicesCmb = context.Service.ToList();

            ServiceTypesCmb = new List<ServiceType>()
            {
                new ServiceType()
                {
                    Name = "All"
                }
            };
            ServiceTypesCmb.AddRange(context.ServiceType.OrderBy(e => e.Name).ToList());
            _selectedServiceTypeCmb = ServiceTypesCmb[0];

            Filter();
        }

        //Method for add data
        public void Add()
        {
            var editServiceWindow = new EditServiceWindow();

            editServiceWindow.ShowDialog();
            Filter();
        }

        //Method for edit data
        public void Edit()
        {
            if (SelectedService != null)
            {
                var editServiceWindow = new EditServiceWindow(SelectedService);

                editServiceWindow.ShowDialog();
            }
            else
            {
                NullSelection();
            }

            Filter();
        }

        //Method for delete data
        public void Delete()
        {
            if (SelectedService != null)
            {
                string message = "Are you sure you want to delete this service?";
                var messageBox = new MessageWindow(message);
                messageBox.ShowDialog();
                if (messageBox.Request == true)
                {
                    context.Service.Remove(SelectedService);
                    context.SaveChanges();
                }

            }
            else
            {
                NullSelection();
            }

            Filter();
        }

        //Filter
        private void Filter()
        {
            Services = context.Service.ToList();

            if (SelectedServiceTypeCmb != null && SelectedServiceTypeCmb.Name != "All")
                Services = Services.Where(e => e.ServiceType == SelectedServiceTypeCmb).ToList();

            if (SelectedServiceCmb != null)
                Services = Services.Where(e => e == SelectedServiceCmb).ToList();

            if (!string.IsNullOrWhiteSpace(InputRangeCostFrom))
                Services = Services.Where(e => e.Cost >= Convert.ToDecimal(InputRangeCostFrom)).ToList();

            if (!string.IsNullOrWhiteSpace(InputRangeCostTo))
                Services = Services.Where(e => e.Cost <= Convert.ToDecimal(InputRangeCostTo)).ToList();

            OnPropertyChanged(nameof(Services));
        }

        public void NullSelection()
        {
            string message = "You have not selected a client.";
            var exceptionWindow = new ExceptionWindow(message);
            exceptionWindow.ShowDialog();
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
