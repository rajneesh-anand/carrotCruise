<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/MasterHome.master" AutoEventWireup="true" CodeBehind="Bankaccount.aspx.cs" Inherits="Shipping.WebForms.Bankaccount" %>
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
            <h3><span class="label label-primary">Create New Bank Account</span></h3>
        </div>
             
        <div class="form-group col-md-6">
             <h6>BANK NAME</h6>
             <asp:TextBox ID="txtName" class="form-control upper-case" runat="server" placeholder="Name of the Bank"></asp:TextBox>   
            
        </div>
         <div class="form-group col-md-6">
             <h6>A/C HOLDER NAME </h6>
             <asp:TextBox ID="txtAccountHolder" class="form-control upper-case" runat="server" placeholder="Name of the Account holder"></asp:TextBox>   
            
        </div>
           <div class="form-group col-md-4">
             <h6>A/C Number</h6>
             <asp:TextBox ID="txtAccount" class="form-control upper-case" runat="server"></asp:TextBox>     
        </div>
        <div class="form-group col-md-4">
             <h6>IFSC</h6>
             <asp:TextBox ID="txtIFSC" class="form-control upper-case" runat="server"></asp:TextBox>
        </div>
        <div class="form-group col-md-4">
             <h6>CITY</h6>
             <asp:TextBox ID="txtCity" class="form-control upper-case" runat="server"></asp:TextBox>
        </div>
          <div class="form-group col-md-4">
             <h6>STATE</h6>
             <asp:DropDownList ID="ddlState" runat="server" class="form-control dropdown upper-case">   </asp:DropDownList>
        </div>
         <div class="form-group col-md-8">
             <h6>BRANCH ADDRESS</h6>
             <asp:TextBox ID="txtAddress" class="form-control upper-case" runat="server"></asp:TextBox>
        </div>
               
         <div class="form-group col-md-12 ">
         <asp:Label ID="LabelInformation" runat="server" class="form-control label-warning" ForeColor="Maroon"></asp:Label>

         <asp:Button ID="btnSave" runat="server" Class="btn btn-info navbar-btn pull-right btn-space" Text="SAVE" ValidationGroup="Form"  OnClientClick="javascript:return validateRegistrationMaster();"  onclick="btnSave_Click"/>
         <asp:Button ID="btnAddNew" runat="server" Class="btn btn-info navbar-btn pull-right btn-space" Text="NEW" onclick="btnAddNew_Click"  />    
        </div>
       </div>


        <script type="text/javascript">
              
               function validateRegistrationMaster() {

                   var Bank_Name = ((document.getElementById('<%=txtName.ClientID%>').value) ? (document.getElementById('<%=txtName.ClientID%>').value) : "");                  
                   var Holder_Name = ((document.getElementById('<%=txtAccountHolder.ClientID%>').value) ? (document.getElementById('<%=txtAccountHolder.ClientID%>').value) : "" );
                   var Account_Number = ((document.getElementById('<%=txtAccount.ClientID%>').value)?(document.getElementById('<%=txtAccount.ClientID%>').value):"");
                   var Address = ((document.getElementById('<%=txtAddress.ClientID%>').value) ?(document.getElementById('<%=txtAddress.ClientID%>').value) :"");
                 
                   var State = document.getElementById('<%=ddlState.ClientID%>');
                   var selectedText = State.options[State.selectedIndex].innerHTML;


                   if (Bank_Name =="") {
                       document.getElementById('<%=txtName.ClientID%>').focus();
                       return false;
                   } else if (Holder_Name=="") {
                       document.getElementById('<%=txtAccountHolder.ClientID%>').focus();
                       return false;
                   } else if (Account_Number=="") {
                       document.getElementById('<%=txtAccount.ClientID%>').focus();
                       return false;
                   }

                   else if (Address=="") {
                       document.getElementById('<%=txtAddress.ClientID%>').focus();
                       return false;
                   }  else if (selectedText == "--Select State--") {
                       document.getElementById('<%=ddlState.ClientID%>').focus();
                       return false;
                   }

                   else { return true; }
                   
               }


        </script>


</asp:Content>
