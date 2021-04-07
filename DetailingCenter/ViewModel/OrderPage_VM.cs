using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DetailingCenter.Model.EF;
using DetailingCenter.View.Windows;
using static DetailingCenter.Model.EF.AppData;



namespace DetailingCenter
{
    class OrderPage_VM : INotifyPropertyChanged
    {

        public Order SelectedOrder { get; set; }
        public List<Order> Orders { get; set; }

        // Filter 

        public List<Client> Clients { get; private set; }
        private Client _selectedClient;

        public Client SelectedClient
        {
            get => _selectedClient;
            set
            {
                _selectedClient = value;
                Filter();
                // OnPropertyChanged(nameof(SelectedClient));
                OnPropertyChanged(nameof(Orders));
            }
        }

        public List<CarMark> CarMarks { get; private set; }
        private CarMark _selectedCarMark;
        public CarMark SelectedCarMark
        {
            get => _selectedCarMark;
            set
            {
                _selectedCarMark = value;
                Filter();
                if (value != null && value.Name != "All")
                {

                }
                else
                {
                    CarModels = SelectedCarMark.CarModel.ToList();
                }
                OnPropertyChanged(nameof(Orders));
            }
        }

        public List<CarModel> CarModels { get; private set; }
        private CarModel _selectedCarModel;
        public CarModel SelectedCarModel
        {
            get => _selectedCarModel;
            set
            {
                _selectedCarModel = value;
                Filter();
                OnPropertyChanged(nameof(Orders));
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
                Filter();
                OnPropertyChanged(nameof(Orders));
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
                OnPropertyChanged(nameof(Orders));
            }
        }

        public List<OrderStatus> OrderStatuses { get; private set; }
        private OrderStatus _selectedOrderStatus;
        public OrderStatus SelectedOrderStatus
        {
            get => _selectedOrderStatus;
            set
            {
                _selectedOrderStatus = value;
                Filter();
                OnPropertyChanged(nameof(Orders));
            }
        }

        public DateTime SelectedDate { get; set; }

        public OrderPage_VM()
        {

            Filter();

        }

        public void Edit()
        {

            if (SelectedOrder != null)
            {
                var editOrderWindow = new EditOrderWindow(SelectedOrder);

                editOrderWindow.ShowDialog();

                Filter();
            }
            else
            {
                string message = "You have not selected an order.";
                var exceptionWindow = new ExceptionWindow(message);
                exceptionWindow.ShowDialog();
            }

        }

        public void Add()
        {
            var editOrderWindow = new EditOrderWindow();

            editOrderWindow.ShowDialog();
            Filter();
        }

        public void Delete()
        {


            if (SelectedOrder != null)
            {
                string message = "Are you sure you want to delete this order?";
                var messageBox = new MessageWindow(message);
                messageBox.ShowDialog();
                if (messageBox.Request == true)
                {
                    context.Order.Remove(SelectedOrder);
                    context.SaveChanges();
                }
                Filter();
            }
            


        }

        private void Filter()
        {
            Orders = context.Order.ToList();


            //Client Filter

            Clients = new List<Client>()
            {
                new Client()
                {
                    Name = "All"
                }
            };
            Clients.AddRange(context.Client.OrderBy(e => e.Name).ToList());
            _selectedClient = Clients[0];

            //Car Filter
            CarMarks = new List<CarMark>()
            {
                new CarMark()
                {
                    Name = "All"
                }
            };
            CarMarks.AddRange(context.CarMark.OrderBy(e => e.Name).ToList());
            _selectedCarMark = CarMarks[0];
            //  CarModels = context.CarModel.ToList();

            ServiceTypes = context.ServiceType.ToList();
            Services = context.Service.ToList();

            OrderStatuses = context.OrderStatus.ToList();


            if (SelectedClient != null && SelectedClient.Name != "All")
                Orders = Orders.Where(e => e.Client == SelectedClient).ToList();

            if (SelectedCarMark != null && SelectedCarMark.Name != "All")
                Orders = Orders.Where(e => e.CarModel.CarMark == SelectedCarMark).ToList();


            //  if (SelectedCarModel != null)
            //      Orders = Orders.Where(e => e.CarModel == SelectedCarModel).ToList();

            if (SelectedServiceType != null)
                Orders = Orders.Where(e => e.Service.ServiceType == SelectedServiceType).ToList();

            if (SelectedService != null)
                Orders = Orders.Where(e => e.Service == SelectedService).ToList();

            if (SelectedOrderStatus != null)
                Orders = Orders.Where(e => e.OrderStatus == SelectedOrderStatus).ToList();

            if (SelectedDate != null && SelectedDate != DateTime.MinValue)
            {
                Orders = Orders.Where(e => (e.DateOfService <= SelectedDate.AddDays(1)) && e.DateOfService >= SelectedDate.Subtract(new TimeSpan(1, 0, 0, 0))).ToList();
            }




            OnPropertyChanged(nameof(Orders));


        }



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
