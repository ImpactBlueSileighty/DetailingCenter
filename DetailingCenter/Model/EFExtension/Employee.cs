using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DetailingCenter.Model.EF
{
    public partial class Employee
    {
        public string NameFormat
        {
            get
            {
                return Name + " " + Surname;  
            }
        }

        public string DateFormat
        {
            get
            {
                return DateOfEmployment.ToString("d");
            }
        }
    }
}
