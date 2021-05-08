using DetailingCenter.Model.EF;
using DetailingCenter.View.Windows;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DetailingCenter.Model.EF.AppData;

namespace DetailingCenter.ViewModel
{
    class EditEmployeeWindow_VM : INotifyPropertyChanged
    {
        public string InputName { get; set; }

        public string InputSurname { get; set; }

        public List<Gender> Genders { get; private set; }
        public Gender SelectedGender { get; set; }

        public List<Role> Roles { get; private set; }
        public Role SelectedRole { get; set; }

        public DateTime SelectedDate { get; set; }

        public string WindowName { get; set; }

        private Employee _currentEmployee;
        public EditEmployeeWindow_VM(Employee SelectedEmployee)
        {
            _currentEmployee = SelectedEmployee;

            Genders = new List<Gender>();
            Genders.Add(new Gender
            {
                Name = "Select gender"
            });
            Genders.AddRange(context.Gender.ToList());

            Roles = new List<Role>();
            Roles.Add(new Role
            {
                Name = "Select role"
            });
            Roles.AddRange(context.Role.ToList());

            if (_currentEmployee != null)
            {
                InputName = _currentEmployee.Name;
                InputSurname = _currentEmployee.Surname;
                SelectedGender = _currentEmployee.Gender;
                SelectedRole = _currentEmployee.Role;
                SelectedDate = _currentEmployee.DateOfEmployment;

                WindowName = "Edit Employee";
            }
            else
            {
                SelectedGender = Genders[0];
                SelectedRole = Roles[0];
                WindowName = "Add Employee";
            }
        }

        public void SaveChanges()
        {
            if (!String.IsNullOrEmpty(InputName)
                 || !String.IsNullOrEmpty(InputSurname)
                 || !String.IsNullOrEmpty(SelectedDate.ToString()))
            {
                if (SelectedGender == Genders[0] || SelectedGender == null)
                {
                    string message = "You need to select gender.";
                    var exceptionWindow = new ExceptionWindow(message);
                    exceptionWindow.ShowDialog();
                }
                else if (SelectedRole == Roles[0] || SelectedRole == null)
                {
                    string message = "You need to select role.";
                    var exceptionWindow = new ExceptionWindow(message);
                    exceptionWindow.ShowDialog();
                }
                else
                {
                    if (_currentEmployee == null)
                    {
                        _currentEmployee = new Employee()
                        {
                            Name = InputName,
                            Surname = InputSurname,
                            Gender = SelectedGender,
                            Role = SelectedRole,
                            DateOfEmployment = SelectedDate
                        };
                    }
                    else
                    {
                        _currentEmployee.Name = InputName;
                        _currentEmployee.Surname = InputSurname;
                        _currentEmployee.Gender = SelectedGender;
                        _currentEmployee.Role = SelectedRole;
                        _currentEmployee.DateOfEmployment = SelectedDate;
                    }
                    context.SaveChanges();
                }
                    
            }
            else
            {
                string message = "You need to complete all the fields.";
                var exceptionWindow = new ExceptionWindow(message);
                exceptionWindow.ShowDialog();
            }

        }

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
