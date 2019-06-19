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
    /// Summary description for VenderList
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class VenderList : System.Web.Services.WebService
    {

        [WebMethod]
        public void GetVendor()
        {
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            List<Vendor> employees = new List<Vendor>();
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand("sp_VendorList", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Vendor employee = new Vendor();
                    employee.agentid= Convert.ToInt32(rdr["AgentID"]);
                    employee.name = rdr["Name"].ToString();
                    employee.city = rdr["City"].ToString();
                    employee.state = rdr["State"].ToString();
                    employee.mobile = Convert.ToInt64(rdr["Mobile"]);
                    employee.gst = rdr["GST"].ToString();
                   

                    employees.Add(employee);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(employees));
        }

    }
}
