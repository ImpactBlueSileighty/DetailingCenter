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
    /// Логика взаимодействия для ExceptionWindow.xaml
    /// </summary>
    public partial class ExceptionWindow : Window
    {
        ExceptionWindow_VM VM;
        public ExceptionWindow(string message)
        {
            VM = new ExceptionWindow_VM(message);
            DataContext = VM;
            InitializeComponent();
        }

        private void confirmBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
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

        

       
    }
}
