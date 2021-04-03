using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DetailingCenter.Model.EF;
using static DetailingCenter.Model.EF.AppData;



namespace DetailingCenter
{
    class OrderPage_VM
    {
        public ObservableCollection<Order> Orders { get; set; }

        public OrderPage_VM()
        {
            Orders = new ObservableCollection<Order>();
            context.Order.ToList().ForEach(e=>Orders.Add(e));
            
            
        }
    }
}
