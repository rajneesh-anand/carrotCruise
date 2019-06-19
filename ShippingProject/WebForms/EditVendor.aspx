<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/MasterHome.master" AutoEventWireup="true" CodeBehind="EditVendor.aspx.cs" Inherits="Shipping.WebForms.EditVendor" %>
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
            <h4><span class="label label-primary">Create New Vendor Account</span></h4>
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
            <asp:TextBox ID="txtEmail" runat="server" class="form-control" > </asp:TextBox>
        </div>
         <div class="form-group col-md-6">
             <h6>GSTIN</h6>
              <asp:TextBox ID="txtGST" runat="server" class="form-control upper-case" > </asp:TextBox>
        </div>        
        
         <div class="form-group col-md-12 ">
         <asp:Label ID="LabelInformation" runat="server" class="form-control label-warning" ForeColor="Maroon"></asp:Label>

         <button id="btnUpdate" class="btn btn-info navbar-btn pull-right btn-space">UPDATE</button>
           
        </div>
       </div> 

  <script type="text/javascript">
      $(document).ready(function () {
          var AgentID = null;
          var queryString = new Array();
          $(function () {
              if (queryString.length == 0) {
                  if (window.location.search.split('?').length > 1) {
                      var params = window.location.search.split('?')[1].split('&');
                      for (var i = 0; i < params.length; i++) {
                          var key = params[i].split('=')[0];
                          var value = decodeURIComponent(params[i].split('=')[1]);
                          queryString[key] = value;
                      }
                  }
              }
              if (queryString["IN"] != null) {
                  //var data = "<u>Values from QueryString</u><br /><br />";
                  AgentID = queryString["IN"];
                  //$("h3").html(in_number);
              }



              $.ajax({
                  url: 'VendorEdit.asmx/GetVendorByName',
                  data: { AgentId: AgentID },
                  type: 'post',
                  dataType: 'json',
                  success: function (r) {

                      $('#<%=txtName.ClientID%>').val(r.name);
                      $('#<%=txtAddress.ClientID%>').val(r.address);
                      $('#<%=ddlState.ClientID%> option:selected').text(r.state);
                       $('#<%=ddlState.ClientID%> option:selected').value(r.state);
                      $('#<%=txtCity.ClientID%>').val(r.city);
                      var mobile = r.mobile;
                      if (mobile == 0) {
                          $('#<%=txtMobile.ClientID%>').val("");
                      } else {  $('#<%=txtMobile.ClientID%>').val(mobile);}

                       var phone = r.phone;
                      if (phone == 0) {
                          $('#<%=txtPhone.ClientID%>').val("");
                      } else {  $('#<%=txtPhone.ClientID%>').val(phone);}
                    
                      $('#<%=txtEmail.ClientID%>').val(r.email);
                      $('#<%=txtGST.ClientID%>').val(r.gst);
                  },
                  error: function (err) {
                      alert(err);
                  }
              });


          });

          function getAllEmpData() {
              var data = [];


              var name = ((document.getElementById('<%=txtName.ClientID%>').value) ? (document.getElementById('<%=txtName.ClientID%>').value) : "");

              var address = ((document.getElementById('<%=txtAddress.ClientID%>').value) ? (document.getElementById('<%=txtAddress.ClientID%>').value) : "");

              var city = ((document.getElementById('<%=txtCity.ClientID%>').value) ? (document.getElementById('<%=txtCity.ClientID%>').value) : "");

              var state = ((document.getElementById('<%=ddlState.ClientID%>').value) ? (document.getElementById('<%=ddlState.ClientID%>').value) : "");
              var mobile = ((document.getElementById('<%=txtMobile.ClientID%>').value) ? (document.getElementById('<%=txtMobile.ClientID%>').value) : 0);

              var phone = ((document.getElementById('<%=txtPhone.ClientID%>').value) ? (document.getElementById('<%=txtPhone.ClientID%>').value) : 0);
              var email = ((document.getElementById('<%=txtEmail.ClientID%>').value) ? (document.getElementById('<%=txtEmail.ClientID%>').value) : "");

              var gst = ((document.getElementById('<%=txtGST.ClientID%>').value) ? (document.getElementById('<%=txtGST.ClientID%>').value) : "");

              var alldata = {
                  'Name': name,
                  'Address': address,
                  'City': city,
                  'State': state,
                  'Mobile': mobile,
                  'Phone': phone,
                  'Email': email,
                  'GST': gst,
                  'AccountType': 'Vendor',
                  'Status': '1',
                  'AgentID': AgentID,

              }
              data.push(alldata);
              //return false;

              console.log(data);
              return data;

          }



          $("#btnUpdate").click(function () {
            
              var state = document.getElementById('<%=ddlState.ClientID %>');
              var selectedText = state.options[state.selectedIndex].innerHTML;
              var name = ((document.getElementById('<%=txtName.ClientID %>').value) ? (document.getElementById('<%= txtName.ClientID %>').value) : "");
              var city = ((document.getElementById('<%=txtCity.ClientID %>').value) ? (document.getElementById('<%= txtCity.ClientID %>').value) : "");
              var address = ((document.getElementById('<%=txtAddress.ClientID %>').value) ? (document.getElementById('<%= txtAddress.ClientID %>').value) : "");
              var gst = ((document.getElementById('<%=txtGST.ClientID %>').value) ? (document.getElementById('<%= txtGST.ClientID %>').value) : "");


              if (selectedText == "--Select State--") {
                  document.getElementById('<%= ddlState.ClientID %>').focus();
                  return false;
              } else if (name == "") {
                  document.getElementById('<%= txtName.ClientID %>').focus();
                  return false;
              } else if (city == "") {
                  document.getElementById('<%= txtCity.ClientID %>').focus();
                  return false;
              } else if (address == "") {
                  document.getElementById('<%= txtCity.ClientID %>').focus();
                  return false;
              } else if (gst == "") {
                  document.getElementById('<%= txtGST.ClientID %>').focus();
                  return false;
              } 

             
              var data = JSON.stringify(getAllEmpData());
              console.log(data);
            
              $.ajax({
                  url: 'EditVendor.aspx/UpdateVendor',
                  type: 'POST',
                  dataType: 'json',
                  contentType: 'application/json; charset=utf-8',
                  data: JSON.stringify({ 'empdata': data }),

                  success: function (response) {
                      console.log(response.d);
                      alert("Vendor Updated Successfully");
                      var url = "../WebForms/VendorList.aspx";
                      window.location.href = url;

                  },
                  error: function () {
                      alert("Error while Updating Invoice");
                  }


              });



          });
      });
          
  </script>

</asp:Content>