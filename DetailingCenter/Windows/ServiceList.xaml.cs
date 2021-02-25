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
using static DetailingCenter.EF.AppData;
using DetailingCenter.Pages;
using DetailingCenter.Windows;

namespace DetailingCenter
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            //serviceList.ItemsSource = context.Service.ToList();


        }

        private void clientsBtn_Click(object sender, RoutedEventArgs e)
        {
            ClientPage cp = new ClientPage();
            if (clientsBtn.IsChecked == true)
            {
                navigationRec1.Fill = Brushes.Orange;
                navigationRec2.Fill = new SolidColorBrush(Color.FromRgb(11, 8, 20));
                navigationRec3.Fill = new SolidColorBrush(Color.FromRgb(11, 8, 20));
                navigationRec4.Fill = new SolidColorBrush(Color.FromRgb(11, 8, 20));

                financeBtn.IsChecked = false;
                serviceBtn.IsChecked = false;
                ordersBtn.IsChecked = false;

                navigationFrame.Navigate(cp);
                
            }

        }

        private void serviceBtn_Click(object sender, RoutedEventArgs e)
        {
            ServicePage sp = new ServicePage();
            if (serviceBtn.IsChecked == true)
            {
                navigationRec2.Fill = Brushes.Orange;
                navigationRec1.Fill = new SolidColorBrush(Color.FromRgb(11, 8, 20));
                navigationRec3.Fill = new SolidColorBrush(Color.FromRgb(11, 8, 20));
                navigationRec4.Fill = new SolidColorBrush(Color.FromRgb(11, 8, 20));

                clientsBtn.IsChecked = false;
                financeBtn.IsChecked = false;
                ordersBtn.IsChecked = false;

                navigationFrame.Navigate(sp);
            }
        }

        private void financeBtn_Click(object sender, RoutedEventArgs e)
        {
            if (financeBtn.IsChecked == true)
            {
                navigationRec3.Fill = Brushes.Orange;
                navigationRec1.Fill = new SolidColorBrush(Color.FromRgb(11, 8, 20));
                navigationRec2.Fill = new SolidColorBrush(Color.FromRgb(11, 8, 20));
                navigationRec4.Fill = new SolidColorBrush(Color.FromRgb(11, 8, 20));
                clientsBtn.IsChecked = false;
                serviceBtn.IsChecked = false;
                ordersBtn.IsChecked = false;
            }
        }



        private void ordersBtn_Click(object sender, RoutedEventArgs e)
        {
            if (ordersBtn.IsChecked == true)
            {
                navigationRec4.Fill = Brushes.Orange;
                navigationRec1.Fill = new SolidColorBrush(Color.FromRgb(11, 8, 20));
                navigationRec2.Fill = new SolidColorBrush(Color.FromRgb(11, 8, 20));
                navigationRec3.Fill = new SolidColorBrush(Color.FromRgb(11, 8, 20));
                clientsBtn.IsChecked = false;
                financeBtn.IsChecked = false;
                serviceBtn.IsChecked = false;
            }
        }
    }
}
