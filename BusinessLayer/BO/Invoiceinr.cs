using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


public class Invoiceinr
{    
    public int Invoice_Number { get; set; }
    public DateTime Invoice_Date { get; set; }
    public DateTime Departure_Date { get; set; }
    public string  Agent_Name { get; set; }
    public string Pass_Name { get; set; }
    public string Nationality { get; set; }
    public string Currency { get; set; }
    public int Adults { get; set; }
    public int Kids { get; set; }
    public int Infants { get; set; }
    public int PAX { get; set; }
    public decimal Rate_Adults { get; set; }
    public decimal Rate_Infants { get; set; }
    public decimal Rate_Kids { get; set; }  
    public decimal Gross_Amount { get; set; }
    public decimal Comm_Rate { get; set; }
    public decimal Comm_Amount { get; set; }
    public decimal GST_Rate { get; set; }
    public decimal GST_Amount { get; set; }
    public decimal Bank_Rate { get; set; }
    public decimal Bank_Amount { get; set; }
    public decimal Misc_Amount { get; set; }
    public decimal Advance_Amount { get; set; }
    public decimal Advance_Amount_INR { get; set; }
    public decimal GrandTotal_Amount { get; set; }
    public decimal ROE { get; set; }
    public string Token { get; set; }
    public string Particulars { get; set; }
    public string Name { get; set; }
    public string Invoice_Type { get; set; }


}

