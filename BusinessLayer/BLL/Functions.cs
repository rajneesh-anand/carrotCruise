using System;
using System.Configuration;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Collections;
using System.Text.RegularExpressions;

public class Functions
{
        public static string Option = "";        
        public static string Source = "";
        public static string FindRecord = "";
        
    
        public static Controller CreateController()
        {
            var dataAccess = DataAccessFactory.GetDataAccess();
            return new Controller(dataAccess);
        }

        // Function to remove any blanks
        public static string ApplyTrim(string Chain)
        {
            Chain = Chain.Trim(); 
            return Chain;
        }

        // Function to validate email addresses
        public static bool Validate_Email(string Chain)
        {
            bool status = false;
            string Expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
            if (!Regex.IsMatch(Chain, Expresion))
            {
                status = true;
            }
            return status;
        }

        // Function to validate only numbers in a field
        public static bool Validate_OnlyNumbers(string Chain)
        {
            bool status = false;
            for (int i = 0; i < Chain.Length; i++)
            {
                if (!Char.IsNumber(Chain[i]))
                {
                    status = true;
                    break;
                }
            }
            return status;
        }

       // Function to clean the controls on a form (Only TextBox)
       public static void CleanScreen(System.Web.UI.ControlCollection strWebForm)    
       {         
        /* foreach (Control strControl in strWebForm)
         {
             if (strControl.GetType().ToString().Equals("System.Web.UI.WebControls.TextBox"))
             {
                 ((TextBox)strControl).Text = string.Empty;
             }
         }*/
       }

       // Function to check existence of numbers in names
        public static bool Validate_onlyLetters(string Chain)
        {
            bool Result = false;
            for (int i = 0; i < Chain.Length; i++)
            {
                if (Char.IsNumber(Chain[i]))
                {
                    Result = true;
                    break;
                }
            }
            return Result;
        }

        // Function to remove any tab spaces     
        public static string Removtab(string Chain, string Converted)
        {
            Chain = Chain.Trim();
            while (Chain.IndexOf("  ", 0) != -1)
            {
                Chain = (Chain.Replace("  ", " "));
            }
            if (Converted == "UPP")
            {
                Chain = Chain.ToUpper();
            }
            if (Converted == "1UPP") // Organize first letter capitalized and following in Lower case
            {
                Chain = Chain.ToLower();
                Chain = System.Threading.Thread.CurrentThread.CurrentCulture.TextInfo.ToTitleCase(Chain);
            }
            return Chain;
        }

        public Functions(){}
    }


