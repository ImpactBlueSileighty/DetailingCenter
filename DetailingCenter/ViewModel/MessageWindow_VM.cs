using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DetailingCenter
{
    class MessageWindow_VM
    {
        
        public string MessageText { get; set; }

        public MessageWindow_VM(string message)
        {
            
            this.MessageText = message;
        }
        
        
    }
}
