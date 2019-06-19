<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/MasterHome.master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="Shipping.WebForms.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="../resources/js/KeyboardFunctions.js" type="text/javascript"></script>    
    <style type="text/css">          
        .upper-case {
                text-transform: uppercase;
               
                }  
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="className">
        <div class="form-group">
            <h3><span class="label label-primary">Create New Account</span></h3>
        </div>
             
        <div class="form-group col-md-4 ">
             <h6>ACCOUNT NAME</h6>
             <asp:TextBox ID="txtName" class="form-control upper-case" runat="server" placeholder="Name of the Account" required="true"></asp:TextBox>   
            
        </div>
         
           <div class="form-group col-md-4">
             <h6>ACCOUNT TYPE</h6>
             <select id="ddlAccount" class="form-control upper-case">
                 <option>ASSETS</option>
                 <option>LIABILITY</option>
                 <option>EXPENSES</option>
                 <option>OTHERS</option>
             </select>     
        </div>
        <div class="form-group col-md-4">
             <h6>OPENING BALANCE</h6>
             <asp:TextBox ID="txtBalance" class="form-control upper-case" runat="server"></asp:TextBox>
        </div>
       
               
         <div class="form-group upper-case">
        <%-- <asp:Label ID="LabelInformation" runat="server" class="form-control label-warning upper-case " ForeColor="Maroon"></asp:Label>--%>

         <asp:Button ID="btnSave" runat="server" Class="btn btn-info navbar-btn pull-right btn-space" Text="Save" OnClientClick="javascript:userValid();" ValidationGroup="Form" onclick="btnSave_Click" />    
         <asp:Button ID="btnAddNew" runat="server" Class="btn btn-info navbar-btn pull-right btn-space" Text="New" ValidationGroup="Form" onclick="btnAddNew_Click" />
        
        </div>
         </div>

       

</asp:Content>
