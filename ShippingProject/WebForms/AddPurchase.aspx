<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/MasterHome.master" AutoEventWireup="true" CodeBehind="AddPurchase.aspx.cs" Inherits="Shipping.WebForms.AddPurchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="../resources/js/KeyboardFunctions.js" type="text/javascript"></script>  
     <script src="../resources/js/jquery-3.2.1.min.js"></script>
    <script src="../resources/js/jquery-ui.js" type="text/javascript"></script>
    <script src="../resources/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/resources/css/jquery-ui.css"/>
    <link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css"/>
    
    <style type="text/css">
        .upper-case {
            text-transform: uppercase;
        }
       </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="form-row">
        <div class="form-group col-md-12">
            <h3><span class="label label-primary">New Purchase Bill</span></h3>
        </div>
             
        <div class="form-group col-md-3">
             <h6>Bill No.</h6>
             <input id="txtBill" class="form-control upper-case bill_no " placeholder="Bill Number"/>   
            
        </div>
        <div class='form-group col-md-3'>
              <h6>Bill Date.</h6>
              <div class='input-group date' id='startDate'>  
              <input id="txtDate" type="text" class="form-control"  placeholder="Bill Date"/> <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
       </div>
                          
        </div>
         <div class="form-group col-md-6">
             <h6>Vendor's Name </h6>
             <asp:DropDownList ID="ddlVendor" runat="server" class="form-control dropdown upper-case"></asp:DropDownList>            
        </div>        
       <div class="form-group col-md-12">
             <table class="table order-list table-bordered" id="myTable">
                    <thead>
                                <tr>
                                     <td style="width: 45%"><h5 style="color :cornflowerblue">Item's Details</h5></td>
                                     <td style="width: 10%"><h5 style="color :cornflowerblue">Qty</h5></td>
                                     <td style="width: 10%"><h5 style="color :cornflowerblue">Rate</h5></td>
                                     <td style="width: 10%"><h5 style="color :cornflowerblue">Currency</h5></td>
                                     <td style="width: 10%"><h5 style="color :cornflowerblue">ROE</h5></td>
                                     <td style="width: 10%"><h5 style="color :cornflowerblue">Amount</h5></td>
                                     <td style="width: 5%"><input type="button" class="btn btn-group-sm btn-primary " id="addrow" value="+" /></td>
                                </tr>
                      </thead>
                     
                     <tbody>
                                <tr class="item">
                                     <td>  <input id="itemdetails" class="form-control upper-case item_details " /> </td>
                                     <td>  <input id="qnty" class="form-control upper-case qty neo" /></td>
                                     <td>  <input id="rate" class="form-control upper-case price neo" /> </td>
                                     <td>  <select name="personal" class="form-control currency"><option value="INR">INR</option><option value="AED">AED</option><option value="USD">USD</option><option value="EUR">EUR</option></select></td>
                                     <td>  <input id="roe" class="form-control upper-case exchange neo" /> </td>  
                                     <td>  <input id="amount" class="form-control upper-case total" /> </td>    
                                  
                                     <td class="col-sm-2"><a class="deleteRow btn_remove"></a></td>
                                </tr>
                    </tbody>
                 </table>
              </div>
              <div class="form-group col-md-4">
                    <table  id="t2">
                        <tr>
                            <td><h5 class="form-control">Total Amount</h5></td>                 
                            <td><input id="netto" class="form-control" name="netto" type="text" value=""/></td>
                        </tr>
                    </table>
             </div>        
             <div class="form-group col-md-12 "> 
                 <button id="btnSave" class="btn btn-info btn-group-sm pull-right btn-space">Save</button>
                 <button id="btnAddNew" class="btn btn-info btn-group-sm pull-right btn-space">New</button>    
            </div>
      
      </div>
      <!-- -->
           
  
       
   
 <script type="text/javascript">


    $(document).ready(function () {
               

        // function for adding a new row
             var r = 1;
        $('#addrow').click(function () {
                if (r < 5) 
                {
                        r++;

                        $('#myTable').append('<tr id="row' + r + '" class="item"><td><input  class="form-control upper-case item_details" ID ="itemdetails"/></td><td><input class="form-control qty neo" ID="qnty"/></td><td><input  class="form-control price neo" ID="rate"/></td><td><select name="personal" class="form-control currency"><option value="INR">INR</option><option value="AED">AED</option><option value="USD">USD</option><option value="EUR">EUR</option></select></td><td><input class="form-control exchange neo" ID="roe"/></td><td> <input class="form-control total neo" ID="amount"/></td ><td><button type="button" name="remove" id="' + r + '" class="btn_remove">X</button></td></tr>');
                }
        });
        // remove row when X is clicked
        $(document).on('click', '.btn_remove', function () {
            var button_id = $(this).attr("id");
            $('#row' + button_id + '').remove();
            console.log('deleted');
            calcAll();
        });
        // calculate everything
        $(document).on("keyup", ".neo", calcAll);

        function calcAll(){
        // calculate total for one row
            $(".item").each(function () {
            var qnty = 1;
            var price = 1;
            var exchange = 1;
            var total = "";
            if (!isNaN(parseFloat($(this).find(".qty").val()))) {
                qnty = parseFloat($(this).find(".qty").val());
                }
            if (!isNaN(parseFloat($(this).find(".price").val()))) {
                price = parseFloat($(this).find(".price").val());
                 }
            if (!isNaN(parseFloat($(this).find(".exchange").val()))) {
                exchange = parseFloat($(this).find(".exchange").val());
                 }
            total = qnty * price * exchange;
            $(this).find(".total").val(total.toFixed(2));
            });

            var sum = 0;
            $(".total").each(function () {
            if (!isNaN(this.value) && this.value.length != 0) {
                sum += parseFloat(this.value);
            }
            });

            $("#netto").val(sum.toFixed(2));
            console.log(sum);
             //$("#steuer").val(sum.toFixed(2) * 0.19);
             //$("#brutto").val(parseFloat(sum.toFixed(2)) + parseFloat(($("#steuer").val())));
        }

       function getAllEmpData() {
            var data = [];
            $('tr.item').each(function () {
               // var billnumber = $(this).find('.bill_no').val();
                var billnumber = document.getElementById('txtBill').value;
                var purchasedate = document.getElementById('txtDate').value;
                var vendorname = document.getElementById('<%=ddlVendor.ClientID%>').value;
                var totalamount = document.getElementById('netto').value;
              
                var qnty = $(this).find('.qty').val();
                var rate = $(this).find('.price').val();
                var currency = $(this).find('.currency').val();
                var roe = $(this).find('.exchange').val();
                var amount = $(this).find('.total').val();
                var itemdetails = $(this).find('.item_details').val();
                var alldata = {
                    'BillNumber': billnumber,
                    'Qnty': qnty,
                    'Rate': rate,
                    'Currency': currency,
                    'ROE': roe,
                    'Amount': amount,
                    'ItemDetails': itemdetails,
                    'PurchaseDate': purchasedate,
                    'VendorName': vendorname,
                    'TotalAmount': totalamount,
                   
                }
                data.push(alldata);
            });
            console.log(data);
            return data;
        }

         $("#btnSave").click(function () {
            var data = JSON.stringify(getAllEmpData());           
            $.ajax({
                url: 'AddPurchase.aspx/SaveData',
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ 'empdata': data }),
                success: function () {
                    alert("Data Added Successfully");
                },
                error: function () {
                    alert("Error while inserting data");
                }
            });
        });
    });
  
       
  </script>  
  <script type="text/javascript">
    $(document).ready(function () {
        $("#startDate").datepicker({
            format: 'dd/mm/yyyy',
             orientation: 'bottom'
        });
              
    }); 

  </script>

      
    
</asp:Content>
