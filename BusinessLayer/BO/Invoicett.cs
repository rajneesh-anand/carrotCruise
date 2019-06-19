using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


    public class Invoicett
    {
        public string Invoice_Number { get; set; }
        public DateTime Invoice_Date { get; set; }
        public DateTime Departure_Date { get; set; }
        public string Agent_Name { get; set; }
        public string Pass_Name { get; set; }
        public string Cruise_Ship { get; set; }
        public string Cruise { get; set; }
        public int Booking { get; set; }
        public string Cabin { get; set; }
        public string Cat_Bkg { get; set; }   
        public string Nationality { get; set; }
        public string Currency { get; set; }
        public int Adults { get; set; }
        public int Children { get; set; }
        public int Infants { get; set; }
        public int PAX { get; set; }
        public decimal Gross_Rate { get; set; }
        public decimal Gross_Rate_Third { get; set; }
        public decimal Gross_Rate_Second { get; set; }
        public decimal Gross_Amount { get; set; }
        public decimal Comm_Rate { get; set; }
        public decimal Comm_Amt { get; set; }
        public decimal NCFRate { get; set; }
        public decimal NCF { get; set; }
        public decimal TAXRate { get; set; }
        public decimal TAX { get; set; }
        public decimal GTAXRate { get; set; }
        public decimal GTAX { get; set; }
        public decimal HSRate { get; set; }
        public decimal HS { get; set; }
        public decimal GST_Rate { get; set; }
        public decimal GST_Amount { get; set; }
        public decimal TDS_Rate { get; set; }
        public decimal TDS { get; set; }
        public decimal MiscAmt { get; set; }
        public decimal advance { get; set; }
        public decimal AdvanceINR { get; set; }       
        public decimal ROE { get; set; }
        public string cbToken { get; set; }
        public decimal TotalINR { get; set; }
        public decimal GTotal { get; set; }
        public decimal Total { get; set; }

}

