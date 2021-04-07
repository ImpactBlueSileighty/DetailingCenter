using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DetailingCenter
{
    class ExceptionWindow_VM
    {
        public string MessageText { get; set; }
        
        public ExceptionWindow_VM(string message)
        {
            this.MessageText = message;
        }
    }
}
