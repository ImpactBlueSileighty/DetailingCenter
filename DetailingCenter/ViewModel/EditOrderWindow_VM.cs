using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Media.Imaging;
using DetailingCenter.Model.EF;
using DetailingCenter.View.Windows;
using Microsoft.Win32;
using static DetailingCenter.Model.EF.AppData;

namespace DetailingCenter
{
    class EditOrderWindow_VM : INotifyPropertyChanged
    {


        public string PhotoPath { get; set; }
        public string PhotoPathFormat
        {
            get
            {
                var a = System.Reflection.Assembly.GetExecutingAssembly().Location;
                return a.Remove(a.LastIndexOf('\\')) + PhotoPath;
            }
        }

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

        private Order _currentOrder;
        public EditOrderWindow_VM(Order SelectedOrder)
        {



            // filling comboboxes with data 

            _currentOrder = SelectedOrder;

            Clients = context.Client.ToList();
            CarMarks = context.CarMark.ToList();

            CarColors = context.CarColor.ToList();

            ServiceTypes = context.ServiceType.ToList();

            Employees = context.Employee.ToList();

            OrderStatuses = context.OrderStatus.ToList();

            // distribution of data to a window 
            if (_currentOrder != null)
            {
                PhotoPath = _currentOrder.CarPhotoPath;

                SelectedClient = _currentOrder.Client;

                SelectedCarMark = _currentOrder.CarModel.CarMark;
                SelectedCarModel = _currentOrder.CarModel;

                SelectedCarColor = _currentOrder.CarColor;

                SelectedServiceType = _currentOrder.Service.ServiceType;

                SelectedService = _currentOrder.Service;

                SelectedEmployee = _currentOrder.Employee;

                SelectedOrderStatus = _currentOrder.OrderStatus;

                SelectedDate = _currentOrder.DateOfService;

                WindowName = "Edit order";
            }
            else
            {
                SelectedDate = DateTime.Now;
                WindowName = "Add order";
            }
            _fullPath = Assembly.GetExecutingAssembly().Location;
            _fullPath = _fullPath.Remove(_fullPath.LastIndexOf('\\'));

        }
        private string _fullPath;
        FileInfo _newPhoto;
        public void SetPhoto()
        {
            // string _photoPath = _fullPath.Substring(0, _fullPath.IndexOf("DetailingCenter")) + @"DetailingCenter\DetailingCenter\Resources\OrderPhotoes\";
            string photoPath = _fullPath + @"\Resources\OrderPhotoes\";
            string photoPathFrom;
            string photoPathDestination = null;
            string photoFileName = null;

            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Image files (*.jpg, *.jpeg, *.jpe, *.jfif, *.png) | *.jpg; *.jpeg; *.jpe; *.jfif; *.png";
            openFileDialog.Multiselect = false;


            openFileDialog.ShowDialog();
            photoPathFrom = openFileDialog.FileName;
            if (photoPathFrom != "")
            {
                FileInfo fiFrom = new FileInfo(photoPathFrom);
                if (fiFrom.Exists)
                {
                    //  photoPathDestination = photoPath + fiFrom.Name;
                    //FileInfo fiTo = new FileInfo(photoPathDestination);

                    photoFileName = DateTime.Now.Ticks.ToString() + fiFrom.Extension;

                    photoPathDestination = photoPath + photoFileName;

                    fiFrom.CopyTo(photoPathDestination);
                    _newPhoto = new FileInfo(photoPathDestination);
                }
            }


            PhotoPath = "/Resources/OrderPhotoes/" + photoFileName;



            OnPropertyChanged(nameof(PhotoPathFormat));
        }

        public void Cancel()
        {

            PhotoPath = "/Resources/OrderPhotoes/Empty.jpg";
            OnPropertyChanged(nameof(PhotoPathFormat));
            GC.Collect(3, GCCollectionMode.Forced, true, true);
            Thread t = new Thread(delete);
            t.Start();
        }
        void delete()
        {
            if (_newPhoto != null)
                while (_newPhoto.Exists)
                {
                    try
                    {
                        _newPhoto.Delete();
                        Console.WriteLine("Govno ydalilos");
                        break;
                    }
                    catch { }
                    Thread.Sleep(500);
                }
        }
        public void SaveChanges() // Edit or Add Order data and save it to DB
        {
            try
            {
                if (_currentOrder == null)
                {
                    _currentOrder = new Order()
                    {
                        Client = SelectedClient,
                        CarModel = SelectedCarModel,
                        CarColor = SelectedCarColor,
                        CarPhotoPath = PhotoPath,
                        Service = SelectedService,
                        Employee = SelectedEmployee,
                        OrderStatus = SelectedOrderStatus,
                        DateOfService = SelectedDate,

                        
                        
                    };

                    SelectedClient.Service = SelectedService;
                    SelectedClient.LastVisit = DateTime.Now;

                    context.Order.Add(_currentOrder);
                }
                else
                {
                    _currentOrder.CarPhotoPath = PhotoPath;
                    _currentOrder.Client = SelectedClient;
                    _currentOrder.CarModel = SelectedCarModel;
                    _currentOrder.Service = SelectedService;
                    _currentOrder.CarColor = SelectedCarColor;
                    _currentOrder.Employee = SelectedEmployee;
                    _currentOrder.OrderStatus = SelectedOrderStatus;
                    _currentOrder.DateOfService = SelectedDate;
                    _currentOrder.Client.Service = SelectedService;
                    _currentOrder.Client.LastVisit = DateTime.Now;


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

        // INotifyPropertyChanged interface implementation 
        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged(string name)
        {
            if (this.PropertyChanged != null)
                this.PropertyChanged(this, new PropertyChangedEventArgs(name));
        }
    }
}
