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
    public partial class AddVendor : System.Web.UI.Page
    {
        int agentID = 0;
        string sqlQry = null;

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
                    ddlState.Items.Insert(0, new ListItem("--Select State--", "0"));
                }
                if (Messages.SetEditFlagForVendor == true)
                {
                    agentID = Convert.ToInt32(Request.QueryString["EmpNo"].ToString());
                    FetchValueInEditMode();
                    btnSave.Text = "UPDATE";
                }

            }

        }

        private void FetchValueInEditMode()
        {
            string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            SqlConnection cn = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("select Name,Address,City,State,GST,Phone,Email,Mobile from Agent where AgentID=" + agentID, cn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            txtName.Text = dt.Rows[0][0].ToString();
            txtAddress.Text = dt.Rows[0][1].ToString();
            txtCity.Text = dt.Rows[0][2].ToString();
            ddlState.SelectedValue = dt.Rows[0][3].ToString();
            txtGST.Text = dt.Rows[0][4].ToString();
            txtPhone.Text = dt.Rows[0][5].ToString();
            txtEmail.Text = dt.Rows[0][6].ToString();
            txtMobile.Text = dt.Rows[0][7].ToString();

        }


        protected void btnSave_Click(object sender, EventArgs e)
        {

            try
            {
                if (Messages.SetEditFlagForVendor == true)
                {

                    //if (ddlState.SelectedIndex == 0)
                    //{
                    //    string script = "alert(\"Please select state\");";
                    //    ScriptManager.RegisterStartupScript(this, GetType(),
                    //                          "ServerControlScript", script, true);
                    //    ddlState.Focus();
                    //    return;
                    //}

                    agentID = Convert.ToInt32(Request.QueryString["EmpNo"].ToString());
                    double mobile = (string.IsNullOrEmpty(txtMobile.Text.Trim())) ? 0 : Convert.ToDouble(txtMobile.Text.Trim());
                    double phone = (string.IsNullOrEmpty(txtPhone.Text.Trim())) ? 0 : Convert.ToDouble(txtPhone.Text.Trim());
                    sqlQry = "update Agent set Name='" + txtName.Text.Trim().ToUpper() + "',Address='" + txtAddress.Text.Trim().ToUpper() + "',City='" + txtCity.Text.Trim().ToUpper() + "',State='" + ddlState.SelectedValue.ToUpper() + "',Mobile= " + mobile + ",GST='" + txtGST.Text.Trim().ToUpper() + "',Phone=" + phone + ",Email='" + txtEmail.Text.ToLower() + "' where AgentID=" + agentID;
                    string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
                    SqlConnection cn = new SqlConnection(constr);
                    SqlCommand cmd = new SqlCommand(sqlQry, cn);
                    cn.Open();
                    int result = cmd.ExecuteNonQuery();
                    cn.Close();
                    Messages.SetEditFlagForVendor = false;
                    if (result == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowSuccess", "javascript:alert('Record Updated Successfully');", true);
                    }
                    Response.Redirect("~/WebForms/AgentList.aspx");

                }
                else
                {

                    //if (ddlState.SelectedIndex == 0)
                    //{
                    //    ddlState.Focus();
                    //    string script = "alert(\"Please select state\");";
                    //    ScriptManager.RegisterStartupScript(this, GetType(),
                    //                          "ServerControlScript", script, true);
                    //    return;
                    //}
                    Vendor vendor = new Vendor();

                    vendor.agentid = 0;

                    vendor.name = txtName.Text.Trim().ToUpper();
                    vendor.address = txtAddress.Text.Trim().ToUpper();
                    vendor.city = txtCity.Text.Trim().ToUpper();
                    vendor.state = ddlState.SelectedValue.ToUpper();
                    vendor.gst = txtGST.Text.Trim().ToUpper();
                    vendor.phone = (string.IsNullOrEmpty(txtPhone.Text.Trim())) ? 0 : Convert.ToDouble(txtPhone.Text.Trim());
                    vendor.mobile = (string.IsNullOrEmpty(txtMobile.Text.Trim())) ? 0 : Convert.ToDouble(txtMobile.Text.Trim());
                    vendor.email = txtEmail.Text.Trim().ToLower();
                    vendor.accounttype = "Vendor";

                    var controller = Functions.CreateController();
                    int Result = -1;
                    Result = controller.Save(vendor);
                    if (Result == 0)
                    {
                        if (Functions.Option.Equals("Add"))
                        {
                            LabelInformation.ForeColor = System.Drawing.Color.Blue;
                            LabelInformation.Text = Messages.SaveMessage;

                        }
                        else
                        {

                            string message = "Your details have been saved successfully.";
                            string script = "window.onload = function(){ alert('";
                            script += message;
                            script += "')};";
                            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

                        }
                    }
                    else if (Result == 1)
                    {
                        LabelInformation.Text = Messages.NameMessage;
                    }
                    else
                    {
                        LabelInformation.Text = Messages.DBMessage;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            CleanScreen();
        }

        private void CleanScreen()
        {
            txtName.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtMobile.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            LabelInformation.Text = "";
            txtGST.Text = "";
            txtName.Focus();
        }
    }
}