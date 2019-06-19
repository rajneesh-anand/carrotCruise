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
    public partial class AddAgent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {


                string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
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


            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            Publisher publisher = new Publisher();

            publisher.agentid = 0;

            publisher.name = txtName.Text.Trim().ToUpper();
            publisher.address = txtAddress.Text.Trim().ToUpper();
            publisher.city = txtCity.Text.Trim().ToUpper();
            publisher.state = ddlState.SelectedValue.ToUpper();
            publisher.gst = txtGST.Text.Trim().ToUpper();
            publisher.phone = (string.IsNullOrEmpty(txtPhone.Text.Trim())) ? 0 : Convert.ToDouble(txtPhone.Text.Trim());
            publisher.mobile = (string.IsNullOrEmpty(txtMobile.Text.Trim())) ? 0 : Convert.ToDouble(txtMobile.Text.Trim());
            publisher.email = txtEmail.Text.Trim().ToLower();
            publisher.accounttype = "Agent";

            var controller = Functions.CreateController();
            int Result = -1;
            Result = controller.Save(publisher);
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

    

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            LabelInformation.Text = "";
            txtName.Text = "";
            txtLName.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtMobile.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtGST.Text = "";
           


        }
    }
}