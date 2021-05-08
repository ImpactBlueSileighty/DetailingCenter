using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DetailingCenter.Model.EF
{
    public partial class Client
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
                if (LastVisit != DateTime.Parse("01/01/01"))
                {
                    return LastVisit.ToString("d");
                }
                else
                {
                    return "Never";
                }

            }
        }

        public string PhoneFormat
        {
            get
            {
                if (Phone.Length == 11 )
                {
                    return "+" + Phone.Substring(0,1) + "(" + Phone.Substring(1,3) + ")" + Phone.Substring(4,3) + "-" + Phone.Substring(7,2) + "-" + Phone.Substring(9,2) ;
                } else
                {                 
                    return Phone;  
                }
                
            }
        }
    }


}
