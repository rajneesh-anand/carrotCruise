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
using CrystalDecisions.Shared;
using System.Web.Services;
using System.Collections;
using Shipping.ds;

namespace Shipping.WebForms
{
    public partial class Statement : System.Web.UI.Page
    {
      
        SqlDataAdapter da = null;
        DataSet ds = null;
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
                    ddlSearch.Items.Insert(0, new ListItem("--Select Agent--", "0"));
                }

            }
        }

       
        protected void btnSearch_Click(object sender, EventArgs e)
        {

            DateTime dtFrom = Convert.ToDateTime(txtFrom.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);
            DateTime dtTo = Convert.ToDateTime(txtTo.Text, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);

            sqlQry = "select i.Invoice_Date,i.Departure_Date,i.Invoice_Number,i.TotalINR,i.AdvanceINR,i.GTotal,i.advance,i.Pass_Name,a.Name from Invoice as i, Agent as a where i.Agent_Name=a.AgentID and i.Agent_Name  = '" + ddlSearch.SelectedValue + "' and i.Invoice_Date between '" + dtFrom + "' and  '" + dtTo + "'";

            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            SqlConnection cn = new SqlConnection(constr);


            da = new SqlDataAdapter(sqlQry, cn);
            ds = new DataSet();
            da.Fill(ds, "emp");

            if (ds == null || ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
            {

                string script = "alert(\"NO RECORDS AVAILABLE AS PER THE SEARCH CRITERIA !!!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                return;
            }
            else
            {
                ReportDocument crystalReport = new ReportDocument();
                crystalReport.Load(Server.MapPath("~/Reports/AgentStatement.rpt"));
                AgentStatement dsCustomers = GetData(sqlQry);
                crystalReport.SetDataSource(dsCustomers);
                crystalReport.SetParameterValue("From", dtFrom);
                crystalReport.SetParameterValue("To", dtTo);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse
                (CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "AGENT-STATEMENT");
            }

            cn.Close();
        }

        private AgentStatement GetData(string query)
        {
            string conString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            SqlCommand cmd = new SqlCommand(query);
            using (SqlConnection cn = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = cn;

                    sda.SelectCommand = cmd;
                    using (AgentStatement tds = new AgentStatement())
                    {
                        sda.Fill(tds, "DataTable1");
                        return tds;
                    }
                }
            }
        }

    }
}