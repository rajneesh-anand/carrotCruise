<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/MasterHome.master" AutoEventWireup="true" CodeBehind="AddVendor.aspx.cs" Inherits="Shipping.WebForms.AddVendor" %>
<%@ Register assembly="CrystalDecisions.Web,Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="../resources/js/KeyboardFunctions.js" type="text/javascript"></script>    
    <style type="text/css">          
        .upper-case {
                text-transform: uppercase;
                }  
       </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="form-row">

        <div class="form-group col-md-12">
            <h3><span class="label label-primary">Create New Vendor Account</span></h3>
        </div>
             
        <div class="form-group col-md-6">
             <h6>Vendor First Name</h6>
             <asp:TextBox ID="txtName" class="form-control upper-case" runat="server" placeholder="First Name"></asp:TextBox>   
            
        </div>
           <div class="form-group col-md-6">
             <h6>Vendor Last Name</h6>
             <asp:TextBox ID="txtLName" class="form-control upper-case" runat="server"></asp:TextBox>     
        </div>
        <div class="form-group col-md-12">
             <h6>Client Address</h6>
             <asp:TextBox ID="txtAddress" class="form-control upper-case" runat="server"></asp:TextBox>
        </div>

         <div class="form-group col-md-6">
             <h6>City</h6>
             <asp:TextBox ID="txtCity" class="form-control upper-case" runat="server"></asp:TextBox>
        </div>
         <div class="form-group col-md-6">
             <h6>State</h6>
             <asp:DropDownList ID="ddlState" runat="server" class="form-control dropdown upper-case">   </asp:DropDownList>
        </div>
         <div class="form-group col-md-6">
             <h6>Mobile</h6>
             <asp:TextBox ID="txtMobile" class="form-control" runat="server"  ValidationGroup="Form" onkeypress="return ValidateNumbers(event)" MaxLength="10"></asp:TextBox>
        </div>
         <div class="form-group col-md-6">
             <h6>Phone</h6>
             <asp:TextBox ID="txtPhone" class="form-control" runat="server" ValidationGroup="Form" onkeypress="return ValidateNumbers(event)" MaxLength="10"></asp:TextBox>
        </div>
         <div class="form-group col-md-6">
             <h6>Email</h6>
            <asp:TextBox ID="txtEmail" runat="server" class="form-control"  MaxLength="10" ValidationGroup="Form" onkeypress="return ValidateNumbers(event)"  onpaste="return false"> </asp:TextBox>
        </div>
         <div class="form-group col-md-6">
             <h6>GSTIN</h6>
              <asp:TextBox ID="txtGST" runat="server" class="form-control upper-case" > </asp:TextBox>
        </div>        
        
         <div class="form-group col-md-12 ">
         <asp:Label ID="LabelInformation" runat="server" class="form-control label-warning" ForeColor="Maroon"></asp:Label>

         <asp:Button ID="btnSave" runat="server" Class="btn btn-info navbar-btn pull-right btn-space" Text="SAVE" ValidationGroup="Form" OnClientClick="javascript:return validateRegistrationMaster();" onclick="btnSave_Click" />
         <asp:Button ID="btnAddNew" runat="server" Class="btn btn-info navbar-btn pull-right btn-space" Text="NEW" OnClientClick="javascript:userValid();" ValidationGroup="Form" onclick="btnAddNew_Click" />    
        </div>
       </div> 

     <script type="text/javascript">
              
               function validateRegistrationMaster() {

                   var Bank_Name = ((document.getElementById('<%=txtName.ClientID%>').value) ? (document.getElementById('<%=txtName.ClientID%>').value) : "");                  
                   var Holder_Name = ((document.getElementById('<%=txtAddress.ClientID%>').value) ? (document.getElementById('<%=txtAddress.ClientID%>').value) : "" );
                   var Account_Number = ((document.getElementById('<%=txtGST.ClientID%>').value)?(document.getElementById('<%=txtGST.ClientID%>').value):"");
                   var Address = ((document.getElementById('<%=txtCity.ClientID%>').value) ?(document.getElementById('<%=txtCity.ClientID%>').value) :"");
                    var State = document.getElementById('<%=ddlState.ClientID%>');
                   var selectedText = State.options[State.selectedIndex].innerHTML;



                   if (Bank_Name =="") {
                       document.getElementById('<%=txtName.ClientID%>').focus();
                       return false;
                   } else if (Holder_Name=="") {
                       document.getElementById('<%=txtAddress.ClientID%>').focus();
                       return false;
                   } else if (Account_Number=="") {
                       document.getElementById('<%=txtGST.ClientID%>').focus();
                       return false;
                   }

                   else if (Address=="") {
                       document.getElementById('<%=txtCity.ClientID%>').focus();
                       return false;
                   }else if (selectedText == "--Select State--") {
                       document.getElementById('<%=ddlState.ClientID%>').focus();
                       return false;
                   }

                   else { return true; }
                   
               }


        </script>

</asp:Content>

