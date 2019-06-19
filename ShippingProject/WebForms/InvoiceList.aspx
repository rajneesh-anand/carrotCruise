<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/MasterHome.master" AutoEventWireup="true" CodeBehind="InvoiceList.aspx.cs" Inherits="Shipping.WebForms.InvoiceList" %>
<%@ Register Assembly="CrystalDecisions.Web, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>



<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
     <script src="/resources/js/KeyboardFunctions.js" type="text/javascript"></script>
     <script src="../resources/js/jquery-3.2.1.min.js"></script>
   
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type ="text/css" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.2.5/css/select.dataTables.min.css" />
 
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src= "https://cdn.datatables.net/select/1.2.5/js/dataTables.select.min.js"></script>

   
    <script type="text/javascript">
        var Invoice_Number = 0;
        $(document).ready(function () {
            $.ajax({
                url: 'InvoiceService.asmx/GetInvoice',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                   var table= $('#datatable').dataTable({
                        paging: true,
                        sort: true,
                        searching: true,
                        scrollY: '70vh',   
                        "pageLength": 100,
                        data: data,
                        columns: [
                            { 'data': 'Invoice_Number' },
                            {
                                'data': 'Invoice_Date',
                                'render': function (jsonDate) {
                                    var date = new Date(parseInt(jsonDate.substr(6)));
                                    var month = date.getMonth() + 1;
                                    return month + "/" + date.getDate() + "/" + date.getFullYear();
                                }
                            },
                             {
                                'data': 'Departure_Date',
                                'render': function (jsonDate) {
                                    var date = new Date(parseInt(jsonDate.substr(6)));
                                    var month = date.getMonth() + 1;
                                    return month + "/" + date.getDate() + "/" + date.getFullYear();
                                }
                            },

                            { 'data': 'Agent_Name' },
                            { 'data': 'Gross_Amount' },
                            { 'data': 'Comm_Amt' },
                            { 'data': 'GTotal' },
                          
                            //{
                            //    'data': 'WebSite',
                            //    'sortable': false,
                            //    'searchable': false,
                            //    'render': function (webSite) {
                            //        if (!webSite) {
                            //            return 'N/A';
                            //        }
                            //        else {
                            //            return '<a href=' + webSite + '>'
                            //                + webSite.substr(0, 10) + '...' + '</a>';
                            //        }
                            //    }
                            //},
                            //{
                            //    'data': 'Salary',
                            //    'render': function (salary) {
                            //        return "$" + salary;
                            //    }
                            //},
                         
                        ],
                        dom: 'Bfrtip', 
                        select: true,
                      
                        buttons: [
                           {
                             text: 'Edit selected Invoice',                                    
                             action: function (e, dt, node, config) {
                                    console.log(Invoice_Number);
                                    var url = "../WebForms/InvoiceEdit.aspx?IN=" + Invoice_Number;
                                    window.location.href = url;                                                  
                                },   
                              enabled: false
                           },
                           {
                                text: 'Print Selected Invoice',
                                action: function (e, dt, node, config) {                                     
                                   
                                    //alert(Invoice_Number);
                                    console.log(Invoice_Number);
                                    $.ajax({
                                        url: "InvoiceList.aspx/printInvoice",
                                        type: "POST",                             
                                        contentType: "application/json; charset=utf-8",
                                        data: JSON.stringify({ invoice_number: Invoice_Number }),
                                        dataType: "json",
                                        
                                        success: function (response) {
                                           alert(response.d);
                                        },
                                        error: function (err) {
                                            alert(err);     
                                        }
                                       
                                    });
  
                               },

                                enabled: false
                            }
                        
                     
                        ]                      
                    });

                      $('#datatable').DataTable().on( 'select deselect', function () {
                                var selectedRows =  $('#datatable').DataTable().rows( { selected: true } ).count();                         
                                 $('#datatable').DataTable().button(0).enable(selectedRows === 1);
                          $('#datatable').DataTable().button(1).enable(selectedRows > 0);
                      });

                      table.on( 'click', 'tr', function () {
                                if ( $(this).hasClass('selected') ) {
                                    $(this).removeClass('selected');
                                  
                                  
                                }
                                else {
                                     $('#datatable').dataTable().$('tr.selected').removeClass('selected');
                                    $(this).addClass('selected');
                          }

                          Invoice_Number = ($(this).children(":first").text());
                          console.log($(this).children(":first").text());
                      });

                }
            });
  
        });    
          
    </script>
      
   
    <style type="text/css"> 
        
    </style>
   
</asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
     <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" DisplayStatusbar="False" DisplayToolbar="False" ToolPanelView="None" />
      <div class="form-group">
            <table id="datatable" class="display">
                <thead>
                    <tr>                       
                        <th>Invoice Number</th>
                        <th>Invoice Date</th>
                        <th>Departure Date</th>
                        <th>Agent Name</th>
                        <th>Gross Amt</th>
                        <th>Comm Amt</th>
                        <th>Total</th>                            
                    </tr>
                </thead>
                
             
            </table>
        </div>

   

</asp:Content>


