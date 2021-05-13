using DetailingCenter.Model.EF;
using DetailingCenter.View.Windows;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DetailingCenter.Model.EF.AppData;

namespace DetailingCenter
{
    class EmployeePage_VM : INotifyPropertyChanged
    {
        public Employee SelectedEmployee { get; set; }
        public List<Employee> Employees { get; set; }

        //Filter properties 

        public List<Employee> EmployeesCmb { get; private set; }
        private Employee _selectedEmployeeCmb;
        public Employee SelectedEmployeeCmb
        {
            get => _selectedEmployeeCmb;

            set
            {
                _selectedEmployeeCmb = value;
                Filter();
            }
        }

        public List<Role> Roles { get; private set; }
        private Role _selectedRole;
        public Role SelectedRole
        {
            get => _selectedRole;
            set
            {
                _selectedRole = value;
                Filter();
            }
        }

        private DateTime _selectedDate;
        public DateTime SelectedDate
        {
            get => _selectedDate;
            set
            {
                _selectedDate = value;
                Filter();
            }
        }

        //Constructor

        public EmployeePage_VM()
        {
            EmployeesCmb = new List<Employee>()
            {
                new Employee()
                {
                    Name = "All"
                }
            };
            EmployeesCmb.AddRange(context.Employee.OrderBy(e => e.Name).ToList());
            _selectedEmployeeCmb = EmployeesCmb[0];

            Roles = new List<Role>()
            {
                new Role()
                {
                    Name = "All"
                }
            };
            Roles.AddRange(context.Role.OrderBy(e => e.Name).ToList());
            _selectedRole = Roles[0];

            

            Filter();
        }

        

        //Method for add data

        public void Add()
        {
            var editEmployeeWindow = new EditEmployeeWindow();

            editEmployeeWindow.ShowDialog();
            Filter();
        }

        //Method for edit data

        public void Edit()
        {
            if (SelectedEmployee != null)
            {
                var editEmployeeWindow = new EditEmployeeWindow(SelectedEmployee);

                editEmployeeWindow.ShowDialog();
            }
            else
            {
                NullSelection();
            }
            Filter();
        }

        //Method for delete data

        public void Delete()
        {
            if (SelectedEmployee != null)
            {
                string message = "Are you sure you want to delete this client?";
                var messageBox = new MessageWindow(message);
                messageBox.ShowDialog();
                if (messageBox.Request == true)
                {
                    context.Employee.Remove(SelectedEmployee);
                    context.SaveChanges();
                }

            }
            else
            {
                NullSelection();
            }

            Filter();
        }

        //Filter

        private void Filter()
        {
            Employees = context.Employee.ToList();

            if (SelectedEmployeeCmb != null && SelectedEmployeeCmb.Name != "All")
                Employees = Employees.Where(e => e == SelectedEmployeeCmb).ToList();

            if (SelectedRole != null && SelectedRole.Name != "All")
                Employees = Employees.Where(e => e.Role == SelectedRole).ToList();

            if (SelectedDate != null && SelectedDate != DateTime.MinValue)
            {
                Employees = Employees.Where(e => (e.DateOfEmployment <= SelectedDate.AddDays(1)) && e.DateOfEmployment >= SelectedDate.Subtract(new TimeSpan(1, 0, 0, 0))).ToList();
            }

            OnPropertyChanged(nameof(Employees));
        }

        public void NullSelection()
        {
            string message = "You have not selected a client.";
            var exceptionWindow = new ExceptionWindow(message);
            exceptionWindow.ShowDialog();
        }

        //Implementation of the interface INotifyPropertyChanged 

        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged(string name)
        {
            if (this.PropertyChanged != null)
            {
                this.PropertyChanged(this, new PropertyChangedEventArgs(name));
            }
        }
    }
}
