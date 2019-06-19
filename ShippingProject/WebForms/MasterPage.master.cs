using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Collections;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WebForms/WebFormLogout.aspx",true);
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WebForms/SearchLedger.aspx",true);
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Functions.Option = "Editp";
        Response.Redirect("~/WebForms/WebFormMembers.aspx");
    }
    protected void btnAddAgent_Click(object sender, EventArgs e)
    {
        Messages.SetEditFlagForAgent= false;
        Response.Redirect("~/WebForms/WebFormPublishers.aspx");
    }
    protected void btnAddInvoice_Click(object sender, EventArgs e)
    {
        Messages.SetEditFlagForInvoice = false;
        Response.Redirect("~/WebForms/AddInvoice.aspx");
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Functions.Option = "R";
        Response.Redirect("~/WebForms/WebFormBookTransaction.aspx");
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Functions.Source = "MEMBER";
        Response.Redirect("~/WebForms/WebFormLists.aspx");
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Functions.Source = "CATEGORY";
        Response.Redirect("~/WebForms/WebFormLists.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
      
        Response.Redirect("~/WebForms/InvoiceList.aspx",true);
    }
    protected void LinkButton9_Click(object sender, EventArgs e)
    {
        Functions.Source = "BOOK_MASTER";
        Response.Redirect("~/WebForms/WebFormLists.aspx");
    }
    protected void LinkButton10_Click(object sender, EventArgs e)
    {
        Functions.Source = "AUTHOR";
        Response.Redirect("~/WebForms/WebFormLists.aspx");
    }
    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        Functions.Option = "B";
        Response.Redirect("~/WebForms/WebFormBookTransaction.aspx");
    }
    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        Functions.Option = "D";
        Response.Redirect("~/WebForms/WebFormBookTransaction.aspx");
    }
   

    protected void btnAgentList_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WebForms/AgentList.aspx");
    }

    protected void btnStatement_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/WebForms/SearchStatement.aspx");
    }

    protected void btnBackUp_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
        SqlConnection cn = new SqlConnection(constr);
        
        string backupDIR = "C:\\BackupDB";  
        if (!System.IO.Directory.Exists(backupDIR))  
        {  
            System.IO.Directory.CreateDirectory(backupDIR);  
        }  
        try  
        {  
            cn.Open();  
            SqlCommand cmd = new SqlCommand("backup database Shipping to disk='" + backupDIR + "\\" + DateTime.Now.ToString("ddMMyyyy_HHmmss") + ".Bak'",cn);
            cmd.ExecuteNonQuery();  
             ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowSuccess", "javascript:alert('Done ! Backup Successful');", true);
            cn.Close();  
          
        }  
        catch (Exception ex)  
        {  
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowSuccess", "javascript:alert('ERROR ! Backup Failed');", true);
        }  
    }  
   }

  

