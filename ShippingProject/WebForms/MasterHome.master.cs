using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebForms_MasterHome : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtAdminLogout_Click(object sender, EventArgs e)
    {
        Session["USERNAME"] = null;
        Response.Redirect("~/WebForms/WebFormLogin.aspx");
    }
    protected void btnInvoice_Click(object sender, EventArgs e)
    {
        Messages.SetEditFlagForInvoice = false;
        Response.Redirect("~/WebForms/AddInvoice.aspx");
    }

    protected void btnInvoiceTT_Click(object sender, EventArgs e)
    {
        Messages.SetEditFlagForInvoice = false;
        Response.Redirect("~/WebForms/AddInvoiceTT.aspx");
    }
    protected void btnAgent_Click(object sender, EventArgs e)
    {
        Messages.SetEditFlagForAgent= false;
        Response.Redirect("~/WebForms/WebFormPublishers.aspx");
    }
    protected void btnVendor_Click(object sender, EventArgs e)
    {
        Messages.SetEditFlagForVendor = false;
        Response.Redirect("~/WebForms/AddVendor.aspx");
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
            SqlCommand cmd = new SqlCommand("backup database Shipping to disk='" + backupDIR + "\\" + DateTime.Now.ToString("ddMMyyyy_HHmmss") + ".Bak'", cn);
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
