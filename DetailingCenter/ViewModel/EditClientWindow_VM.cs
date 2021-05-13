using DetailingCenter.Model.EF;
using DetailingCenter.View.Windows;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using static DetailingCenter.Model.EF.AppData;

namespace DetailingCenter
{
    class EditClientWindow_VM : INotifyPropertyChanged
    {
        public string InputName { get; set; }

        public string InputSurname { get; set; }

        public string InputPhone { get; set; }

        public string InputEmail { get; set; }

        public List<Gender> Genders { get; private set; }
        public Gender SelectedGender { get; set; }

        public string WindowName { get; set; }

        private Client _currentClient;

        //Constructor 
        public EditClientWindow_VM(Client SelectedClient)
        {
            _currentClient = SelectedClient;

            Genders = new List<Gender>();
            Genders.Add(new Gender
            {
                Name = "Select gender"
            });

            Genders.AddRange(context.Gender.ToList());


            if (_currentClient != null)
            {
                InputName = _currentClient.Name;
                InputSurname = _currentClient.Surname;
                InputPhone = _currentClient.Phone;
                InputEmail = _currentClient.Email;
                SelectedGender = _currentClient.Gender;



                WindowName = "Edit Client";
            }
            else
            {
                SelectedGender = Genders[0];
                WindowName = "Add Client";
            }
        }

        public void SaveChanges() // Edit or Add Order data and save it to DB
        {
            string emailPattern = @"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";

            if (!String.IsNullOrEmpty(InputName)
                || !String.IsNullOrEmpty(InputSurname)
                || !String.IsNullOrEmpty(InputEmail)
                || !String.IsNullOrEmpty(InputPhone)) 
            {
                if (InputPhone.Length < 11 || !IsDigitsOnly(InputPhone))
                {
                    string message = "Phone must have 11 digits.";
                    var exceptionWindow = new ExceptionWindow(message);
                    exceptionWindow.ShowDialog();
                }
                else if (Regex.IsMatch(InputEmail, emailPattern) == false)
                {
                    string message = "Incorrect Email format.";
                    var exceptionWindow = new ExceptionWindow(message);
                    exceptionWindow.ShowDialog();
                }
                else if (SelectedGender == Genders[0] || SelectedGender == null)
                {
                    string message = "You need to select gender.";
                    var exceptionWindow = new ExceptionWindow(message);
                    exceptionWindow.ShowDialog();
                }
                else
                {
                    if (_currentClient == null)
                    {

                        _currentClient = new Client()
                        {
                            Name = InputName,
                            Surname = InputSurname,
                            Phone = InputPhone,
                            Email = InputEmail,
                            Gender = SelectedGender,
                            LastVisit = DateTime.Parse("01/01/01"),

                        };
                        context.Client.Add(_currentClient);


                    }
                    else
                    {
                        _currentClient.Name = InputName;
                        _currentClient.Surname = InputSurname;
                        _currentClient.Phone = InputPhone;
                        _currentClient.Email = InputEmail;
                        _currentClient.Gender = SelectedGender;
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

        bool IsDigitsOnly(string str)
        {
            int i = 11;
            foreach (char c in str)
            {
                if (c < '0' || c > '9')
                {
                    i--;


                }


            }

            if (i == 11)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        // INotifyPropertyChanged interface implementation 
        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged(string name)
        {
            if (this.PropertyChanged != null)
                this.PropertyChanged(this, new PropertyChangedEventArgs(name));
        }
    }
}
