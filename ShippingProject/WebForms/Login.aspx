<%@ Page Language="C#" MasterPageFile="~/WebForms/MainHome.master" AutoEventWireup="true" Title="Cruise Carrot | Login"   Inherits="Login" CodeBehind="Login.aspx.cs" %>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
  <script src="../resources/js/jquery-3.2.1.min.js"></script>
<script src="../resources/js/jquery-ui.js" type="text/javascript"></script>
<script src="../resources/js/bootstrap-datepicker.js" type="text/javascript"></script>
<link rel="stylesheet" href="../resources/css/jquery-ui.css"/>
<link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css"/>

<script type="text/javascript">
    $(function () {
        $('.className').css({
            'position': 'absolute',
            'left': '50%',
            'top': '50%',
            'margin-left': function () { return -$(this).outerWidth() / 2 },
            'margin-top': function () { return -$(this).outerHeight() / 2 }
        });
    });
</script>   
  
<style type="text/css">
          
.className{
        width: 300px;
        height: 350px;
        position: relative;  
       
        }  
.button{
        position:relative;
        top: 50%;
        transform: translateY(-50%);
        }
#startDate, #endDate {
        width: 50%;
        float: left;
        }
</style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
  
    <div class="className">
         
     <%--   <div class="form-horizontal">--%>
                <h2 style="color:cornflowerblue;">Sign In</h2>
                <hr />
               <div class="form-group input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
             <asp:TextBox ID="UserName" class="form-control" runat="server"></asp:TextBox>     
          </div>
          <div class="form-group input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
             <asp:TextBox ID="Password" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
          </div>
          <div class="checkbox">
            <label>
              <asp:CheckBox ID="CheckBox1" runat="server" /> <a href="#">Remember me</a>
            </label>
          </div>
          <div class="form-group">
               <asp:Button ID="Button1" runat="server" Text="Login" class="btn btn-primary btn-block" OnClick="btnLogin_Click" />
          <%--  <button type="button" class="btn btn-def btn-block">Login</button>--%>
          </div>
          <div class="form-group text-center">
               <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
            <a href="#">Forgot Password</a>&nbsp;|&nbsp;<a href="#">Support</a>
          </div>
          <%--  </div>--%>
      
    </div>
       

</asp:Content>

