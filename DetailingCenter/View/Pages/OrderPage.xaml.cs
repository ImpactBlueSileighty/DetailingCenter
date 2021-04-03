using DetailingCenter.View.Windows;
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
    /// Логика взаимодействия для CalendarPage.xaml
    /// </summary>
    public partial class OrderPage : Page
    {
        OrderPage_VM VM;


        public OrderPage()
        {
            VM = new OrderPage_VM();
            DataContext = VM;
            InitializeComponent();
        }

        private void editBtn_Click(object sender, RoutedEventArgs e) => OpenEditWindow(false);
        private void addOrderBtn_Click(object sender, RoutedEventArgs e) => OpenEditWindow(true);

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

        private void deleteBtn_Click(object sender, RoutedEventArgs e) => VM.Delete();


    }
}
