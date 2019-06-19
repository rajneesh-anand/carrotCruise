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
    public partial class AddPurchase : System.Web.UI.Page
    {

        public static string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

        [WebMethod]
        public static string SaveData(string empdata)
        {
            var serializeData = JsonConvert.DeserializeObject<List<Purchase>>(empdata);
            using (var con = new SqlConnection(constr))
            {
                foreach (var data in serializeData)
                {

                    string sqlStringPurchase = "INSERT INTO Purchase VALUES(@BillNumber, @Qnty,@Rate,@Currency,@ROE,@Amount,@ItemDetails,@PurchaseDate,@VendorName,@TotalAmount)";

                    using (var cmd = new SqlCommand(sqlStringPurchase))
                    {

                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@BillNumber", data.BillNumber);
                        cmd.Parameters.AddWithValue("@Qnty", data.Qnty);
                        cmd.Parameters.AddWithValue("@Rate", data.Rate);
                        cmd.Parameters.AddWithValue("@Currency", data.Currency);
                        cmd.Parameters.AddWithValue("@ROE", data.ROE);
                        cmd.Parameters.AddWithValue("@Amount", data.Amount);
                        cmd.Parameters.AddWithValue("@ItemDetails", data.ItemDetails);
                        cmd.Parameters.AddWithValue("@PurchaseDate", data.PurchaseDate);
                        cmd.Parameters.AddWithValue("@VendorName", data.VendorName);
                        cmd.Parameters.AddWithValue("@TotalAmount", data.TotalAmount);
                        cmd.Connection = con;
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        cmd.ExecuteNonQuery();

                    }
                }

                string sqlStringAccount = "INSERT INTO CommonAccount VALUES(@Name, @AccountType,@OpeningBalance)";
                using (var ncmd = new SqlCommand(sqlStringAccount))
                {

                        ncmd.CommandType = CommandType.Text;
                        ncmd.Parameters.AddWithValue("@Name", "fsfdf");
                        ncmd.Parameters.AddWithValue("@AccountType", "Assets");
                        ncmd.Parameters.AddWithValue("@OpeningBalance", 1000);

                        ncmd.Connection = con;

                        ncmd.ExecuteNonQuery();
                       
                }

                con.Close();



                
            }
            return null;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT agentID, Name FROM Agent where AccountType='Vendor' ORDER BY Name"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        ddlVendor.DataSource = cmd.ExecuteReader();
                        ddlVendor.DataTextField = "Name";
                        ddlVendor.DataValueField = "agentID";
                        ddlVendor.DataBind();

                    }
                    ddlVendor.Items.Insert(0, new ListItem("-- Select Vendor --", "0"));
                }

            }
        }
    }  
  
}