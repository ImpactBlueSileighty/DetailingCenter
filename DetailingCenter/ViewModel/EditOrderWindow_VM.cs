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

        private CarMark selectedCarMark;
        public CarMark SelectedCarMark
        {
            get => selectedCarMark;
            set
            {
                selectedCarMark = value;

                CarModels = selectedCarMark.CarModel.ToList();
                OnPropertyChanged(nameof(CarModels));
            }
        }

        public List<CarModel> CarModels { get; private set; }
        public CarModel SelectedCarModel { get; set; }

        

        public List<ServiceType> ServiceTypes { get; private set; }

        private ServiceType selectedServiceType;
        public ServiceType SelectedServiceType
        {
            get => selectedServiceType;
            set
            {
                selectedServiceType = value;

                Services = selectedServiceType.Service.ToList();
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

            ServiceTypes = context.ServiceType.ToList();
            OrderStatuses = context.OrderStatus.ToList();

            if (CurrentOrder != null)
            {
                SelectedClient = CurrentOrder.Client;

                SelectedCarMark = CurrentOrder.CarModel.CarMark;
                SelectedCarModel = CurrentOrder.CarModel;

                SelectedServiceType = CurrentOrder.Service.ServiceType;

                SelectedService = CurrentOrder.Service;

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
                    Service = SelectedService,
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
