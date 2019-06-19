using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;
using Newtonsoft.Json;
using Shipping.ds;

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
    public partial class AddInvoice : System.Web.UI.Page
    {
        public static string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        [WebMethod]
        public static string SaveInvoice(string empdata)
        {
            bool isUserInserted = false;
            string status = null;
            var serializeData = JsonConvert.DeserializeObject<List<Invoicett>>(empdata);

            using (var con = new SqlConnection(constr))
            {
                foreach (var data in serializeData)
                {

                    string sqlQuery = "select Invoice_Number from Invoice where Invoice_Number = '"+ data.Invoice_Number + "'";
                    using (var cmdin = new SqlCommand(sqlQuery))
                    {

                        cmdin.Connection = con;
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        var firstColumn = cmdin.ExecuteScalar();

                        if (firstColumn != null)
                        {
                            isUserInserted = true;
                        }
                        else
                        {
                            isUserInserted = false;
                        }

                    }
                    if (isUserInserted == false)
                    {


                        using (var cmd = new SqlCommand("INVOICE_CRUD"))                        {

                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@Action", "INSERT");
                            cmd.Parameters.AddWithValue("@Invoice_Number", data.Invoice_Number);
                            cmd.Parameters.AddWithValue("@Invoice_Date", data.Invoice_Date);
                            cmd.Parameters.AddWithValue("@Departure_Date", data.Departure_Date);
                            cmd.Parameters.AddWithValue("@Agent_Name",(data.Agent_Name).ToUpper());
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
                            cmd.Connection = con;
                            if (con.State == ConnectionState.Closed)
                            {
                                con.Open();
                            }
                            cmd.ExecuteNonQuery();

                        }


                        string sqlStringAccount = "INSERT INTO AccountData VALUES(@Credit_Account,@Credit_Amount,@Debit_Account,@Debit_Amount,@EntryType,@Invoice_Number)";
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
                        status = "dataNotExist";

                    }
                    else
                    {
                        status = "dataExist";
                    }
                }

                con.Close();

            }
            return status;

        }



        SqlConnection cn = null;
        SqlDataAdapter da = null;
        SqlDataReader dr = null;
        SqlCommand cmd = null;
        DataSet ds = null;
        string sqlQry = null;
        int Invoice_Number = 0;



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
                    using (SqlCommand cmd = new SqlCommand("SELECT agentID, Name FROM Agent ORDER BY Name"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        ddlSearch.DataSource = cmd.ExecuteReader();
                        ddlSearch.DataTextField = "Name";
                        ddlSearch.DataValueField = "agentID";
                        ddlSearch.DataBind();

                    }
                    ddlSearch.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Agent --", "0"));
                }
                if (Messages.SetEditFlagForInvoice == true)
                {
                    Invoice_Number = Convert.ToInt32(Request.QueryString["EmpNo"].ToString());
                    //FetchValueInEditMode();
                    //btnSave.Text = "UPDATE";
                }
                else
                {
                    GeneratingCustomerID();
                    txtInvoiceDate.Text = DateTime.Now.Date.ToString("dd/MM/yyyy");
                    txtDepartureDate.Text = DateTime.Now.Date.ToString("dd/MM/yyyy");
                }

            }


        }



        protected void btnSave_Click(object sender, EventArgs e)
        {

        }



        protected void Button3_Click(object sender, EventArgs e)
        {

            GeneratingCustomerID();
            CleanScreen();
        }
        protected void btnDownload_Click(object sender, EventArgs e)
        {

            string empid = (invoice.Text.Trim());

            sqlQry = "select a.Name,a.Address,a.City,a.State,a.GST,i.Invoice_Date,i.Invoice_Number,i.Pass_Name,i.Departure_Date,i.Cruise_Ship,i.Cabin,i.Cat_Bkg," +
                    "i.Gross_Amount,i.NCF,i.TAX,i.TDS,i.GTAX,i.Comm_Amt,i.GTotal,i.advance,i.Currency,i.ROE,i.HS,i.GST_Amount,i.Booking,i.Comm_Rate,i.Total,i.TDS_Rate,i.GST_Rate,i.Adults,i.Children,i.Infants,i.cbToken,i.MiscAmt from Invoice as i, Agent as a where i.Agent_Name=a.AgentID and i.Invoice_Number = '" + empid + "' ";



            string cs = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    if (con.State != ConnectionState.Open)
                        con.Open();

                    ReportDocument crystalReport = new ReportDocument();
                    crystalReport.Load(Server.MapPath("~/Reports/InvoiceReport.rpt"));
                    Invoice dsCustomers = GetData(sqlQry);
                    crystalReport.SetDataSource(dsCustomers);
                    CrystalReportViewer1.ReportSource = crystalReport;
                    crystalReport.ExportToHttpResponse
                    (CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "INVOICE_" + invoice.Text.Trim());
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    con.Close();
                }

            }
        }

        private static Invoice GetData(string query)
        {
            string conString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection cn = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = cn;

                    sda.SelectCommand = cmd;
                    using (Invoice inv = new Invoice())
                    {
                        sda.Fill(inv, "DataTable1");
                        return inv;
                    }
                }
            }
        }

        private void CleanScreen()
        {

            txtAdults.Text = "";
            txtChildren.Text = "";
            txtInfants.Text = "";

            txtGross.Text = "";
            txtGrossSecond.Text = "";
            txtGrossThird.Text = "";
            txtCommPer.Text = "";
            txtGrossAmt.Text = "";
            txtCommAmt.Text = "";

            txtGTotal.Text = "";

            txtGST.Text = "";
            txtROE.Text = "";
            txtGSTRate.Text = "";
          
            txtNationality.Text = "";
            txtPassName.Text = "";
            txtMisc.Text = "";
            txtToken.Text = "";



            ddlSearch.Focus();
        }

        private void GeneratingCustomerID()
        {
            try
            {

                string conString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
                cn = new SqlConnection(conString);

                using (SqlCommand cmd = new SqlCommand("SELECT dbo.GenerateInvoice()", cn))
                {
                    cn.Open();
                    invoice.Text = cmd.ExecuteScalar().ToString();

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cn.Close();
            }
        }
    }
}