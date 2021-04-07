using DetailingCenter.Model.EF;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DetailingCenter.SampleData
{
    class SampleData
    {
        public ObservableCollection<Order> Orders { get; set; }

        public SampleData()
        {
            Orders = new ObservableCollection<Order>();
            Orders.Add(new Order()
            {
                CarModel = new CarModel()
                {
                    Name = "Impreza 22B",
                    CarMark = new CarMark()
                    {
                        Name = "Subaru"
                    }

                },

                Client = new Client()
                {
                    Name = "Edick",
                    SurName = "Egg",
                    Phone = "+7955992222",
                    Email = "llgmgll@mail.com"
                },

                Service = new Service()
                {
                    Name = "Wash",
                    ServiceType = new ServiceType()
                    {
                        Name = "Interior Detailing"
                    },

                    Cost = 299

                },

                OrderStatus = new OrderStatus()
                {
                    Name = "In Queue"
                },

                DateOfService = DateTime.Now


            }) ;


        }
    }
}
