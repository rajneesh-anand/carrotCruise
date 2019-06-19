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
    public partial class Bankaccount : System.Web.UI.Page   {
        

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

            //if (ddlState.SelectedIndex == 0)
            //{
            //    ddlState.Focus();
            //    string script = "alert(\"Please select state\");";
            //    ScriptManager.RegisterStartupScript(this, GetType(),
            //                          "ServerControlScript", script, true);
            //    return;
            //}
            Bank bank = new Bank();

            bank.bankid = 0;
            bank.name = txtName.Text.Trim().ToUpper();
            bank.accountholder = txtAccountHolder.Text.Trim().ToUpper();
            bank.accountnumber = txtAccount.Text.Trim().ToUpper();
            bank.ifsc = txtIFSC.Text.Trim().ToUpper();
            bank.city = txtCity.Text.Trim().ToUpper();
            bank.state = ddlState.SelectedValue.ToUpper();
            bank.address = txtAddress.Text.Trim().ToUpper();


            var controller = Functions.CreateController();
            int Result = -1;
            Result = controller.Save(bank);
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
            txtAccount.Text = "";
            txtAccountHolder.Text = "";
            txtAddress.Text = "";
            txtIFSC.Text = "";
            txtCity.Text = "";


        }
    }
}