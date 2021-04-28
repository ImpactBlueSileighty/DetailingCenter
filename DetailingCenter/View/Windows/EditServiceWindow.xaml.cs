using DetailingCenter.Model.EF;
using DetailingCenter.ViewModel;
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
using System.Windows.Shapes;

namespace DetailingCenter.View.Windows
{
    /// <summary>
    /// Логика взаимодействия для EditServiceWindow.xaml
    /// </summary>
    public partial class EditServiceWindow : Window
    {
        EditServiceWindow_VM VM;
        public EditServiceWindow(Service SelectedService = null)
        {
            VM = new EditServiceWindow_VM(SelectedService);
            DataContext = VM;
            InitializeComponent();
        }

        private void windowTaskBarBtn_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void windowCloseBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void headerGrid_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void submitBtn_Click(object sender, RoutedEventArgs e)
        {

            VM.SaveChanges();
            this.Close();
        }


        private void cancelBtn_Click(object sender, RoutedEventArgs e)
        {

            this.Close();
        }
    }
}
