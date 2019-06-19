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
    /// Summary description for TTInvoiceService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class InvoiceService : System.Web.Services.WebService
    {

        [WebMethod]
        public void GetInvoice()
        {
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            List<Invoicett> employees = new List<Invoicett>();
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("sp_getInvoicesTT", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Invoicett employee = new Invoicett();
                    //employee.Id = Convert.ToInt32(rdr["Id"]);
                    employee.Invoice_Number = rdr["Invoice_Number"].ToString();
                    employee.Invoice_Date = Convert.ToDateTime(rdr["Invoice_Date"]);
                    employee.Departure_Date = Convert.ToDateTime(rdr["Departure_Date"]);
                    employee.Agent_Name = rdr["Name"].ToString();
                    employee.Gross_Amount = Convert.ToDecimal(rdr["Gross_Amount"]);
                    employee.Comm_Amt = Convert.ToDecimal(rdr["Comm_Amt"]);
                    employee.GTotal = Convert.ToDecimal(rdr["GTotal"]);

                    employees.Add(employee);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(employees));
        }

    }
}
