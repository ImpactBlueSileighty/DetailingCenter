using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DetailingCenter.Model.EF.AppData;
using DetailingCenter.Model.EF;
using System.ComponentModel;
using DetailingCenter.View.Windows;

namespace DetailingCenter
{
    class ClientPage_VM : INotifyPropertyChanged
    {
        public List<Client> Clients { get; set; }
        public Client SelectedClient { get; set; }

        //Filter properties 
        public List<Client> ClientsCmb { get; private set; }
        private Client _selectedClientCmb;
        public Client SelectedClientCmb
        {
            get => _selectedClientCmb;
            set
            {
                _selectedClientCmb = value;
                Filter();
            }
        }

        private string _inputPhone;
        public string InputPhone
        {
            get => _inputPhone;

            set
            {
                _inputPhone = value;
                
                Filter();
            }
        }

        private string _inputEmail;
        public string InputEmail
        {
            get => _inputEmail;

            set
            {
                _inputEmail = value;
                
                Filter();
            }
        }

        public List<ServiceType> ServiceTypes { get; private set; }
        private ServiceType _selectedServiceType;
        public ServiceType SelectedServiceType
        {
            get => _selectedServiceType;
            set
            {
                _selectedServiceType = value;

                if (value != null && value.Name != "All")
                {
                    Services = SelectedServiceType.Service.ToList();
                }
                else
                {
                    Services = context.Service.ToList();
                }
                OnPropertyChanged(nameof(Services));
                Filter();
            }

        }

        public List<Service> Services { get; private set; }
        private Service _selectedService;
        public Service SelectedService
        {
            get => _selectedService;
            set
            {
                _selectedService = value;
                Filter();
                OnPropertyChanged(nameof(Clients));
            }
        }

        private DateTime _selectedDate;
        public DateTime SelectedDate
        {
            get => _selectedDate;

            set
            {
                _selectedDate = value;
                Filter();
            }
        }

        //Constructor

        public ClientPage_VM()
        {

            ClientsCmb = new List<Client>()
            {
                new Client()
                {
                    Name = "All"
                }
            };
            ClientsCmb.AddRange(context.Client.OrderBy(e => e.Name).ToList());
            _selectedClientCmb = ClientsCmb[0];

            Services = context.Service.ToList();

            ServiceTypes = new List<ServiceType>()
            {
                new ServiceType()
                {
                    Name = "All"
                }
            };
            ServiceTypes.AddRange(context.ServiceType.OrderBy(e => e.Name).ToList());
            _selectedServiceType = ServiceTypes[0];


            
            Filter();
        }



        //Method for add data
        public void Add()
        {
            var editClientWindow = new EditClientWindow();

            editClientWindow.ShowDialog();
            Filter();

        }

        //Method for edit data
        public void Edit()
        {

            if (SelectedClient != null)
            {
                var editClientWindow = new EditClientWindow(SelectedClient);

                editClientWindow.ShowDialog();
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
            if (SelectedClient != null)
            {
                string message = "Are you sure you want to delete this client?";
                var messageBox = new MessageWindow(message);
                messageBox.ShowDialog();
                if (messageBox.Request == true)
                {
                    context.Client.Remove(SelectedClient);
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
            Clients = context.Client.ToList();

            if (SelectedClientCmb != null && SelectedClientCmb.Name != "All")
                Clients = Clients.Where(e => e == SelectedClientCmb).ToList();

            if (!string.IsNullOrWhiteSpace(InputPhone))
                Clients = Clients.Where(e => e.Phone.Contains(InputPhone)).ToList();

            if (!string.IsNullOrWhiteSpace(InputEmail))
                Clients = Clients.Where(e => e.Email.Contains(InputEmail)).ToList();

            if (SelectedServiceType != null && SelectedServiceType.Name != "All")
                Clients = Clients.Where(e => e.Service.ServiceType == SelectedServiceType).ToList();

            if (SelectedService != null)
                Clients = Clients.Where(e => e.Service == SelectedService).ToList();

            if (SelectedDate != null && SelectedDate != DateTime.MinValue)
            {
                Clients = Clients.Where(e => (e.LastVisit <= SelectedDate.AddDays(1)) && e.LastVisit >= SelectedDate.Subtract(new TimeSpan(1, 0, 0, 0))).ToList();
            }




            OnPropertyChanged(nameof(Clients));
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
            {
                this.PropertyChanged(this, new PropertyChangedEventArgs(name));
            }
        }
    }
}
