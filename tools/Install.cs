using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Management.Automation;
using System.Collections.ObjectModel;

    class Install
    {
        static void Main(string[] args)
        {
            using (PowerShell PSInstance = PowerShell.Create())
            {
                PSInstance.AddCommand("choco -v");
            }
        }
    }