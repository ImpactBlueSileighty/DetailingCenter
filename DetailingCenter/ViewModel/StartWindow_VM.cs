using DetailingCenter.Model.EF;
using DetailingCenter.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DetailingCenter
{
    class StartWindow_VM
    {
        public string Role { get; set; }
        public string Name { get; set; }

        public string Visibility { get; set; }

        
        

        private Employee _currentEmployee;
        public StartWindow_VM(Employee SelectedEmployee)
        {
            

            _currentEmployee = SelectedEmployee;

            Role = _currentEmployee.Role.Name;
            Name = _currentEmployee.NameFormat;

            if(_currentEmployee.Role.Name == "Worker")
            {
                Visibility = "Hidden";
            }
        }

        

    }
}
