using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;
using Shipping.ds;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shipping.WebForms
{
    public partial class InvoiceList : System.Web.UI.Page
    {
      

        [System.Web.Services.WebMethod]
        public  static string printInvoice(string invoice_number)
        {

            //InvoiceList insInv = new InvoiceList();
            //insInv.download_invoice(invoice_number);


            var server = HttpContext.Current.Server;


            string sqlQry = "select a.Name,a.Address,a.City,a.State,a.GST,i.Invoice_Date,i.Invoice_Number,i.Pass_Name,i.Departure_Date,i.Cruise_Ship,i.Cabin,i.Cat_Bkg," +
                        "i.Gross_Amount,i.NCF,i.TAX,i.TDS,i.GTAX,i.Comm_Amt,i.GTotal,i.advance,i.Currency,i.ROE,i.HS,i.GST_Amount,i.Booking,i.Comm_Rate,i.Total,i.TDS_Rate,i.GST_Rate,i.Adults,i.Children,i.Infants,i.cbToken,i.MiscAmt from Invoice as i, Agent as a where i.Agent_Name=a.AgentID and i.Invoice_Number = '" + invoice_number + "' ";

            string cs = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                try
                {
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    ReportDocument crystalReport = new ReportDocument();
                    crystalReport.Load(server.MapPath("~/Reports/InvoiceReport.rpt"));
                    Invoice dsCustomers = GetData(sqlQry);
                    crystalReport.SetDataSource(dsCustomers);
                    CrystalReportViewer CrystalReportViewer1 = new CrystalReportViewer();
                    CrystalReportViewer1.ReportSource = crystalReport;

                    // crystalReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat,server, true, "Invoice_CC" + invoice_number);

                    crystalReport.ExportToDisk(ExportFormatType.PortableDocFormat, @"E:\" + "INVOICE_" + invoice_number + ".pdf");

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
            return "PDF-Invoice generated succesfully !";
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

        //public void download_invoice(string Inv)
        //{

        //    string empid = (Inv.Trim());

        //    string sqlQry = "select a.Name,a.Address,a.City,a.State,a.GST,i.Invoice_Date,i.Invoice_Number,i.Pass_Name,i.Departure_Date,i.Cruise_Ship,i.Cabin,i.Cat_Bkg," +
        //            "i.Gross_Amount,i.NCF,i.TAX,i.TDS,i.GTAX,i.Comm_Amt,i.GTotal,i.advance,i.Currency,i.ROE,i.HS,i.GST_Amount,i.Booking,i.Comm_Rate,i.Total,i.TDS_Rate,i.GST_Rate,i.Adults,i.Children,i.Infants,i.cbToken,i.MiscAmt from Invoice as i, Agent as a where i.Agent_Name=a.AgentID and i.Invoice_Number = '" + empid + "' ";



        //    string cs = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        try
        //        {
        //            if (con.State != ConnectionState.Open)
        //                con.Open();

                   
        //            ReportDocument crystalReport = new ReportDocument();
        //            crystalReport.Load(Server.MapPath(@"~/Reports/InvoiceReport.rpt"));
        //            //crystalReport.Load(@"E:\VS_Workspace\CarrotCruiseNew\ShippingProject\Reports\InvoiceReport.rpt");

        //            Invoice dsCustomers = GetData(sqlQry);
        //            crystalReport.SetDataSource(dsCustomers);
        //            CrystalReportViewer1.ReportSource = crystalReport;
        //            crystalReport.ExportToHttpResponse
        //            (CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "INVOICE_" + empid);
        //        }
        //        catch (Exception ex)
        //        {
        //            throw ex;
        //        }
        //        finally
        //        {
        //            con.Close();
        //        }

        //    }

        //}


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

            }

        }


    }
}