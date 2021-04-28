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

namespace DetailingCenter.Pages
{
    /// <summary>
    /// Логика взаимодействия для ServicePage.xaml
    /// </summary>
    public partial class ServicePage : Page
    {
        ServicePage_VM VM;
        public ServicePage()
        {
            VM = new ServicePage_VM();
            DataContext = VM;
            InitializeComponent();
        }

        private void addServiceBtn_Click(object sender, RoutedEventArgs e) => OpenEditWindow(true);


        private void deleteBtn_Click(object sender, RoutedEventArgs e) => VM.Delete();


        private void editBtn_Click(object sender, RoutedEventArgs e) => OpenEditWindow(false);
      
        private void OpenEditWindow(bool NewOrder)
        {
            this.Opacity = 0.4;
            if (NewOrder)
            {
                VM.Add();
            }
            else
            {
                VM.Edit();
            }
            this.Opacity = 1;
        }
    }
}
