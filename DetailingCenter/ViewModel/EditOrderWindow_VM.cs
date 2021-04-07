using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DetailingCenter.Model.EF;
using static DetailingCenter.Model.EF.AppData;

namespace DetailingCenter
{
    class EditOrderWindow_VM : INotifyPropertyChanged
    {

        public List<Client> Clients { get; private set; }
        public Client SelectedClient { get; set; }

        public List<CarMark> CarMarks { get; private set; }

        private CarMark _selectedCarMark;
        public CarMark SelectedCarMark
        {
            get => _selectedCarMark;
            set
            {
                _selectedCarMark = value;

                CarModels = _selectedCarMark.CarModel.ToList();
                OnPropertyChanged(nameof(CarModels));
            }
        }

        public List<CarModel> CarModels { get; private set; }
        public CarModel SelectedCarModel { get; set; }

        public List<CarColor> CarColors { get; private set; }
        public CarColor SelectedCarColor { get; set; }

        public List<Employee> Employees { get; private set; }
        public Employee SelectedEmployee { get; set; }

        public List<ServiceType> ServiceTypes { get; private set; }

        private ServiceType _selectedServiceType;
        public ServiceType SelectedServiceType
        {
            get => _selectedServiceType;
            set
            {
                _selectedServiceType = value;

                Services = _selectedServiceType.Service.ToList();
                OnPropertyChanged(nameof(Services));
            }

        }


        public List<Service> Services { get; private set; }
        public Service SelectedService { get; set; }

        public List<OrderStatus> OrderStatuses { get; private set; }
        public OrderStatus SelectedOrderStatus { get; set; }

        public DateTime SelectedDate { get; set; }

        public string WindowName { get; set; }

        private Order CurrentOrder;
        public EditOrderWindow_VM(Order SelectedOrder)
        {
            CurrentOrder = SelectedOrder;

            Clients = context.Client.ToList();
            CarMarks = context.CarMark.ToList();

            CarColors = context.CarColor.ToList();

            ServiceTypes = context.ServiceType.ToList();

            Employees = context.Employee.ToList();

            OrderStatuses = context.OrderStatus.ToList();

            if (CurrentOrder != null)
            {
                SelectedClient = CurrentOrder.Client;

                SelectedCarMark = CurrentOrder.CarModel.CarMark;
                SelectedCarModel = CurrentOrder.CarModel;

                SelectedCarColor = CurrentOrder.CarColor;

                SelectedServiceType = CurrentOrder.Service.ServiceType;

                SelectedService = CurrentOrder.Service;

                SelectedEmployee = CurrentOrder.Employee;

                SelectedOrderStatus = CurrentOrder.OrderStatus;

                SelectedDate = CurrentOrder.DateOfService;

                WindowName = "Edit order";
            }
            else
            {
                SelectedDate = DateTime.Now;
                WindowName = "Add order";
            }
        }
        public void SaveChanges()
        {
            if (CurrentOrder == null)
            {
                CurrentOrder = new Order()
                {
                    Client = SelectedClient,
                    CarModel = SelectedCarModel,
                    CarColor = SelectedCarColor,
                    Service = SelectedService,
                    Employee = SelectedEmployee,
                    OrderStatus = SelectedOrderStatus,
                    DateOfService = SelectedDate
                };
                context.Order.Add(CurrentOrder);
            }
            else
            {
                CurrentOrder.Client = SelectedClient;
                
                CurrentOrder.CarModel = SelectedCarModel;
                CurrentOrder.Service = SelectedService;
                CurrentOrder.CarColor = SelectedCarColor;
                CurrentOrder.Employee = SelectedEmployee;
                CurrentOrder.OrderStatus = SelectedOrderStatus;
                CurrentOrder.DateOfService = SelectedDate;

            }

            context.SaveChanges();
        }

        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged(string name)
        {
            if (this.PropertyChanged != null)
                this.PropertyChanged(this, new PropertyChangedEventArgs(name));
        }
    }
}
