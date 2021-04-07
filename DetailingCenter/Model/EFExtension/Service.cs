using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DetailingCenter.Model.EF
{
    public partial class Service
    {
        public string CostFormat
        {
            get
            {
                if ((Int32)Cost == 0)
                {
                    return "Free";
                }
                else
                {
                    return "$" + (Int32)Cost;
                }



            }
        }

     
    }
}
