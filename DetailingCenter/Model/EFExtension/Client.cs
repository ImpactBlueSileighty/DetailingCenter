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
                return Name + " " + SurName;
            }
        }
    }
}
