using DetailingCenter.Model.EF;
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

namespace DetailingCenter.Windows
{
    /// <summary>
    /// Логика взаимодействия для ClientsPage.xaml
    /// </summary>
    public partial class ClientPage : Page
    {
        ClientPage_VM VM;
        public ClientPage()
        {
            VM = new ClientPage_VM();
            DataContext = VM;
            InitializeComponent();
        }

        private void OpenEditWindow(bool NewClient)
        {
            this.Opacity = 0.4;
            if (NewClient)
            {
                VM.Add();
            }
            else
            {
                VM.Edit();
            }
            this.Opacity = 1;
        }

        private void addClientBtn_Click(object sender, RoutedEventArgs e) => OpenEditWindow(true);
        

        private void editBtn_Click(object sender, RoutedEventArgs e) => OpenEditWindow(false);


        private void deleteBtn_Click(object sender, RoutedEventArgs e) => VM.Delete();
        
    }
}
