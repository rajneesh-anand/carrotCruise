using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shipping.WebForms
{
    public partial class EditVendor : System.Web.UI.Page
    {

        public static string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        [WebMethod]
        public static string UpdateVendor(string empdata)
        {

            var serializeData = JsonConvert.DeserializeObject<List<Vendor>>(empdata);

            using (var con = new SqlConnection(constr))
            {
                foreach (var data in serializeData)
                {
                    using (var cmd = new SqlCommand("EditVendor"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@Action", "UPDATE");
                        cmd.Parameters.AddWithValue("@AgentID", data.agentid);
                        cmd.Parameters.AddWithValue("@Name", data.name);
                        cmd.Parameters.AddWithValue("@Address", data.address);
                        cmd.Parameters.AddWithValue("@City", data.city);
                        cmd.Parameters.AddWithValue("@State", data.state);
                        cmd.Parameters.AddWithValue("@Email", data.email);
                        cmd.Parameters.AddWithValue("@Phone", data.phone);
                        cmd.Parameters.AddWithValue("@Mobile", data.mobile);
                        cmd.Parameters.AddWithValue("@GST", data.gst);
                        cmd.Parameters.AddWithValue("@AccountType", data.accounttype);
                        cmd.Parameters.AddWithValue("@Status", data.status);

                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            return null;
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT state FROM state"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        ddlState.DataSource = cmd.ExecuteReader();
                        ddlState.DataTextField = "state";
                        ddlState.DataValueField = "state";
                        ddlState.DataBind();
                    }


                }
            }


        }
    }
}