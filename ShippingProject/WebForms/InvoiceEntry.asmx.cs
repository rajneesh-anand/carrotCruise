using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace Shipping.WebForms
{
    /// <summary>
    /// Summary description for TTInvoiceEntry
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class InvoiceEntry : System.Web.Services.WebService
    {
        [WebMethod]
        public void GetInvoiceById(string Invoice_Number)
        {
            Invoicett employee = new Invoicett();

            string cs = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spTTInvoiceDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@Id";
                parameter.Value = Invoice_Number;

                cmd.Parameters.Add(parameter);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {

                    employee.Invoice_Number = rdr["Invoice_Number"].ToString();
                    employee.Invoice_Date = Convert.ToDateTime(rdr["Invoice_Date"]);
                    employee.Departure_Date = Convert.ToDateTime(rdr["Departure_Date"]);
                    //employee.Agent_Name = rdr["Name"].ToString();                  
                    employee.Pass_Name = (rdr["Pass_Name"].ToString()).ToUpper();
                    employee.Cruise = (rdr["Cruise"].ToString()).ToUpper();
                    employee.Cruise_Ship = (rdr["Cruise_Ship"].ToString()).ToUpper();
                    employee.Cabin = (rdr["Cabin"].ToString()).ToUpper();
                    employee.Booking = Convert.ToInt32(rdr["Booking"]);
                    employee.Cat_Bkg = (rdr["Cat_Bkg"].ToString()).ToUpper();
                    employee.Adults = Convert.ToInt32(rdr["Adults"]);
                    employee.Children = Convert.ToInt32(rdr["Children"]);
                    employee.Infants = Convert.ToInt32(rdr["Infants"]);
                    employee.Nationality = rdr["Nationality"].ToString();                   
                    employee.Gross_Rate = Convert.ToDecimal(rdr["Gross_Rate"]);
                    employee.Gross_Rate_Second = Convert.ToDecimal(rdr["Gross_Rate_Second"]);
                    employee.Gross_Rate_Third = Convert.ToDecimal(rdr["Gross_Rate_Third"]);
                    employee.Comm_Rate = Convert.ToDecimal(rdr["Comm_Rate"]);
                    employee.Comm_Amt = Convert.ToDecimal(rdr["Comm_Amt"]);
                    employee.NCFRate = Convert.ToDecimal(rdr["NCFRate"]);
                    employee.NCF = Convert.ToDecimal(rdr["NCF"]);
                    employee.TAXRate = Convert.ToDecimal(rdr["TAXRate"]);
                    employee.TAX = Convert.ToDecimal(rdr["TAX"]);
                    employee.GTAXRate = Convert.ToDecimal(rdr["GTAXRate"]);
                    employee.GTAX = Convert.ToDecimal(rdr["GTAX"]);
                    employee.HS = Convert.ToDecimal(rdr["HS"]);
                    employee.HSRate = Convert.ToDecimal(rdr["HSRate"]);
                    employee.MiscAmt = Convert.ToDecimal(rdr["MiscAmt"]);
                    employee.GST_Rate = Convert.ToDecimal(rdr["GST_Rate"]);
                    employee.GST_Amount = Convert.ToDecimal(rdr["GST_Amount"]);
                    employee.TDS_Rate = Convert.ToDecimal(rdr["TDS_Rate"]);
                    employee.TDS = Convert.ToDecimal(rdr["TDS"]);
                    employee.cbToken = rdr["cbToken"].ToString();
                    employee.advance = Convert.ToDecimal(rdr["advance"]);
                    employee.ROE = Convert.ToDecimal(rdr["ROE"]);
                    employee.Gross_Amount = Convert.ToDecimal(rdr["Gross_Amount"]);
                    employee.Total = Convert.ToDecimal(rdr["Total"]);
                    employee.GTotal = Convert.ToDecimal(rdr["GTotal"]);

                }
            }
            System.Web.Script.Serialization.JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(employee));
        }
    }
}
