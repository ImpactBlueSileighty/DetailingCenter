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
    /// Логика взаимодействия для MessageBox.xaml
    /// </summary>
    public partial class MessageWindow : Window
    {
        

        MessageWindow_VM VM;
        public bool Request { get; set; }

        public MessageWindow(string message)
        {
            
            VM = new MessageWindow_VM(message);
            DataContext = VM;
            InitializeComponent();
            
        }

        private void windowTaskBarBtn_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void windowCloseBtn_Click(object sender, RoutedEventArgs e)
        {
            Request = false;
            this.Close();
        }

        private void headerGrid_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void confirmBtn_Click(object sender, RoutedEventArgs e)
        {
            Request = true;
            this.Close();
        }

        private void cancelBtn_Click(object sender, RoutedEventArgs e)
        {
            Request = false;
            this.Close();
        }
    }
}
