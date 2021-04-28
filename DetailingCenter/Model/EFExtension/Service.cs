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

        public string DurationFormat
        {
            get
            {
                if (!Duration.ToString().EndsWith("00") && Duration != 0)
                {
                    if (Math.Truncate(Duration) != 0)
                    {
                        return Math.Truncate(Duration).ToString() + " h " + Math.Round(((Duration - Math.Truncate(Duration)) * 60)).ToString() + " m ";
                    }
                    else
                    {
                        return Math.Round((Duration * 60)).ToString() + " m";
                    }



                }
                else
                {
                    return Math.Truncate(Duration).ToString() + " h";
                }


            }
        }

        public string DescriptionFormat
        {
            get
            {
                if (String.IsNullOrEmpty(Description))
                {
                    return "No Description";
                }
                else
                {
                    return Description;
                }
            }
        }
    }
}
