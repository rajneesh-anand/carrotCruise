using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;
using System.Net.Mail;
using System.Net;
using System.Data;
using CrystalDecisions.Shared;
using System.Web.Services;
using System.Collections;
using Shipping.ds;

namespace Shipping.WebForms
{
    public partial class Ledger : System.Web.UI.Page
    {
        SqlConnection cn = null;
        string sqlQry = null;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
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
                        con.Close();

                    }
                    ddlSearch.Items.Insert(0, new ListItem("-- Select Agent --", "0"));
                }

            }
        }


      
        protected void btnSearch_Click(object sender, EventArgs e)
        {

            DateTime dtFrom = Convert.ToDateTime(txtFrom.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
            DateTime dtTo = Convert.ToDateTime(txtTo.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);

            sqlQry = "select i.Invoice_Date,i.Invoice_Number,i.Comm_Amt,i.TDS,i.GST_Amount,i.Pass_Name,a.Name from Invoice as i, Agent as a where i.Agent_Name=a.AgentID and i.Agent_Name='" + ddlSearch.SelectedValue + "' and i.Invoice_Date between '" + dtFrom + "' and  '" + dtTo + "'";

            cn = new SqlConnection();
            cn.ConnectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            try
            {
                if (cn.State != ConnectionState.Open)
                    cn.Open();

                ReportDocument crystalReport = new ReportDocument();
                crystalReport.Load(Server.MapPath("~/Reports/AgentTDS.rpt"));
                AgentTDS dsCustomers = GetData(sqlQry);
                crystalReport.SetDataSource(dsCustomers);
                crystalReport.SetParameterValue("From", dtFrom);
                crystalReport.SetParameterValue("To", dtTo);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse
                (CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "TDS-REPORT");
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

        private AgentTDS GetData(string query)
        {
            string conString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection cn = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = cn;

                    sda.SelectCommand = cmd;
                    using (AgentTDS tds = new AgentTDS())
                    {
                        sda.Fill(tds, "DataTable1");
                        return tds;
                    }
                }
            }
        }
       
    }
}