using Newtonsoft.Json;
using System;
using System.Collections;
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
    public partial class TTInvoiceEdit : System.Web.UI.Page
    {
        public static string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        [WebMethod]
        public static string UpdateInvoice(string empdata)
        {

            var serializeData = JsonConvert.DeserializeObject<List<Invoicett>>(empdata);

            using (var con = new SqlConnection(constr))
            {
                foreach (var data in serializeData)
                {
                    using (var cmd = new SqlCommand("INVOICE_CRUD"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@Action", "UPDATE");
                        cmd.Parameters.AddWithValue("@Invoice_Number", data.Invoice_Number);
                        cmd.Parameters.AddWithValue("@Invoice_Date", data.Invoice_Date);
                        cmd.Parameters.AddWithValue("@Departure_Date", data.Departure_Date);
                        cmd.Parameters.AddWithValue("@Agent_Name", (data.Agent_Name).ToUpper());
                        cmd.Parameters.AddWithValue("@Pass_Name", (data.Pass_Name).ToUpper());
                        cmd.Parameters.AddWithValue("@Nationality", (data.Nationality).ToUpper());
                        cmd.Parameters.AddWithValue("@Currency", data.Currency);
                        cmd.Parameters.AddWithValue("@Cruise_Ship", (data.Cruise_Ship).ToUpper());
                        cmd.Parameters.AddWithValue("@Cruise", (data.Cruise).ToUpper());
                        cmd.Parameters.AddWithValue("@Booking", data.Booking);
                        cmd.Parameters.AddWithValue("@Cabin", (data.Cabin).ToUpper());
                        cmd.Parameters.AddWithValue("@Cat_Bkg", (data.Cat_Bkg).ToUpper());
                        cmd.Parameters.AddWithValue("@Adults", data.Adults);
                        cmd.Parameters.AddWithValue("@Children", data.Children);
                        cmd.Parameters.AddWithValue("@Infants", data.Infants);
                        cmd.Parameters.AddWithValue("@PAX", data.PAX);
                        cmd.Parameters.AddWithValue("@Gross_Rate", data.Gross_Rate);
                        cmd.Parameters.AddWithValue("@Gross_Rate_Second", data.Gross_Rate_Second);
                        cmd.Parameters.AddWithValue("@Gross_Rate_Third", data.Gross_Rate_Third);
                        cmd.Parameters.AddWithValue("@Gross_Amount", data.Gross_Amount);
                        cmd.Parameters.AddWithValue("@Comm_Rate", data.Comm_Rate);
                        cmd.Parameters.AddWithValue("@Comm_Amt", data.Comm_Amt);
                        cmd.Parameters.AddWithValue("@GST_Rate", data.GST_Rate);
                        cmd.Parameters.AddWithValue("@GST_Amount", data.GST_Amount);
                        cmd.Parameters.AddWithValue("@NCFRate", data.NCFRate);
                        cmd.Parameters.AddWithValue("@NCF", data.NCF);
                        cmd.Parameters.AddWithValue("@TAXRate", data.TAXRate);
                        cmd.Parameters.AddWithValue("@TAX", data.TAX);
                        cmd.Parameters.AddWithValue("@GTAXRate", data.GTAXRate);
                        cmd.Parameters.AddWithValue("@GTAX", data.GTAX);
                        cmd.Parameters.AddWithValue("@HSRate", data.HSRate);
                        cmd.Parameters.AddWithValue("@HS", data.HS);
                        cmd.Parameters.AddWithValue("@TDS", data.TDS);
                        cmd.Parameters.AddWithValue("@TDS_Rate", data.TDS_Rate);
                        cmd.Parameters.AddWithValue("@MiscAmt", data.MiscAmt);
                        cmd.Parameters.AddWithValue("@advance", data.advance);
                        cmd.Parameters.AddWithValue("@AdvanceINR", data.AdvanceINR);
                        cmd.Parameters.AddWithValue("@GTotal", data.GTotal);
                        cmd.Parameters.AddWithValue("@ROE", data.ROE);
                        cmd.Parameters.AddWithValue("@cbToken", data.cbToken);
                        cmd.Parameters.AddWithValue("@TotalINR", data.TotalINR);
                        cmd.Parameters.AddWithValue("@Total", data.Total);

                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        cmd.ExecuteNonQuery();
                    }


                    string sqlStringAccount = "Update AccountData  Set Credit_Account=@Credit_Account, Credit_Amount=@Credit_Amount,Debit_Account=@Debit_Account,Debit_Amount=@Debit_Amount,EntryType=@EntryType where Invoice_Number = '" + data.Invoice_Number +"'";
                    using (var ncmd = new SqlCommand(sqlStringAccount))
                    {

                        ncmd.CommandType = CommandType.Text;
                        ncmd.Parameters.AddWithValue("@Debit_Account", "CarrotCruise");
                        ncmd.Parameters.AddWithValue("@Debit_Amount", data.TotalINR);
                        ncmd.Parameters.AddWithValue("@Credit_Account", data.Agent_Name);
                        ncmd.Parameters.AddWithValue("@Credit_Amount", data.TotalINR);
                        ncmd.Parameters.AddWithValue("@EntryType", "Invoice");
                        ncmd.Parameters.AddWithValue("@Invoice_Number", data.Invoice_Number);

                        ncmd.Connection = con;
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        ncmd.ExecuteNonQuery();

                    }

                }

                con.Close();

            }
            return null;

        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ArrayList currency = new ArrayList();
              
                currency.Add("INR");
                currency.Add("EURO");
                currency.Add("USD");

                foreach (object cur in currency)
                {
                    ddlCurrency.Items.Add(new System.Web.UI.WebControls.ListItem(cur.ToString(), cur.ToString()));
                }

                string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT AgentID, Name FROM Agent ORDER BY Name"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        ddlSearch.DataSource = cmd.ExecuteReader();
                        ddlSearch.DataTextField = "Name";
                        ddlSearch.DataValueField = "AgentID";
                        ddlSearch.DataBind();
                        con.Close();

                    }

                    string data = Request.QueryString["IN"];
                    string sqlQuery = ("SELECT a.Name,i.Currency FROM Agent a, Invoice i where i.Agent_Name=a.AgentID and i.Invoice_Number = '" + data + "'");
                    using (SqlCommand cmd = new SqlCommand(sqlQuery))
                    {
                        cmd.Connection = con;
                        con.Open();
                        DataTable dt = new DataTable();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(dt);
                        ddlSearch.Items.FindByText(dt.Rows[0][0].ToString()).Selected = true;

                        //ddlSearch.SelectedValue = dt.Rows[0][0].ToString();
                        ddlCurrency.SelectedValue = dt.Rows[0][1].ToString();

                        con.Close();
                    }


                }

              
            }
        }

    }
}