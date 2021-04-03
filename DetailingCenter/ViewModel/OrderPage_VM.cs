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
        private Client selectedClient;



        public Client SelectedClient
        {
            get => selectedClient;
            set
            {
                selectedClient = value;
                Filter();
                // OnPropertyChanged(nameof(SelectedClient));
                OnPropertyChanged(nameof(Orders));
            }
        }

        public List<CarMark> CarMarks { get; private set; }
        public CarMark SelectedCarMark { get; set; }

        public List<CarModel> CarModels { get; private set; }
        public CarModel SelectedCarModel { get; set; }

        public List<ServiceType> ServiceTypes { get; private set; }
        public ServiceType SelectedServiceType { get; set; }

        public List<Service> Services { get; private set; }
        public Service SelectedService { get; set; }

        public List<OrderStatus> OrderStatuses { get; private set; }
        public OrderStatus SelectedOrderStatus { get; set; }

        public DateTime SelectedDate { get; set; }

        public OrderPage_VM()
        {
            Orders = context.Order.ToList();


        }

        public void Edit()
        {
            var editOrderWindow = new EditOrderWindow(SelectedOrder);

            editOrderWindow.ShowDialog();

        }

        public void Add()
        {
            var editOrderWindow = new EditOrderWindow();

            editOrderWindow.ShowDialog();
        }

        public void Delete()
        {
            throw new NotImplementedException();
        }

        private void Filter()
        {

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
