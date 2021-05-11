using DetailingCenter.Model.EF;
using DetailingCenter.Pages;
using DetailingCenter.View.Windows;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DetailingCenter.Model.EF.AppData;

namespace DetailingCenter.ViewModel
{
    class LoginWindow_VM
    {
        public List<Employee> Employees { get; private set; }
        public Employee SelectedEmployee { get; set; }
        public LoginWindow_VM()
        {
            Employees = new List<Employee>() 
            { 
                new Employee()
                {
                    Name = "Select employee account"
                }
            };

            Employees.AddRange(context.Employee.ToList());
            SelectedEmployee = Employees[0];
        }

        public bool Open()
        {
            if(SelectedEmployee != null && SelectedEmployee != Employees[0])
            {
                StartWindow startWindow = new StartWindow(SelectedEmployee);
                startWindow.Show();
                return true;
            }
            else
            {
                
                string message = "You need to select employee account.";
                var exceptionWindow = new ExceptionWindow(message);
                exceptionWindow.ShowDialog();
                return false;
            }
            
        }
    }
}
