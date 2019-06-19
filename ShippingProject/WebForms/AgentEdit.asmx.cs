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
    /// Summary description for AgentEdit1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class AgentEdit1 : System.Web.Services.WebService
    {

        [WebMethod]
        public void GetAgentByName(int AgentId)
        {
            Vendor employee = new Vendor();

            string cs = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spAgentDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@AgentID";
                parameter.Value = AgentId;

                cmd.Parameters.Add(parameter);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {

                    employee.name = rdr["Name"].ToString();
                    employee.address = rdr["Address"].ToString();
                    employee.city = rdr["City"].ToString();
                    employee.state = rdr["State"].ToString();
                    employee.mobile = ((rdr.IsDBNull(4)) ? 0 : Convert.ToInt64(rdr["Mobile"]));
                    employee.phone = ((rdr.IsDBNull(5)) ? 0 : Convert.ToInt64(rdr["Phone"]));
                    employee.email = rdr["Email"].ToString();
                    employee.gst = rdr["GST"].ToString();

                }
            }
            System.Web.Script.Serialization.JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(employee));
        }
    }
}
