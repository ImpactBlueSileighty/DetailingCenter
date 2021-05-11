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
    /// Логика взаимодействия для LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        LoginWindow_VM VM;
        public LoginWindow()
        {
            VM = new LoginWindow_VM();
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

        private void loginBtn_Click(object sender, RoutedEventArgs e)
        {


            if (VM.Open())
            {
                this.Close();
            }
            
        }
    }
}
