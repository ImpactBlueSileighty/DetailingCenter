using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DetailingCenter.Model.EF
{
    public partial class Order
    {
        public string DateFormat
        {

            get
            {
                if (DateOfService.Date.ToString("d") == DateTime.Now.ToString("d"))
                {
                    return "Today";
                }
                else
                { return DateOfService.Date.ToString("d"); }
            }
        }
        public string CarPhotoFormat
        {
            get
            {
                var a= System.Reflection.Assembly.GetExecutingAssembly().Location;
                return a.Remove(a.LastIndexOf('\\')) + CarPhotoPath;
            }
        }
    }
}
