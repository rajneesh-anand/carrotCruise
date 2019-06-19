<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebForms/MasterHome.master" CodeBehind="Ledger.aspx.cs" Inherits="Shipping.WebForms.Ledger" %>
<%@ Register Assembly="CrystalDecisions.Web, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
<script src="../resources/js/jquery-3.2.1.min.js"></script>
<script src="../resources/js/jquery-ui.js" type="text/javascript"></script>
<script src="../resources/js/bootstrap-datepicker.js" type="text/javascript"></script>
<link rel="stylesheet" href="/resources/css/jquery-ui.css"/>
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
        width: 320px;
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
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" DisplayStatusbar="False" DisplayToolbar="False" ToolPanelView="None" />
    
  <div class="className">
             <div class="form-group">     
                    <div class='input-group date' id='startDate' >
                            <asp:TextBox ID="txtFrom" runat="server" class="form-control "  Placeholder="From Date" ></asp:TextBox>
                            <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>                                 
                    </div>
                    <div class="input-group date" id="endDate" >
                            <asp:TextBox ID="txtTo" runat="server" class="form-control "  Placeholder="To Date" ></asp:TextBox>
                            <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>                             
             </div>
               <br />
             <div class="form-group">       
                     <div class="input-group" style="margin-top:20px">
                            <asp:DropDownList ID="ddlSearch" runat="server" CssClass="form-control"  Width="320px"> </asp:DropDownList>                   
                     </div>
             </div>
             <div class="form-group" style="margin-top:40px">     
             
                     <div class="button text-center" >
                            <asp:Button ID="btnSave" runat="server" Class="btn btn-info navbar-btn" Text="Download" onclick="btnSearch_Click"  />      
                     </div>
             </div>     
              
    </div>

<script type="text/javascript">
    $(document).ready(function () {
        $("#startDate").datepicker({
            format: 'dd/mm/yyyy',
             orientation: 'bottom'
        });
              
    }); 
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#endDate").datepicker({
            format: 'dd/mm/yyyy',
            orientation: 'bottom'
        });

    });
</script>
 
</asp:Content>