using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DetailingCenter.Model.EF
{
    public partial class ServiceType
    {
        public string ServiceTypeFormat
        {
            get
            {
                return Name + ": ";
            }
        }
    }
}
