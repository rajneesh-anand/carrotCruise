using System;
using System.Collections.Generic;
using System.Web;


    public class Connection
    {
        public static string GetConnection 
        {
            get
            {
              return System.Configuration.ConfigurationManager.ConnectionStrings["conStr"].ToString();
            }
        }
    }
