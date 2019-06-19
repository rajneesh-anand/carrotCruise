<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/MasterHome.master" AutoEventWireup="true" CodeBehind="VendorList.aspx.cs" Inherits="Shipping.WebForms.VendorList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
        var agentid = null;
        $(document).ready(function () {
            var Vendor_Name = "";
            $.ajax({
                url: 'VenderList.asmx/GetVendor',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                   var table= $('#datatable').dataTable({
                        paging: true,
                        sort: true,
                        searching: true,
                        scrollY: '65vh',   
                        "pageLength": 50,
                        data: data,
                       columns:
                       [
                               { 'data': 'agentid',"visible": false},
                               { 'data': 'name',"autoWidth": true },                              
                               { 'data': 'city' },
                               { 'data': 'state' },
                               { 'data': 'mobile'},
                               { 'data': 'gst' },                         
                         
                        ],
                        dom: 'Bfrtip', 
                        select: true,
                      
                        buttons: [
                                       {
                                         text: 'Edit selected Invoice',                                    
                                         action: function (e, dt, node, config) {
                                                alert(agentid);
                                                var url = "../WebForms/EditVendor.aspx?IN=" + agentid;
                                                window.location.href = url;                                                  
                                            },   
                                          enabled: false
                                       } ,           
                                ]                      
                    });
                    
                    $('#datatable').DataTable().on('select deselect', function () {
                        var selectedRows = $('#datatable').DataTable().rows({ selected: true }).count();                      
                        $('#datatable').DataTable().button(0).enable(selectedRows == 1);
                        $('#datatable').DataTable().button(0).enable(selectedRows >0);
                    });

                    table.on('click', 'tr', function () {
                        if ($(this).hasClass('selected')) {
                            $(this).removeClass('selected');


                        }
                        else {
                            $('#datatable').dataTable().$('tr.selected').removeClass('selected');
                            $(this).addClass('selected');
                        }

                        var currentRow = $(this).closest("tr");

                        var data = $('#datatable').DataTable().row(currentRow).data();
                        agentid = (data['agentid']);
                        console.log(agentid);

                    });

                }
            });
  
        });    
          
    </script>
      
   
    <style type="text/css"> 
        
    </style>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="form-group">
            <table id="datatable" class="display">
                <thead>
                    <tr>                       
                        <th>VendorID</th>
                        <th>Vendor Name</th>
                        <th>City</th>
                        <th>State</th>
                        <th>Mobile</th>
                        <th>GST</th>
                                          
                    </tr>
                </thead>
                <tbody></tbody>
                
             
            </table>
        </div>

</asp:Content>
