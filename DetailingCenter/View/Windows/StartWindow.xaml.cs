using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using DetailingCenter.Model.EF;
using DetailingCenter.Pages;
using DetailingCenter.View.Pages;
using DetailingCenter.View.Windows;
using DetailingCenter.Windows;

namespace DetailingCenter
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class StartWindow : Window
    {
        
        StartWindow_VM VM;
        private Employee _currentEmployee;
        public StartWindow(Employee SelectedEmployee = null)
        {
            _currentEmployee = SelectedEmployee;  
            VM = new StartWindow_VM(SelectedEmployee);
            DataContext = VM;
            InitializeComponent();

        }


        private void windowSizeBtn_Click(object sender, RoutedEventArgs e)
        {
            if (this.WindowState == WindowState.Maximized)
            {
                this.WindowState = WindowState.Normal;
                this.ResizeMode = ResizeMode.CanResizeWithGrip;
            }
            else
            {
                this.ResizeMode = ResizeMode.NoResize;
                this.WindowState = WindowState.Maximized;
            }

        }

        private void windowCloseBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void windowTaskBarBtn_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void headerGrid_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            DragMove();
        }

        private void orderBtn_Click(object sender, RoutedEventArgs e)
        {
            OrderPage op = new OrderPage();
            if (orderBtn.IsChecked == true)
            {
                navigationRec1.Fill = Brushes.Orange;
                navigationRec2.Fill = new SolidColorBrush(Color.FromRgb(23, 30, 40));
                navigationRec3.Fill = new SolidColorBrush(Color.FromRgb(23, 30, 40));
                navigationRec4.Fill = new SolidColorBrush(Color.FromRgb(23, 30, 40));

                clientsBtn.IsChecked = false;
                employeeBtn.IsChecked = false;
                serviceBtn.IsChecked = false;
                navigationFrame.Navigate(op);

            }
        }

        private void clientsBtn_Click(object sender, RoutedEventArgs e)
        {
            ClientPage cp = new ClientPage();
            if (clientsBtn.IsChecked == true)
            {
                navigationRec1.Fill = new SolidColorBrush(Color.FromRgb(23, 30, 40));
                navigationRec2.Fill = Brushes.Orange;
                navigationRec3.Fill = new SolidColorBrush(Color.FromRgb(23, 30, 40));
                navigationRec4.Fill = new SolidColorBrush(Color.FromRgb(23, 30, 40));

                orderBtn.IsChecked = false;
                employeeBtn.IsChecked = false;
                serviceBtn.IsChecked = false;
                navigationFrame.Navigate(cp);

            }

        }

        private void serviceBtn_Click(object sender, RoutedEventArgs e)
        {
            ServicePage sp = new ServicePage();
            if (serviceBtn.IsChecked == true)
            {

                navigationRec3.Fill = Brushes.Orange;
                navigationRec1.Fill = new SolidColorBrush(Color.FromRgb(23, 30, 40));
                navigationRec2.Fill = new SolidColorBrush(Color.FromRgb(23, 30, 40));
                navigationRec4.Fill = new SolidColorBrush(Color.FromRgb(23, 30, 40));

                orderBtn.IsChecked = false;
                clientsBtn.IsChecked = false;
                employeeBtn.IsChecked = false;

                navigationFrame.Navigate(sp);
            }
        }

        private void employeeBtn_Click(object sender, RoutedEventArgs e)
        {
            EmployeePage ep = new EmployeePage();
            if (employeeBtn.IsChecked == true)
            {
                

                navigationRec4.Fill = Brushes.Orange;
                navigationRec1.Fill = new SolidColorBrush(Color.FromRgb(23, 30, 40));
                navigationRec2.Fill = new SolidColorBrush(Color.FromRgb(23, 30, 40));
                navigationRec3.Fill = new SolidColorBrush(Color.FromRgb(23, 30, 40));

                orderBtn.IsChecked = false;
                clientsBtn.IsChecked = false;
                serviceBtn.IsChecked = false;

                navigationFrame.Navigate(ep);
                
            }
        }

        private void logOutBtn_Click(object sender, RoutedEventArgs e)
        {
            LoginWindow loginWindow = new LoginWindow();
            loginWindow.Show();
            this.Close();
        }
    }
}
