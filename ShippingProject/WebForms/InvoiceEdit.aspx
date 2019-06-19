<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/MasterHome.master" AutoEventWireup="true" CodeBehind="InvoiceEdit.aspx.cs" Inherits="Shipping.WebForms.TTInvoiceEdit" %>

   
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <script src="../resources/js/KeyboardFunctions.js" type="text/javascript"></script>  
    <script src="../resources/js/jquery-3.2.1.min.js"></script>
    <script src="../resources/js/jquery-ui.js" type="text/javascript"></script>
    <script src="../resources/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/resources/css/jquery-ui.css"/>
    <link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css"/>
    
        <script type="text/javascript">

          
                function checkDec(el) {
                        var ex = /^[0-9]+\.?[0-9]*$/;
                        if (ex.test(el.value) == false) {
                        alert('Invalid Data');
                        }
                }         

                function isNumberKey(evt, obj) {

                        var charCode = (evt.which) ? evt.which : event.keyCode
                        var value = obj.value;
                        var dotcontains = value.indexOf(".") != -1;
                        if (dotcontains)
                        if (charCode == 46) return false;
                        if (charCode == 46) return true;
                        if (charCode > 31 && (charCode < 48 || charCode > 57))
                        return false;
                        return true;
                }         

                    function MiscCheck(obj) {
                        var val1 = document.getElementById('<%= txtGrossAmt.ClientID %>').value;
                        var val2 = document.getElementById('<%= txtCommAmt.ClientID %>').value;
                        var val3 = document.getElementById('<%= txtNCF.ClientID %>').value;
                        var val4 = document.getElementById('<%= txtTAX.ClientID %>').value;
                        var val5 = document.getElementById('<%= txtGTAX.ClientID %>').value;
                        var val6 = document.getElementById('<%= txtHS.ClientID %>').value;
                        var val7 = document.getElementById('<%= txtTDS.ClientID %>').value;
                        var val8 = document.getElementById('<%= txtGST.ClientID %>').value;           

                        var GrossAmt = ((val1) ? document.getElementById('<%= txtGrossAmt.ClientID %>').value : 0);
                        var CommAmt = ((val2) ? document.getElementById('<%= txtCommAmt.ClientID %>').value : 0);            
                        var NCFAmt = ((val3) ? document.getElementById('<%= txtNCF.ClientID %>').value : 0);
                        var TAXAmt = ((val4) ? document.getElementById('<%= txtTAX.ClientID %>').value : 0);
                        var GTAXAmt = ((val5) ? document.getElementById('<%= txtGTAX.ClientID %>').value : 0);
                        var HS = ((val6) ? document.getElementById('<%= txtHS.ClientID %>').value : 0);
                        var TDS = ((val7) ? document.getElementById('<%= txtTDS.ClientID %>').value : 0);
                        var GST = ((val8) ? document.getElementById('<%= txtGST.ClientID %>').value : 0);
                        var Misc = obj.value;

                        if (Misc != "") {
                            var totalAmt = parseFloat(GrossAmt) - parseFloat(CommAmt) + parseFloat(NCFAmt) + parseFloat(TAXAmt) + parseFloat(GTAXAmt) + parseFloat(HS) + parseFloat(Misc);
                            document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(totalAmt * 100) / 100).toFixed(2);

                            var Gtotal = parseFloat(totalAmt) + parseFloat(TDS) - parseFloat(GST);
                            document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(Gtotal * 100) / 100).toFixed(2);
                        } else {
                            document.getElementById('<%= txtGTotal.ClientID %>').value = "";
                            document.getElementById('<%= txtTotalAmt.ClientID %>').value = "";

                        }
                    }

   
                    function AdultsCheck(obj) {
                                    var val1 = document.getElementById('<%= txtChildren.ClientID %>').value;
                                    var val2 = document.getElementById('<%= txtInfants.ClientID %>').value;
                                    var val3 = document.getElementById('<%= txtGross.ClientID %>').value;
                                    var val4 = document.getElementById('<%= txtGrossSecond.ClientID %>').value;
                                    var val5 = document.getElementById('<%= txtGrossThird.ClientID %>').value;
                                    var val6 = document.getElementById('<%= txtCommPer.ClientID %>').value;
                                    var val7 = document.getElementById('<%= txtCommAmt.ClientID %>').value;
                                    var val8 = document.getElementById('<%= txtNCFRate.ClientID %>').value;
                                    var val9 = document.getElementById('<%= txtTAXRate.ClientID %>').value;
                                    var val10 = document.getElementById('<%= txtGTAXRate.ClientID %>').value;
                                    var val11 = document.getElementById('<%= txtHSRate.ClientID %>').value;
                                    var val12 = document.getElementById('<%= txtMisc.ClientID %>').value;
                                    var val13 = document.getElementById('<%= txtTDSRate.ClientID %>').value;
                                    var val14 = document.getElementById('<%= txtGSTRate.ClientID %>').value;


                                    var adults = obj.value;


                                    var p1 = ((val1) ? document.getElementById('<%= txtChildren.ClientID %>').value : 0);
                                    var p2 = ((val2) ? document.getElementById('<%= txtInfants.ClientID %>').value : 0);
                                    var r1 = ((val3) ? document.getElementById('<%= txtGross.ClientID %>').value : 0);
                                    var r2 = ((val4) ? document.getElementById('<%= txtGrossSecond.ClientID %>').value : 0);
                                    var r3 = ((val5) ? document.getElementById('<%= txtGrossThird.ClientID %>').value : 0);
                                    var CommRate = ((val6) ? document.getElementById('<%= txtCommPer.ClientID %>').value : 0);
                                    var NCFRate = ((val8) ? document.getElementById('<%= txtNCFRate.ClientID %>').value : 0);
                                    var TAXRate = ((val9) ? document.getElementById('<%= txtTAXRate.ClientID %>').value : 0);
                                    var GTAXRate = ((val10) ? document.getElementById('<%= txtGTAXRate.ClientID %>').value : 0);
                                    var HSRate = ((val11) ? document.getElementById('<%= txtHSRate.ClientID %>').value : 0);
                                    var TDSRate = ((val13) ? document.getElementById('<%= txtTDSRate.ClientID %>').value : 0);
                                    var GSTRate = ((val14) ? document.getElementById('<%= txtGSTRate.ClientID %>').value : 0);

                                    var TotalPassenger = parseInt(adults) + parseInt(p1) + parseInt(p2);

                                    if (adults != "") {

                                    var GrossAmt_one = parseInt(adults) * parseFloat(r1);
                                    var GrossAmt_two = parseInt(p1) * parseFloat(r2);
                                    var GrossAmt_three = parseInt(p2) * parseFloat(r3);

                                    var total = parseFloat(GrossAmt_one) + parseFloat(GrossAmt_two) + parseFloat(GrossAmt_three);

                                    var commAmt = total * parseFloat(CommRate) / 100;
                                    var NCFAmt = parseInt(TotalPassenger) * parseFloat(NCFRate);
                                    var TAXAmt = parseInt(TotalPassenger) * parseFloat(TAXRate);
                                    var GTAXAmt = parseInt(TotalPassenger) * parseFloat(GTAXRate);
                                    var HSAmt = parseInt(TotalPassenger) * parseFloat(HSRate);
                                    var MiscAmt = ((val12) ? document.getElementById('<%= txtMisc.ClientID %>').value : 0);
                                    var tdsAmt = commAmt * parseFloat(TDSRate) / 100;
                                    var gstAmt = commAmt * parseFloat(GSTRate) / 100;


                                    document.getElementById('<%= txtGrossAmt.ClientID %>').value = parseFloat(Math.round(total * 100) / 100).toFixed(2);
                                    document.getElementById('<%= txtCommAmt.ClientID %>').value = parseFloat(Math.round(commAmt * 100) / 100).toFixed(2);
                                    document.getElementById('<%= txtNCF.ClientID %>').value = parseFloat(Math.round(NCFAmt * 100) / 100).toFixed(2);
                                    document.getElementById('<%= txtTAX.ClientID %>').value = parseFloat(Math.round(TAXAmt * 100) / 100).toFixed(2);
                                    document.getElementById('<%= txtGTAX.ClientID %>').value = parseFloat(Math.round(GTAXAmt * 100) / 100).toFixed(2);
                                    document.getElementById('<%= txtHS.ClientID %>').value = parseFloat(Math.round(HSAmt * 100) / 100).toFixed(2);

                                    var totalAmt = (total - commAmt) + parseFloat(NCFAmt) + parseFloat(TAXAmt) + parseFloat(GTAXAmt) + parseFloat(HSAmt) + parseFloat(MiscAmt);
                                    document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(totalAmt * 100) / 100).toFixed(2);

                                    document.getElementById('<%= txtGST.ClientID %>').value = parseFloat(Math.round(gstAmt * 100) / 100).toFixed(2);
                                    document.getElementById('<%= txtTDS.ClientID %>').value = parseFloat(Math.round(tdsAmt * 100) / 100).toFixed(2);

                                    var Gtotal = (totalAmt + tdsAmt) - gstAmt;
                                    document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(Gtotal * 100) / 100).toFixed(2);
                                    } else {

                                    document.getElementById('<%= txtGrossAmt.ClientID %>').value = "";
                                    document.getElementById('<%= txtCommAmt.ClientID %>').value = "";
                                    document.getElementById('<%= txtGST.ClientID %>').value = "";
                                    document.getElementById('<%= txtTDS.ClientID %>').value = "";
                                    document.getElementById('<%= txtGTotal.ClientID %>').value = "";
                                    document.getElementById('<%= txtTotalAmt.ClientID %>').value = "";
                                    document.getElementById('<%= txtNCF.ClientID %>').value = "";
                                    document.getElementById('<%= txtTAX.ClientID %>').value = "";
                                    document.getElementById('<%= txtGTAX.ClientID %>').value = "";
                                    document.getElementById('<%= txtHS.ClientID %>').value = "";

                                    }


                    }


        function ChildrenCheck(obj) {
                var val1 = document.getElementById('<%= txtAdults.ClientID %>').value;
                var val2 = document.getElementById('<%= txtInfants.ClientID %>').value;
                var val3 = document.getElementById('<%= txtGross.ClientID %>').value;
                var val4 = document.getElementById('<%= txtGrossSecond.ClientID %>').value;
                var val5 = document.getElementById('<%= txtGrossThird.ClientID %>').value;
                var val6 = document.getElementById('<%= txtCommPer.ClientID %>').value;
                var val7 = document.getElementById('<%= txtCommAmt.ClientID %>').value;
                var val8 = document.getElementById('<%= txtNCFRate.ClientID %>').value;
                var val9 = document.getElementById('<%= txtTAXRate.ClientID %>').value;
                var val10 = document.getElementById('<%= txtGTAXRate.ClientID %>').value;
                var val11 = document.getElementById('<%= txtHSRate.ClientID %>').value;
                var val12 = document.getElementById('<%= txtMisc.ClientID %>').value;
                var val13 = document.getElementById('<%= txtTDSRate.ClientID %>').value;
                var val14 = document.getElementById('<%= txtGSTRate.ClientID %>').value;


                var adults = obj.value;


                var p1 = ((val1) ? document.getElementById('<%= txtAdults.ClientID %>').value : 0);
                var p2 = ((val2) ? document.getElementById('<%= txtInfants.ClientID %>').value : 0);
                var r1 = ((val3) ? document.getElementById('<%= txtGross.ClientID %>').value : 0);
                var r2 = ((val4) ? document.getElementById('<%= txtGrossSecond.ClientID %>').value : 0);
                var r3 = ((val5) ? document.getElementById('<%= txtGrossThird.ClientID %>').value : 0);
                var CommRate = ((val6) ? document.getElementById('<%= txtCommPer.ClientID %>').value : 0);
                var NCFRate = ((val8) ? document.getElementById('<%= txtNCFRate.ClientID %>').value : 0);
                var TAXRate = ((val9) ? document.getElementById('<%= txtTAXRate.ClientID %>').value : 0);
                var GTAXRate = ((val10) ? document.getElementById('<%= txtGTAXRate.ClientID %>').value : 0);
                var HSRate = ((val11) ? document.getElementById('<%= txtHSRate.ClientID %>').value : 0);
                var TDSRate = ((val13) ? document.getElementById('<%= txtTDSRate.ClientID %>').value : 0);
                var GSTRate = ((val14) ? document.getElementById('<%= txtGSTRate.ClientID %>').value : 0);

                var TotalPassenger = parseInt(adults) + parseInt(p1) + parseInt(p2);

                if (adults != "") {

                    var GrossAmt_one = parseInt(adults) * parseFloat(r2);
                    var GrossAmt_two = parseInt(p1) * parseFloat(r1);
                    var GrossAmt_three = parseInt(p2) * parseFloat(r3);

                    var total = parseFloat(GrossAmt_one) + parseFloat(GrossAmt_two) + parseFloat(GrossAmt_three);

                    var commAmt = total * parseFloat(CommRate) / 100;
                    var NCFAmt = parseInt(TotalPassenger) * parseFloat(NCFRate);
                    var TAXAmt = parseInt(TotalPassenger) * parseFloat(TAXRate);
                    var GTAXAmt = parseInt(TotalPassenger) * parseFloat(GTAXRate);
                    var HSAmt = parseInt(TotalPassenger) * parseFloat(HSRate);
                    var MiscAmt = ((val12) ? document.getElementById('<%= txtMisc.ClientID %>').value : 0);
                var tdsAmt = commAmt * parseFloat(TDSRate) / 100;
                var gstAmt = commAmt * parseFloat(GSTRate) / 100;


                document.getElementById('<%= txtGrossAmt.ClientID %>').value = parseFloat(Math.round(total * 100) / 100).toFixed(2);
                document.getElementById('<%= txtCommAmt.ClientID %>').value = parseFloat(Math.round(commAmt * 100) / 100).toFixed(2);
                document.getElementById('<%= txtNCF.ClientID %>').value = parseFloat(Math.round(NCFAmt * 100) / 100).toFixed(2);
                document.getElementById('<%= txtTAX.ClientID %>').value = parseFloat(Math.round(TAXAmt * 100) / 100).toFixed(2);
                document.getElementById('<%= txtGTAX.ClientID %>').value = parseFloat(Math.round(GTAXAmt * 100) / 100).toFixed(2);
                document.getElementById('<%= txtHS.ClientID %>').value = parseFloat(Math.round(HSAmt * 100) / 100).toFixed(2);

                var totalAmt = (total - commAmt) + parseFloat(NCFAmt) + parseFloat(TAXAmt) + parseFloat(GTAXAmt) + parseFloat(HSAmt) + parseFloat(MiscAmt);
                document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(totalAmt * 100) / 100).toFixed(2);

                document.getElementById('<%= txtGST.ClientID %>').value = parseFloat(Math.round(gstAmt * 100) / 100).toFixed(2);
                document.getElementById('<%= txtTDS.ClientID %>').value = parseFloat(Math.round(tdsAmt * 100) / 100).toFixed(2);

                var Gtotal = (totalAmt + tdsAmt) - gstAmt;
                document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(Gtotal * 100) / 100).toFixed(2);
                } else {

                    document.getElementById('<%= txtGrossAmt.ClientID %>').value = "";
                    document.getElementById('<%= txtCommAmt.ClientID %>').value = "";
                document.getElementById('<%= txtGST.ClientID %>').value = "";
                document.getElementById('<%= txtTDS.ClientID %>').value = "";
                document.getElementById('<%= txtGTotal.ClientID %>').value = "";
                document.getElementById('<%= txtTotalAmt.ClientID %>').value = "";
                document.getElementById('<%= txtNCF.ClientID %>').value = "";
                document.getElementById('<%= txtTAX.ClientID %>').value = "";
                document.getElementById('<%= txtGTAX.ClientID %>').value = "";
                document.getElementById('<%= txtHS.ClientID %>').value = "";

                }



        }
   
        function InfantsCheck(obj) {
                var val1 = document.getElementById('<%= txtAdults.ClientID %>').value;
                var val2 = document.getElementById('<%= txtChildren.ClientID %>').value;
                var val3 = document.getElementById('<%= txtGross.ClientID %>').value;
                var val4 = document.getElementById('<%= txtGrossSecond.ClientID %>').value;
                var val5 = document.getElementById('<%= txtGrossThird.ClientID %>').value;
                var val6 = document.getElementById('<%= txtCommPer.ClientID %>').value;
                var val7 = document.getElementById('<%= txtCommAmt.ClientID %>').value;
                var val8 = document.getElementById('<%= txtNCFRate.ClientID %>').value;
                var val9 = document.getElementById('<%= txtTAXRate.ClientID %>').value;
                var val10 = document.getElementById('<%= txtGTAXRate.ClientID %>').value;
                var val11 = document.getElementById('<%= txtHSRate.ClientID %>').value;
                var val12 = document.getElementById('<%= txtMisc.ClientID %>').value;
                var val13 = document.getElementById('<%= txtTDSRate.ClientID %>').value;
                var val14 = document.getElementById('<%= txtGSTRate.ClientID %>').value;


                var adults = obj.value;


                var p1 = ((val1) ? document.getElementById('<%= txtAdults.ClientID %>').value : 0);
                var p2 = ((val2) ? document.getElementById('<%= txtChildren.ClientID %>').value : 0);
                var r1 = ((val3) ? document.getElementById('<%= txtGross.ClientID %>').value : 0);
                var r2 = ((val4) ? document.getElementById('<%= txtGrossSecond.ClientID %>').value : 0);
                var r3 = ((val5) ? document.getElementById('<%= txtGrossThird.ClientID %>').value : 0);
                var CommRate = ((val6) ? document.getElementById('<%= txtCommPer.ClientID %>').value : 0);
                var NCFRate = ((val8) ? document.getElementById('<%= txtNCFRate.ClientID %>').value : 0);
                var TAXRate = ((val9) ? document.getElementById('<%= txtTAXRate.ClientID %>').value : 0);
                var GTAXRate = ((val10) ? document.getElementById('<%= txtGTAXRate.ClientID %>').value : 0);
                var HSRate = ((val11) ? document.getElementById('<%= txtHSRate.ClientID %>').value : 0);
                var TDSRate = ((val13) ? document.getElementById('<%= txtTDSRate.ClientID %>').value : 0);
                var GSTRate = ((val14) ? document.getElementById('<%= txtGSTRate.ClientID %>').value : 0);

                var TotalPassenger = parseInt(adults) + parseInt(p1) + parseInt(p2);

                if (adults != "") {

                    var GrossAmt_one = parseInt(adults) * parseFloat(r3);
                    var GrossAmt_two = parseInt(p1) * parseFloat(r1);
                    var GrossAmt_three = parseInt(p2) * parseFloat(r2);

                    var total = parseFloat(GrossAmt_one) + parseFloat(GrossAmt_two) + parseFloat(GrossAmt_three);

                    var commAmt = total * parseFloat(CommRate) / 100;
                    var NCFAmt = parseInt(TotalPassenger) * parseFloat(NCFRate);
                    var TAXAmt = parseInt(TotalPassenger) * parseFloat(TAXRate);
                    var GTAXAmt = parseInt(TotalPassenger) * parseFloat(GTAXRate);
                    var HSAmt = parseInt(TotalPassenger) * parseFloat(HSRate);
                    var MiscAmt = ((val12) ? document.getElementById('<%= txtMisc.ClientID %>').value : 0);
                    var tdsAmt = commAmt * parseFloat(TDSRate) / 100;
                    var gstAmt = commAmt * parseFloat(GSTRate) / 100;


                    document.getElementById('<%= txtGrossAmt.ClientID %>').value = parseFloat(Math.round(total * 100) / 100).toFixed(2);
                document.getElementById('<%= txtCommAmt.ClientID %>').value = parseFloat(Math.round(commAmt * 100) / 100).toFixed(2);
                document.getElementById('<%= txtNCF.ClientID %>').value = parseFloat(Math.round(NCFAmt * 100) / 100).toFixed(2);
                document.getElementById('<%= txtTAX.ClientID %>').value = parseFloat(Math.round(TAXAmt * 100) / 100).toFixed(2);
                document.getElementById('<%= txtGTAX.ClientID %>').value = parseFloat(Math.round(GTAXAmt * 100) / 100).toFixed(2);
                document.getElementById('<%= txtHS.ClientID %>').value = parseFloat(Math.round(HSAmt * 100) / 100).toFixed(2);

                var totalAmt = (total - commAmt) + parseFloat(NCFAmt) + parseFloat(TAXAmt) + parseFloat(GTAXAmt) + parseFloat(HSAmt) + parseFloat(MiscAmt);
                document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(totalAmt * 100) / 100).toFixed(2);

                document.getElementById('<%= txtGST.ClientID %>').value = parseFloat(Math.round(gstAmt * 100) / 100).toFixed(2);
                document.getElementById('<%= txtTDS.ClientID %>').value = parseFloat(Math.round(tdsAmt * 100) / 100).toFixed(2);

                var Gtotal = (totalAmt + tdsAmt) - gstAmt;
                document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(Gtotal * 100) / 100).toFixed(2);
                } else {

                    document.getElementById('<%= txtGrossAmt.ClientID %>').value = "";
                    document.getElementById('<%= txtCommAmt.ClientID %>').value = "";
                    document.getElementById('<%= txtGST.ClientID %>').value = "";
                    document.getElementById('<%= txtTDS.ClientID %>').value = "";
                document.getElementById('<%= txtGTotal.ClientID %>').value = "";
                document.getElementById('<%= txtTotalAmt.ClientID %>').value = "";
                document.getElementById('<%= txtNCF.ClientID %>').value = "";
                document.getElementById('<%= txtTAX.ClientID %>').value = "";
                document.getElementById('<%= txtGTAX.ClientID %>').value = "";
                document.getElementById('<%= txtHS.ClientID %>').value = "";

                }



        }

            function GetTotal(obj) {
            var val1 = document.getElementById('<%= txtAdults.ClientID %>').value;
            var val2 = document.getElementById('<%= txtChildren.ClientID %>').value;
            var val3 = document.getElementById('<%= txtInfants.ClientID %>').value;
            var val4 = document.getElementById('<%= txtCommPer.ClientID %>').value;
            var val5 = document.getElementById('<%= txtCommAmt.ClientID %>').value;
            var val6 = document.getElementById('<%= txtNCF.ClientID %>').value;
            var val7 = document.getElementById('<%= txtTAX.ClientID %>').value;
            var val8 = document.getElementById('<%= txtGTAX.ClientID %>').value;
            var val9 = document.getElementById('<%= txtHS.ClientID %>').value;
            var val10 = document.getElementById('<%= txtTotalAmt.ClientID %>').value;
            var val11 = document.getElementById('<%= txtTDSRate.ClientID %>').value;
            var val12 = document.getElementById('<%= txtGSTRate.ClientID %>').value;
            var val13 = document.getElementById('<%= txtTDS.ClientID %>').value;
            var val14 = document.getElementById('<%= txtGST.ClientID %>').value;
            var val15 = document.getElementById('<%= txtGTotal.ClientID %>').value;
            var val16 = document.getElementById('<%= txtGrossAmt.ClientID %>').value;
                var val17 = document.getElementById('<%= txtGrossSecond.ClientID %>').value;
                var val18 = document.getElementById('<%= txtGrossThird.ClientID %>').value;
                var val19 = document.getElementById('<%= txtMisc.ClientID %>').value;

            var Rate = obj.value;
                var GrossRateSecond = ((val17) ? document.getElementById('<%= txtGrossSecond.ClientID %>').value : 0);
                var GrossRateThird = ((val18) ? document.getElementById('<%= txtGrossThird.ClientID %>').value : 0);

            var p1 = ((val1) ? document.getElementById('<%= txtAdults.ClientID %>').value : 0);
            var p2 = ((val2) ? document.getElementById('<%= txtChildren.ClientID %>').value : 0);
            var p3 = ((val3) ? document.getElementById('<%= txtInfants.ClientID %>').value : 0);
            var CommRate = ((val4) ? document.getElementById('<%= txtCommPer.ClientID %>').value : 0);
            var TDSRate = ((val11) ? document.getElementById('<%= txtTDSRate.ClientID %>').value : 0);
            var GSTRate = ((val12) ? document.getElementById('<%= txtGSTRate.ClientID %>').value : 0);
            var NCFAmt = ((val6) ? document.getElementById('<%= txtNCF.ClientID %>').value : 0);
            var TAXAmt = ((val7) ? document.getElementById('<%= txtTAX.ClientID %>').value : 0);
            var GTAXAmt = ((val8) ? document.getElementById('<%= txtGTAX.ClientID %>').value : 0);
                var HS = ((val9) ? document.getElementById('<%= txtHS.ClientID %>').value : 0);
                var Misc = ((val19) ? document.getElementById('<%= txtMisc.ClientID %>').value : 0);

                var TotalPassenger = parseInt(p1);
                var TotalPassenger_2 = parseInt(p2);
                var TotalPassenger_3 = parseInt(p3);



            if (Rate != "") {

            var GrossAmt_one = parseInt(TotalPassenger) * parseFloat(Rate);
                var GrossAmt_two = parseInt(TotalPassenger_2) * parseFloat(GrossRateSecond);
                var GrossAmt_three = parseInt(TotalPassenger_3) * parseFloat(GrossRateThird);

                var total = parseFloat(GrossAmt_one) + parseFloat(GrossAmt_two) + parseFloat(GrossAmt_three);

            var commAmt = total * parseFloat(CommRate) / 100;
            var tdsAmt = commAmt * parseFloat(TDSRate) / 100;
            var gstAmt = commAmt * parseFloat(GSTRate) / 100;


            document.getElementById('<%= txtGrossAmt.ClientID %>').value = parseFloat(Math.round(total * 100) / 100).toFixed(2);
            document.getElementById('<%= txtCommAmt.ClientID %>').value = parseFloat(Math.round(commAmt * 100) / 100).toFixed(2);

                var totalAmt = (total - commAmt) + parseFloat(NCFAmt) + parseFloat(TAXAmt) + parseFloat(GTAXAmt) + parseFloat(HS) + parseFloat(Misc);
            document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(totalAmt * 100) / 100).toFixed(2);

            document.getElementById('<%= txtGST.ClientID %>').value = parseFloat(Math.round(gstAmt * 100) / 100).toFixed(2);
            document.getElementById('<%= txtTDS.ClientID %>').value = parseFloat(Math.round(tdsAmt * 100) / 100).toFixed(2);

            var Gtotal = (totalAmt + tdsAmt) - gstAmt;
            document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(Gtotal * 100) / 100).toFixed(2);
            } else {

            document.getElementById('<%= txtGrossAmt.ClientID %>').value = "";
            document.getElementById('<%= txtCommAmt.ClientID %>').value = "";
            document.getElementById('<%= txtGST.ClientID %>').value ="";
            document.getElementById('<%= txtTDS.ClientID %>').value = "";
            document.getElementById('<%= txtGTotal.ClientID %>').value = "";
            document.getElementById('<%= txtTotalAmt.ClientID %>').value = "";

            }


            }         

function GetTotalTwo(obj) {
var val1 = document.getElementById('<%= txtAdults.ClientID %>').value;
var val2 = document.getElementById('<%= txtChildren.ClientID %>').value;
var val3 = document.getElementById('<%= txtInfants.ClientID %>').value;
var val4 = document.getElementById('<%= txtCommPer.ClientID %>').value;
var val5 = document.getElementById('<%= txtCommAmt.ClientID %>').value;
var val6 = document.getElementById('<%= txtNCF.ClientID %>').value;
var val7 = document.getElementById('<%= txtTAX.ClientID %>').value;
var val8 = document.getElementById('<%= txtGTAX.ClientID %>').value;
var val9 = document.getElementById('<%= txtHS.ClientID %>').value;
var val10 = document.getElementById('<%= txtTotalAmt.ClientID %>').value;
var val11 = document.getElementById('<%= txtTDSRate.ClientID %>').value;
var val12 = document.getElementById('<%= txtGSTRate.ClientID %>').value;
var val13 = document.getElementById('<%= txtTDS.ClientID %>').value;
var val14 = document.getElementById('<%= txtGST.ClientID %>').value;
var val15 = document.getElementById('<%= txtGTotal.ClientID %>').value;
var val16 = document.getElementById('<%= txtGrossAmt.ClientID %>').value;
    var val17 = document.getElementById('<%= txtGross.ClientID %>').value;
    var val18 = document.getElementById('<%= txtGrossThird.ClientID %>').value;
    var val19 = document.getElementById('<%= txtMisc.ClientID %>').value;

var Rate = obj.value;
    var GrossRateSecond = ((val17) ? document.getElementById('<%= txtGross.ClientID %>').value : 0);
    var GrossRateThird = ((val18) ? document.getElementById('<%= txtGrossThird.ClientID %>').value : 0);


var p1 = ((val1) ? document.getElementById('<%= txtAdults.ClientID %>').value : 0);
var p2 = ((val2) ? document.getElementById('<%= txtChildren.ClientID %>').value : 0);
var p3 = ((val3) ? document.getElementById('<%= txtInfants.ClientID %>').value : 0);
var CommRate = ((val4) ? document.getElementById('<%= txtCommPer.ClientID %>').value : 0);
var TDSRate = ((val11) ? document.getElementById('<%= txtTDSRate.ClientID %>').value : 0);
var GSTRate = ((val12) ? document.getElementById('<%= txtGSTRate.ClientID %>').value : 0);
var NCFAmt = ((val6) ? document.getElementById('<%= txtNCF.ClientID %>').value : 0);
var TAXAmt = ((val7) ? document.getElementById('<%= txtTAX.ClientID %>').value : 0);
var GTAXAmt = ((val8) ? document.getElementById('<%= txtGTAX.ClientID %>').value : 0);
var HS = ((val9) ? document.getElementById('<%= txtHS.ClientID %>').value : 0);
    var Misc = ((val19) ? document.getElementById('<%= txtMisc.ClientID %>').value : 0);

var TotalPassenger = parseInt(p1);
    var TotalPassenger_2 = parseInt(p2)
    var TotalPassenger_3 = parseInt(p3)



if (Rate != "") {

var GrossAmt_one = parseInt(TotalPassenger) * parseFloat(GrossRateSecond);
    var GrossAmt_two = parseInt(TotalPassenger_2) * parseFloat(Rate);
    var GrossAmt_three = parseInt(TotalPassenger_3) * parseFloat(GrossRateThird);

    var total = parseFloat(GrossAmt_one) + parseFloat(GrossAmt_two) + parseFloat(GrossAmt_three);

var commAmt = total * parseFloat(CommRate) / 100;
var tdsAmt = commAmt * parseFloat(TDSRate) / 100;
var gstAmt = commAmt * parseFloat(GSTRate) / 100;


document.getElementById('<%= txtGrossAmt.ClientID %>').value = parseFloat(Math.round(total * 100) / 100).toFixed(2);
document.getElementById('<%= txtCommAmt.ClientID %>').value = parseFloat(Math.round(commAmt * 100) / 100).toFixed(2);

    var totalAmt = (total - commAmt) + parseFloat(NCFAmt) + parseFloat(TAXAmt) + parseFloat(GTAXAmt) + parseFloat(HS) + parseFloat(Misc);
document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(totalAmt * 100) / 100).toFixed(2);

document.getElementById('<%= txtGST.ClientID %>').value = parseFloat(Math.round(gstAmt * 100) / 100).toFixed(2);
document.getElementById('<%= txtTDS.ClientID %>').value = parseFloat(Math.round(tdsAmt * 100) / 100).toFixed(2);

var Gtotal = (totalAmt + tdsAmt) - gstAmt;
document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(Gtotal * 100) / 100).toFixed(2);
} else {

document.getElementById('<%= txtGrossAmt.ClientID %>').value = "";
document.getElementById('<%= txtCommAmt.ClientID %>').value = "";
document.getElementById('<%= txtGST.ClientID %>').value = "";
document.getElementById('<%= txtTDS.ClientID %>').value = "";
document.getElementById('<%= txtGTotal.ClientID %>').value = "";
document.getElementById('<%= txtTotalAmt.ClientID %>').value = "";

}


}         


function GetTotalThree(obj) {
var val1 = document.getElementById('<%= txtAdults.ClientID %>').value;
var val2 = document.getElementById('<%= txtChildren.ClientID %>').value;
var val3 = document.getElementById('<%= txtInfants.ClientID %>').value;
var val4 = document.getElementById('<%= txtCommPer.ClientID %>').value;
var val5 = document.getElementById('<%= txtCommAmt.ClientID %>').value;
var val6 = document.getElementById('<%= txtNCF.ClientID %>').value;
var val7 = document.getElementById('<%= txtTAX.ClientID %>').value;
var val8 = document.getElementById('<%= txtGTAX.ClientID %>').value;
var val9 = document.getElementById('<%= txtHS.ClientID %>').value;
var val10 = document.getElementById('<%= txtTotalAmt.ClientID %>').value;
var val11 = document.getElementById('<%= txtTDSRate.ClientID %>').value;
var val12 = document.getElementById('<%= txtGSTRate.ClientID %>').value;
var val13 = document.getElementById('<%= txtTDS.ClientID %>').value;
var val14 = document.getElementById('<%= txtGST.ClientID %>').value;
var val15 = document.getElementById('<%= txtGTotal.ClientID %>').value;
var val16 = document.getElementById('<%= txtGrossAmt.ClientID %>').value;
var val17 = document.getElementById('<%= txtGross.ClientID %>').value;
    var val18 = document.getElementById('<%= txtGrossSecond.ClientID %>').value;
       var val19 = document.getElementById('<%= txtMisc.ClientID %>').value;


var Rate = obj.value;
var GrossRateSecond = ((val17) ? document.getElementById('<%= txtGross.ClientID %>').value : 0);
var GrossRateThird = ((val18) ? document.getElementById('<%= txtGrossSecond.ClientID %>').value : 0);

var p1 = ((val1) ? document.getElementById('<%= txtAdults.ClientID %>').value : 0);
var p2 = ((val2) ? document.getElementById('<%= txtChildren.ClientID %>').value : 0);
var p3 = ((val3) ? document.getElementById('<%= txtInfants.ClientID %>').value : 0);
var CommRate = ((val4) ? document.getElementById('<%= txtCommPer.ClientID %>').value : 0);
var TDSRate = ((val11) ? document.getElementById('<%= txtTDSRate.ClientID %>').value : 0);
var GSTRate = ((val12) ? document.getElementById('<%= txtGSTRate.ClientID %>').value : 0);
var NCFAmt = ((val6) ? document.getElementById('<%= txtNCF.ClientID %>').value : 0);
var TAXAmt = ((val7) ? document.getElementById('<%= txtTAX.ClientID %>').value : 0);
var GTAXAmt = ((val8) ? document.getElementById('<%= txtGTAX.ClientID %>').value : 0);
    var HS = ((val9) ? document.getElementById('<%= txtHS.ClientID %>').value : 0);
    var Misc = ((val19) ? document.getElementById('<%= txtMisc.ClientID %>').value : 0);

var TotalPassenger = parseInt(p1);
var TotalPassenger_2 = parseInt(p2)
var TotalPassenger_3 = parseInt(p3)



if (Rate != 0 || Rate != "") {

var GrossAmt_one = parseInt(TotalPassenger) * parseFloat(GrossRateSecond);
var GrossAmt_two = parseInt(TotalPassenger_2) * parseFloat(GrossRateThird);
var GrossAmt_three = parseInt(TotalPassenger_3) * parseFloat(Rate);

var total = parseFloat(GrossAmt_one) + parseFloat(GrossAmt_two) + parseFloat(GrossAmt_three);

var commAmt = total * parseFloat(CommRate) / 100;
var tdsAmt = commAmt * parseFloat(TDSRate) / 100;
var gstAmt = commAmt * parseFloat(GSTRate) / 100;


document.getElementById('<%= txtGrossAmt.ClientID %>').value = parseFloat(Math.round(total * 100) / 100).toFixed(2);
document.getElementById('<%= txtCommAmt.ClientID %>').value = parseFloat(Math.round(commAmt * 100) / 100).toFixed(2);

    var totalAmt = (total - commAmt) + parseFloat(NCFAmt) + parseFloat(TAXAmt) + parseFloat(GTAXAmt) + parseFloat(HS) + parseFloat(Misc);
document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(totalAmt * 100) / 100).toFixed(2);

document.getElementById('<%= txtGST.ClientID %>').value = parseFloat(Math.round(gstAmt * 100) / 100).toFixed(2);
document.getElementById('<%= txtTDS.ClientID %>').value = parseFloat(Math.round(tdsAmt * 100) / 100).toFixed(2);

var Gtotal = (totalAmt + tdsAmt) - gstAmt;
document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(Gtotal * 100) / 100).toFixed(2);
} else {

document.getElementById('<%= txtGrossAmt.ClientID %>').value = "";
document.getElementById('<%= txtCommAmt.ClientID %>').value = "";
document.getElementById('<%= txtGST.ClientID %>').value = "";
document.getElementById('<%= txtTDS.ClientID %>').value = "";
document.getElementById('<%= txtGTotal.ClientID %>').value = "";
document.getElementById('<%= txtTotalAmt.ClientID %>').value = "";

}


}         


function NCFCal(obj) {

var val1 = document.getElementById('<%= txtAdults.ClientID %>').value;
var val2 = document.getElementById('<%= txtChildren.ClientID %>').value;
var val3 = document.getElementById('<%= txtInfants.ClientID %>').value;
var val5 = document.getElementById('<%= txtGrossAmt.ClientID %>').value;
var val6 = document.getElementById('<%= txtCommAmt.ClientID %>').value;
var val7 = document.getElementById('<%= txtTAX.ClientID %>').value;
var val8 = document.getElementById('<%= txtGTAX.ClientID %>').value;
var val9 = document.getElementById('<%= txtHS.ClientID %>').value;
var val10 = document.getElementById('<%= txtTDS.ClientID %>').value;
var val11 = document.getElementById('<%= txtGST.ClientID %>').value;

var p1 = ((val1) ? document.getElementById('<%= txtAdults.ClientID %>').value : 0);
var p2 = ((val2) ? document.getElementById('<%= txtChildren.ClientID %>').value : 0);
var p3 = ((val3) ? document.getElementById('<%= txtInfants.ClientID %>').value : 0);
var GrossAmt = ((val5) ? document.getElementById('<%= txtGrossAmt.ClientID %>').value : 0);
var CommAmt = ((val6) ? document.getElementById('<%= txtCommAmt.ClientID %>').value : 0);
var TAXAmt = ((val7) ? document.getElementById('<%= txtTAX.ClientID %>').value : 0);
var GTAXAmt = ((val8) ? document.getElementById('<%= txtGTAX.ClientID %>').value : 0);
var HS = ((val9) ? document.getElementById('<%= txtHS.ClientID %>').value : 0);
var TDSAmt = ((val10) ? document.getElementById('<%= txtTDS.ClientID %>').value : 0);
var GSTAmt = ((val11) ? document.getElementById('<%= txtGST.ClientID %>').value : 0);

var TotalPassenger = parseInt(p1) + parseInt(p2) + parseInt(p3)
var val4 = obj.value;

if (val4 != 0 || val4 != "") {

var total = parseInt(TotalPassenger) * parseFloat(val4);
document.getElementById('<%= txtNCF.ClientID %>').value = parseFloat(Math.round(total * 100) / 100).toFixed(2);
var NettAmt = parseFloat(GrossAmt) + parseFloat(total) + parseFloat(TAXAmt) + parseFloat(GTAXAmt) + parseFloat(HS) - parseFloat(CommAmt);
document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(NettAmt * 100) / 100).toFixed(2);
var GTotal = parseFloat(NettAmt) + parseFloat(TDSAmt) - parseFloat(GSTAmt);
document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(GTotal * 100) / 100).toFixed(2);

} else {

document.getElementById('<%= txtNCF.ClientID %>').value = "";
var NAmt = parseFloat(GrossAmt) + 0 + parseFloat(TAXAmt) + parseFloat(GTAXAmt) + parseFloat(HS) - parseFloat(CommAmt);
document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(NAmt * 100) / 100).toFixed(2);
var GT = parseFloat(NAmt) + parseFloat(TDSAmt) - parseFloat(GSTAmt);
document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(GT * 100) / 100).toFixed(2);
}

}         


function TAXCal(obj) {

var val1 = document.getElementById('<%= txtAdults.ClientID %>').value;
var val2 = document.getElementById('<%= txtChildren.ClientID %>').value;
var val3 = document.getElementById('<%= txtInfants.ClientID %>').value;
var val5 = document.getElementById('<%= txtGrossAmt.ClientID %>').value;
var val6 = document.getElementById('<%= txtCommAmt.ClientID %>').value;
var val7 = document.getElementById('<%= txtNCF.ClientID %>').value;
var val8 = document.getElementById('<%= txtGTAX.ClientID %>').value;
var val9 = document.getElementById('<%= txtHS.ClientID %>').value;
var val10 = document.getElementById('<%= txtTDS.ClientID %>').value;
var val11 = document.getElementById('<%= txtGST.ClientID %>').value;

var p1 = ((val1) ? document.getElementById('<%= txtAdults.ClientID %>').value : 0);
var p2 = ((val2) ? document.getElementById('<%= txtChildren.ClientID %>').value : 0);
var p3 = ((val3) ? document.getElementById('<%= txtInfants.ClientID %>').value : 0);
var GrossAmt = ((val5) ? document.getElementById('<%= txtGrossAmt.ClientID %>').value : 0);
var CommAmt = ((val6) ? document.getElementById('<%= txtCommAmt.ClientID %>').value : 0);
var NCFAmt = ((val7) ? document.getElementById('<%= txtNCF.ClientID %>').value : 0);
var GTAXAmt = ((val8) ? document.getElementById('<%= txtGTAX.ClientID %>').value : 0);
var HS = ((val9) ? document.getElementById('<%= txtHS.ClientID %>').value : 0);
var TDSAmt = ((val10) ? document.getElementById('<%= txtTDS.ClientID %>').value : 0);
var GSTAmt = ((val11) ? document.getElementById('<%= txtGST.ClientID %>').value : 0);

var TotalPassenger = parseInt(p1) + parseInt(p2) + parseInt(p3)
var val4 = obj.value;

if (val4 != 0 || val4 != "") {

var total = parseInt(TotalPassenger) * parseFloat(val4);
document.getElementById('<%= txtTAX.ClientID %>').value = parseFloat(Math.round(total * 100) / 100).toFixed(2);
var NettAmt = parseFloat(GrossAmt) + parseFloat(total) + parseFloat(NCFAmt) + parseFloat(GTAXAmt) + parseFloat(HS) - parseFloat(CommAmt);
document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(NettAmt * 100) / 100).toFixed(2);
var GTotal = parseFloat(NettAmt) + parseFloat(TDSAmt) - parseFloat(GSTAmt);
document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(GTotal * 100) / 100).toFixed(2);

} else {

document.getElementById('<%= txtTAX.ClientID %>').value = "";
var NAmt = parseFloat(GrossAmt) + 0 + parseFloat(NCFAmt) + parseFloat(GTAXAmt) + parseFloat(HS) - parseFloat(CommAmt);
document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(NAmt * 100) / 100).toFixed(2);
var GT = parseFloat(NAmt) + parseFloat(TDSAmt) - parseFloat(GSTAmt);
document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(GT * 100) / 100).toFixed(2);
}

}         


function GTAXCal(obj) {

var val1 = document.getElementById('<%= txtAdults.ClientID %>').value;
var val2 = document.getElementById('<%= txtChildren.ClientID %>').value;
var val3 = document.getElementById('<%= txtInfants.ClientID %>').value;
var val5 = document.getElementById('<%= txtGrossAmt.ClientID %>').value;
var val6 = document.getElementById('<%= txtCommAmt.ClientID %>').value;
var val7 = document.getElementById('<%= txtNCF.ClientID %>').value;
var val8 = document.getElementById('<%= txtTAX.ClientID %>').value;
var val9 = document.getElementById('<%= txtHS.ClientID %>').value;
var val10 = document.getElementById('<%= txtTDS.ClientID %>').value;
var val11 = document.getElementById('<%= txtGST.ClientID %>').value;

var p1 = ((val1) ? document.getElementById('<%= txtAdults.ClientID %>').value : 0);
var p2 = ((val2) ? document.getElementById('<%= txtChildren.ClientID %>').value : 0);
var p3 = ((val3) ? document.getElementById('<%= txtInfants.ClientID %>').value : 0);
var GrossAmt = ((val5) ? document.getElementById('<%= txtGrossAmt.ClientID %>').value : 0);
var CommAmt = ((val6) ? document.getElementById('<%= txtCommAmt.ClientID %>').value : 0);
var NCFAmt = ((val7) ? document.getElementById('<%= txtNCF.ClientID %>').value : 0);
var TAXAmt = ((val8) ? document.getElementById('<%= txtTAX.ClientID %>').value : 0);
var HS = ((val9) ? document.getElementById('<%= txtHS.ClientID %>').value : 0);
var TDSAmt = ((val10) ? document.getElementById('<%= txtTDS.ClientID %>').value : 0);
var GSTAmt = ((val11) ? document.getElementById('<%= txtGST.ClientID %>').value : 0);

var TotalPassenger = parseInt(p1) + parseInt(p2) + parseInt(p3)
var val4 = obj.value;

if (val4 != 0 || val4 != "") {

var total = parseInt(TotalPassenger) * parseFloat(val4);
document.getElementById('<%= txtGTAX.ClientID %>').value = parseFloat(Math.round(total * 100) / 100).toFixed(2);
var NettAmt = parseFloat(GrossAmt) + parseFloat(total) + parseFloat(NCFAmt) + parseFloat(TAXAmt) + parseFloat(HS) - parseFloat(CommAmt);
document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(NettAmt * 100) / 100).toFixed(2);
var GTotal = parseFloat(NettAmt) + parseFloat(TDSAmt) - parseFloat(GSTAmt);
document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(GTotal * 100) / 100).toFixed(2);

} else {

document.getElementById('<%= txtGTAX.ClientID %>').value = "";
var NAmt = parseFloat(GrossAmt) + 0 + parseFloat(NCFAmt) + parseFloat(TAXAmt) + parseFloat(HS) - parseFloat(CommAmt);
document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(NAmt * 100) / 100).toFixed(2);
var GT = parseFloat(NAmt) + parseFloat(TDSAmt) - parseFloat(GSTAmt);
document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(GT * 100) / 100).toFixed(2);
}

}         


function HSCal(obj) {

var val1 = document.getElementById('<%= txtAdults.ClientID %>').value;
var val2 = document.getElementById('<%= txtChildren.ClientID %>').value;
var val3 = document.getElementById('<%= txtInfants.ClientID %>').value;
var val5 = document.getElementById('<%= txtGrossAmt.ClientID %>').value;
var val6 = document.getElementById('<%= txtCommAmt.ClientID %>').value;
var val7 = document.getElementById('<%= txtNCF.ClientID %>').value;
var val8 = document.getElementById('<%= txtTAX.ClientID %>').value;
var val9 = document.getElementById('<%= txtGTAX.ClientID %>').value;
var val10 = document.getElementById('<%= txtTDS.ClientID %>').value;
var val11 = document.getElementById('<%= txtGST.ClientID %>').value;

var p1 = ((val1) ? document.getElementById('<%= txtAdults.ClientID %>').value : 0);
var p2 = ((val2) ? document.getElementById('<%= txtChildren.ClientID %>').value : 0);
var p3 = ((val3) ? document.getElementById('<%= txtInfants.ClientID %>').value : 0);
var GrossAmt = ((val5) ? document.getElementById('<%= txtGrossAmt.ClientID %>').value : 0);
var CommAmt = ((val6) ? document.getElementById('<%= txtCommAmt.ClientID %>').value : 0);
var NCFAmt = ((val7) ? document.getElementById('<%= txtNCF.ClientID %>').value : 0);
var TAXAmt = ((val8) ? document.getElementById('<%= txtTAX.ClientID %>').value : 0);
var GTAXAmt = ((val9) ? document.getElementById('<%= txtGTAX.ClientID %>').value : 0);
var TDSAmt = ((val10) ? document.getElementById('<%= txtTDS.ClientID %>').value : 0);
var GSTAmt = ((val11) ? document.getElementById('<%= txtGST.ClientID %>').value : 0);

var TotalPassenger = parseInt(p1) + parseInt(p2) + parseInt(p3)
var val4 = obj.value;

if (val4 != 0 || val4 != "") {

var total = parseInt(TotalPassenger) * parseFloat(val4);
document.getElementById('<%= txtHS.ClientID %>').value = parseFloat(Math.round(total * 100) / 100).toFixed(2);
var NettAmt = parseFloat(GrossAmt) + parseFloat(total) + parseFloat(NCFAmt) + parseFloat(TAXAmt) + parseFloat(GTAXAmt) - parseFloat(CommAmt);
document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(NettAmt * 100) / 100).toFixed(2);
var GTotal = parseFloat(NettAmt) + parseFloat(TDSAmt) - parseFloat(GSTAmt);
document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(GTotal * 100) / 100).toFixed(2);

} else {

document.getElementById('<%= txtHS.ClientID %>').value = "";
var NAmt = parseFloat(GrossAmt) + 0 + parseFloat(NCFAmt) + parseFloat(TAXAmt) + parseFloat(GTAXAmt) - parseFloat(CommAmt);
document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(NAmt * 100) / 100).toFixed(2);
var GT = parseFloat(NAmt) + parseFloat(TDSAmt) - parseFloat(GSTAmt);
document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(GT * 100) / 100).toFixed(2);
}

}         

function GetComm(obj) {

            var val1 = document.getElementById('<%= txtGrossAmt.ClientID %>').value;
            var val3 = document.getElementById('<%= txtNCF.ClientID %>').value;
            var val4 = document.getElementById('<%= txtTAX.ClientID %>').value;
            var val5 = document.getElementById('<%= txtGTAX.ClientID %>').value;
            var val6 = document.getElementById('<%= txtHS.ClientID %>').value;
            var val7 = document.getElementById('<%= txtTDS.ClientID %>').value;
            var val8 = document.getElementById('<%= txtGST.ClientID %>').value;
            var val9 = document.getElementById('<%= txtTDSRate.ClientID %>').value;
            var val10 = document.getElementById('<%= txtGSTRate.ClientID %>').value;
            var CommRate = obj.value;

            if (val1) {
            var GrossAmt = document.getElementById('<%= txtGrossAmt.ClientID %>').value;
            } else {
            GrossAmt = 0;
            }

            if (val9) {
            var TDSRate = document.getElementById('<%= txtTDSRate.ClientID %>').value;
            } else {
            TDSRate = 0;
            }
            if (val10) {
            var GSTRate = document.getElementById('<%= txtGSTRate.ClientID %>').value;
            } else {
            GSTRate = 0;
            }

            if (val3) {
            var NCFAmt = document.getElementById('<%= txtNCF.ClientID %>').value;
            } else {
            NCFAmt = 0;
            }

            if (val4) {
            var TAXAmt = document.getElementById('<%= txtTAX.ClientID %>').value;
            } else {
            TAXAmt = 0;
            }
            if (val5) {
            var GTAXAmt = document.getElementById('<%= txtGTAX.ClientID %>').value;
            } else {
            GTAXAmt = 0;
            }

            if (val6) {
            var HS = document.getElementById('<%= txtHS.ClientID %>').value;
            } else {
            HS = 0;
            }

            if (CommRate != 0 || CommRate != "") {


            var total = (parseFloat(GrossAmt) * parseFloat(CommRate)) / 100;
            document.getElementById('<%= txtCommAmt.ClientID %>').value = parseFloat(Math.round(total * 100) / 100).toFixed(2);

            var NettAmount = parseFloat(GrossAmt) + parseFloat(NCFAmt) + parseFloat(TAXAmt) + parseFloat(GTAXAmt) + parseFloat(HS) - parseFloat(total);

            document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(NettAmount * 100) / 100).toFixed(2);

            var tdsAmt = total * parseFloat(TDSRate) / 100;
            var gstAmt = total * parseFloat(GSTRate) / 100;

            document.getElementById('<%= txtTDS.ClientID %>').value = parseFloat(Math.round(tdsAmt * 100) / 100).toFixed(2);
            document.getElementById('<%= txtGST.ClientID %>').value = parseFloat(Math.round(gstAmt * 100) / 100).toFixed(2);

            var TotalAmt = parseFloat(NettAmount) + parseFloat(tdsAmt) - parseFloat(gstAmt);
            document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(TotalAmt * 100) / 100).toFixed(2);
            } else {

            document.getElementById('<%= txtCommAmt.ClientID %>').value = "";
            document.getElementById('<%= txtTDS.ClientID %>').value = "";
            document.getElementById('<%= txtGST.ClientID %>').value = "";
            var amtWithoutComm = parseFloat(GrossAmt) + parseFloat(NCFAmt) + parseFloat(TAXAmt) + parseFloat(GTAXAmt) + parseFloat(HS);
            document.getElementById('<%= txtTotalAmt.ClientID %>').value = parseFloat(Math.round(amtWithoutComm * 100) / 100).toFixed(2);
            document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(amtWithoutComm * 100) / 100).toFixed(2);
            }
}  
                    

function GetTDS(obj) {
            var val1 = document.getElementById('<%= txtCommAmt.ClientID %>').value;
            var val2 = document.getElementById('<%= txtGST.ClientID %>').value;
            var val3 = document.getElementById('<%= txtTotalAmt.ClientID %>').value;

            var TDSRate = obj.value;

            var CommAmt = ((val1) ? document.getElementById('<%= txtCommAmt.ClientID %>').value : 0);
            var GSTAmt = ((val2) ? document.getElementById('<%= txtGST.ClientID %>').value : 0);
            var TotalAmt = ((val3) ? document.getElementById('<%= txtTotalAmt.ClientID %>').value : 0);

            if (TDSRate != 0 || TDSRate != "") {

            var total = (parseFloat(CommAmt) * parseFloat(TDSRate)) / 100;
            document.getElementById('<%= txtTDS.ClientID %>').value = parseFloat(Math.round(total * 100) / 100).toFixed(2);
            var GTotal = parseFloat(TotalAmt) + parseFloat(total) - parseFloat(GSTAmt);
            document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(GTotal * 100) / 100).toFixed(2);
            } else {
            document.getElementById('<%= txtTDS.ClientID %>').value = "";
            var GT = parseFloat(TotalAmt) - parseFloat(GSTAmt);
            document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(GT * 100) / 100).toFixed(2);
            }
}         

function GetGST(obj) {

        var val1 = document.getElementById('<%= txtCommAmt.ClientID %>').value;
        var val2 = document.getElementById('<%= txtTDS.ClientID %>').value;
        var val3 = document.getElementById('<%= txtTotalAmt.ClientID %>').value;

        var GSTRate = obj.value;

        var CommAmt = ((val1) ? document.getElementById('<%= txtCommAmt.ClientID %>').value : 0);
        var TDSAmt = ((val2) ? document.getElementById('<%= txtTDS.ClientID %>').value : 0);
        var TotalAmt = ((val3) ? document.getElementById('<%= txtTotalAmt.ClientID %>').value : 0);

        if (GSTRate != 0 || GSTRate != "") {

        var total = (parseFloat(CommAmt) * parseFloat(GSTRate)) / 100;
        document.getElementById('<%= txtGST.ClientID %>').value = parseFloat(Math.round(total * 100) / 100).toFixed(2);
        var GTotal = parseFloat(TotalAmt) + parseFloat(TDSAmt) - parseFloat(total);
        document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(GTotal * 100) / 100).toFixed(2);
        } else {
        document.getElementById('<%= txtGST.ClientID %>').value = "";
        var GT = parseFloat(TotalAmt) + parseFloat(TDSAmt);
        document.getElementById('<%= txtGTotal.ClientID %>').value = parseFloat(Math.round(GT * 100) / 100).toFixed(2);
        }
}  
         
</script>
       
<style type="text/css">
.upper-case
{
text-transform: uppercase;
}
   td {
    padding-top: .5em;
    padding-bottom: .5em;
}  
   textarea {
   resize: none;
}
.style27
{
height: 33px;
width: 500px;
}
.style29
{
height: 32px;
text-align: center;
font-weight: 700;
font-size: medium;
color: #800000;
}
#tb2{
    float:right;
}
.style30
{
height: 33px;
text-align:right;
font-weight: 700;
font-size: medium;
            
}
.style34
{
width: 15px;
height: 33px;
text-align: left;
}
.btn-space {
margin-right: 5px;
}
.style46
{
          
height: 33px;
}
.style48
{
width: 171px;
height: 35px;
padding-left: 5px;
}
.style51
{
font-size:medium;
}

.style55
{
height: 33px;
font-family: Calibri;
width: 150px;
text-align: left;
padding-left: 5px;
}
</style>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


  

<div class="form-row">
        
     <div class="form-group col-md-12 form-group-sm">
          <h4><span class="label label-primary">EDIT INVOICE</span></h4>
     </div>
     <div class="form-group col-md-6 form-group-sm">
             <table>
                       <tr>
                           <td>Invoice Date #</td>
                           <td>   
                                <div class='input-group date' id='startDate'>  
                                 <asp:TextBox ID="txtInvoiceDate" runat="server" class="form-control" width="150px" placeholder="Bill Date"/> <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                              
                           </td>
                        </tr>
                        <tr>
                            <td>Invoice No #</td>
                            <td>
                                <asp:TextBox ID="invoice" runat="server"  class="form-control" width="190px" MaxLength="10"
                                    required="required" ValidationGroup="Form" onkeypress="return ValidateNumbers(event)"
                                    onpaste="return false"  ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td >Agent Name #
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSearch"   runat="server"  class="form-control upper-case" width="325px" ></asp:DropDownList>                              
                            </td>
                        </tr>
                        <tr>
                            <td>Departure Date #</td>
                            <td>                              
                                <div class='input-group date' id='endDate'>  
                                 <asp:TextBox ID="txtDepartureDate" runat="server" class="form-control" width="150px" placeholder="Bill Date"/> <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                                                   
                            </td>
                        </tr>
                         <tr>
                            <td >Cruise Ship #
                            </td>
                            <td>
                                <asp:TextBox ID="txtCruiseShip"   runat="server"  class="form-control upper-case" width="325px" ></asp:TextBox>                              
                            </td>
                        </tr>
                          <tr>
                            <td >Cruise #
                            </td>
                            <td>
                                <asp:TextBox ID="txtCruise"   runat="server"  class="form-control upper-case" width="325px" ></asp:TextBox>                              
                            </td>
                        </tr>

                        <tr>
                            <td>Currency #</td>
                            <td>
                                <asp:DropDownList ID = "ddlCurrency" runat="server"  class="form-control" width="190px" style="margin-left: 0px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                          <tr>
                            <td>Bookings #</td>
                            <td>
                                <asp:TextBox ID = "txtBooking" runat="server"  class="form-control" width="190px" style="margin-left: 0px"  onkeypress="return ValidateNumbers(event)"
                                    onpaste="return false" MaxLength="10">
                                </asp:TextBox>
                            </td>
                        </tr>
                          <tr>
                            <td >Cabin #
                            </td>
                            <td>
                                <asp:TextBox ID="txtCabin"   runat="server"  class="form-control upper-case" width="190px" ></asp:TextBox>                              
                            </td>
                        </tr>
                          <tr>
                            <td >Cat.. Bkg. #
                            </td>
                            <td>
                                <asp:TextBox ID="txtCat"   runat="server"  class="form-control upper-case" width="190px" ></asp:TextBox>                              
                            </td>
                        </tr>
                         <tr>
                            <td>                           
                                Nationality #
                            </td>
                            <td>
                                <asp:TextBox ID="txtNationality" runat="server" class="form-control upper-case" width="190px"></asp:TextBox>
                            </td>
                        </tr>
                           <tr>
                            <td>Passenger Name #</td>
                            <td>
                                <asp:TextBox ID="txtPassName" runat="server" class="form-control upper-case" width="325px"></asp:TextBox>
                            </td>
                        </tr>
                       

                        <tr>
                            <td>Adults #</td>
                            <td>
                                <asp:TextBox ID="txtAdults" runat="server" Width="105px" placeholder=" Adults" class="form-inline" MaxLength="2" 
                                        ValidationGroup="Form"  onKeyUp="AdultsCheck(this);" onkeypress="return ValidateNumbers(event)"
                                    onpaste="return false" ></asp:TextBox>
                           
                                <asp:TextBox ID="txtChildren" runat="server" Width="105px" class="form-inline" placeholder=" Kids" MaxLength="2"
                                        onkeypress="return ValidateNumbers(event)" onKeyUp="ChildrenCheck(this);"
                                    onpaste="return false" ></asp:TextBox>
                         
                                <asp:TextBox ID="txtInfants" runat="server" Width="105px" class="form-inline"  placeholder=" Infants" MaxLength="2"
                                    onkeypress="return ValidateNumbers(event)" onKeyUp="InfantsCheck(this);"
                                    onpaste="return false"></asp:TextBox>
                            </td>
                        </tr>
                     
                        <tr>
                            <td>                               
                                Rate (Adult) #
                            </td>
                            <td>                               
                                    <asp:TextBox ID="txtGross" runat="server"  placeholder=" Rate (Adults)" onKeyUp="GetTotal(this);"  Width="105px" class="form-inline" onkeypress="return isNumberKey(event,this);"
                                    onpaste="return false"  >
                                </asp:TextBox>                                

                                    <asp:TextBox ID="txtGrossSecond" runat="server" placeholder=" Rate (Kids)" onKeyUp="GetTotalTwo(this);"  Width="105px" class="form-inline"
                                    ValidationGroup="Form" onkeypress="return isNumberKey(event,this);"
                                    onpaste="return false" >
                                    </asp:TextBox>

                                
                                    <asp:TextBox ID="txtGrossThird" runat="server" placeholder=" Rate (Infants)"  onKeyUp="GetTotalThree(this);"  Width="105px" class="form-inline"
                                    ValidationGroup="Form" onkeypress="return isNumberKey(event,this);"
                                    onpaste="return false" >
                                    </asp:TextBox>
                            </td>
                            
                        </tr>
                    
        </table>
    </div>
 

     <div class="form-group col-md-6 form-group-sm">
                <table id="tb2">
                     <tr">
                        <td>Gross Amount #</td>
                        <td></td>
                        <td>
                            <asp:TextBox ID="txtGrossAmt" runat="server" class="form-control" BackColor="#FEF3E9" 
                                onkeypress="javascript:return false;"
                                style="font-family: Arial; text-align: left;" ></asp:TextBox>
                        </td>
                     </tr>
                    <tr>
                        <td>Comm.(@rate)</td>
                        <td>
                            <asp:TextBox ID="txtCommPer"  onKeyUp="GetComm(this);" class="form-control" runat="server" onkeypress="return isNumberKey(event,this);"
                                 Width="100px" style="padding-right: 5px;"></asp:TextBox>
                              
                        </td>
                      
                        <td>
                            <asp:TextBox ID="txtCommAmt" runat="server" class="form-control" BackColor="#FEF3E9" 
                                 onkeypress="javascript:return false;"
                                style="font-family: Arial;"></asp:TextBox>
                        </td>
                    </tr>
                      <tr>
                        <td>NCF #</td>
                        <td>
                            <asp:TextBox ID="txtNCFRate"  onKeyUp="NCFCal(this);" class="form-control" runat="server" onkeypress="return isNumberKey(event,this);"
                                 Width="100px" ></asp:TextBox>
                              
                        </td>
                      
                        <td>
                            <asp:TextBox ID="txtNCF" runat="server" class="form-control" BackColor="#FEF3E9" 
                                 onkeypress="javascript:return false;"
                                style="font-family: Arial;"></asp:TextBox>
                        </td>
                    </tr>
                       <tr>
                        <td>TAXES #</td>
                        <td>
                            <asp:TextBox ID="txtTAXRate"  onKeyUp="TAXCal(this);" class="form-control" runat="server" onkeypress="return isNumberKey(event,this);"
                                 Width="100px" ></asp:TextBox>
                              
                        </td>
                      
                        <td>
                            <asp:TextBox ID="txtTAX" runat="server" class="form-control" BackColor="#FEF3E9" 
                                 onkeypress="javascript:return false;"
                                style="font-family: Arial;"></asp:TextBox>
                        </td>
                    </tr>
                      <tr>
                        <td>GRAT.. #</td>
                        <td>
                            <asp:TextBox ID="txtGTAXRate"  onKeyUp="GTAXCal(this);" class="form-control" runat="server" onkeypress="return isNumberKey(event,this);"
                                 Width="100px" ></asp:TextBox>
                              
                        </td>
                      
                        <td>
                            <asp:TextBox ID="txtGTAX" runat="server" class="form-control" BackColor="#FEF3E9" 
                                 onkeypress="javascript:return false;"
                                style="font-family: Arial;"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td> Holiday Sur.. #</td>
                        <td>
                            <asp:TextBox ID="txtHSRate"   onKeyUp="HSCal(this);" class="form-control" runat="server" onkeypress="return isNumberKey(event,this);"
                                 Width="100px" ></asp:TextBox>
                              
                        </td>
                      
                        <td>
                            <asp:TextBox ID="txtHS" runat="server" class="form-control" BackColor="#FEF3E9" 
                                 onkeypress="javascript:return false;"
                                style="font-family: Arial;"></asp:TextBox>
                        </td>
                    </tr>
                    
                   
                    <tr>
                            <td>Misc.Exp #</td>
                            <td></td>
                            <td><asp:TextBox ID="txtMisc"   onKeyUp="MiscCheck(this);" runat="server" class="form-control" onkeypress="return isNumberKey(event,this);"
                                    BackColor="#FEF3E9"  ></asp:TextBox>
                            </td>
                           
                    </tr>
                     <tr>
                        <td><strong>Total Amount # </strong> </td>
                        <td> </td>
                        <td>
                                <asp:TextBox ID="txtTotalAmt" runat="server"  class="form-control"  BackColor="#FEF3E9" 
                                onkeypress="javascript:return false;"
                                    style="font-family: Arial; font-weight: 700; text-align: left;"
                                    ForeColor="Maroon"></asp:TextBox>
                        </td>
                </tr>
                    <tr>
                        <td>GST @ (Rate)</td>
                        <td>
                            <asp:TextBox ID="txtGSTRate"  onKeyUp="GetGST(this);" class="form-control" runat="server" onkeypress="return isNumberKey(event,this);"
                               Width="100px" ></asp:TextBox>
                               
                        </td>
                        <td>
                                <asp:TextBox ID="txtGST" runat="server" class="form-control" BackColor="#FEF3E9" 
                                 onkeypress="javascript:return false;"
                                    style="font-family: Arial; "></asp:TextBox>
                        </td>
                    </tr>       
                     <tr>
                        <td>TDS @ (Rate) </td>
                        <td>
                            <asp:TextBox ID="txtTDSRate" onKeyUp="GetTDS(this);" class="form-control" runat="server" onkeypress="return isNumberKey(event,this);"
                               Width="100px" ></asp:TextBox>
                               
                        </td>
                        <td>
                                <asp:TextBox ID="txtTDS" runat="server" onKeyUp="BankAmountCheck(this);" class="form-control"  onkeypress="return isNumberKey(event,this);" BackColor="#FEF3E9">
                                  </asp:TextBox>
                        </td>
                    </tr>  
                    <tr>
                    <td>Token/Advance</td>
                    <td>
                        <asp:CheckBox ID="cbToken"  runat="server" style="padding: 6px;" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtToken" class="form-control" runat="server" 
                            BackColor="#FEF3E9"  style="font-family: Arial; text-align: left;" 
                             onkeypress="return isNumberKey(event,this);"></asp:TextBox>

                    </td>
                </tr>
                 <tr>
                        <td><strong>Grand Total # </strong> </td>
                        <td> </td>
                        <td>
                                <asp:TextBox ID="txtGTotal" runat="server"  class="form-control"  BackColor="#FEF3E9" 
                                onkeypress="javascript:return false;"
                                    style="font-family: Arial; font-weight: 700; text-align: left;"
                                    ForeColor="Maroon"></asp:TextBox>
                        </td>
                </tr>
                    
                    <tr>
                    <td>ROE  #</td>
                  
                    <td> <asp:TextBox ID="txtROE" runat="server" class="form-control"
                           Width="100px" onkeypress="return isNumberKey(event,this);"></asp:TextBox>  </td>   
                      <td>  </td>
                 </tr>
                  
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <%--<asp:Button ID="btnDownload" runat="server" Class="btn btn-info navbar-btn pull-right btn-space" Text="DOWNLOAD" onclick="btnDownload_Click" />--%>                           
                        <%--<asp:Button ID="btnAddnew" runat="server" Class="btn btn-info navbar-btn pull-right btn-space" Text="NEW" onclick="Button3_Click" />--%>
                        <button id="btnUpdate" class="btn btn-info navbar-btn pull-right btn-space" >UPDATE</button>

                    </td>
                </tr>
          </table>
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


<script type="text/javascript">
    $(document).ready(function () {
        var in_number = null;
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
                in_number = queryString["IN"];
                //$("h3").html(in_number);
            }


            // var empId = in_number;
            console.log(in_number);

            $.ajax({
                url: 'InvoiceEntry.asmx/GetInvoiceById',
                data: { Invoice_Number: in_number },
                type: 'post',
                dataType: 'json',
                success: function (r) {

                    $('#<%=invoice.ClientID%>').val(r.Invoice_Number);
                    var date = new Date(parseInt(r.Invoice_Date.substr(6)));
                    var month = date.getMonth() + 1;
                    InvoiceDate = date.getDate() + "/" + month + "/" + date.getFullYear();                    
                    $('#<%=txtInvoiceDate.ClientID%>').val(InvoiceDate);
                  <%--  $('#<%=ddlSearch.ClientID%> option:selected').text(r.Agent_Name); --%>                 
                    var date = new Date(parseInt(r.Departure_Date.substr(6)));
                    var month = date.getMonth() + 1;
                    DepartureDate = date.getDate() + "/" + month + "/" + date.getFullYear();
                    $('#<%=txtDepartureDate.ClientID%>').val(DepartureDate);
                  <%--  $('#<%=ddlCurrency.ClientID%> option:selected').text(r.Currency);--%>

                    var cruise = (r.Cruise);
                     if (cruise == "none" || cruise == "NONE") {
                        $('#<%=txtCruise.ClientID%>').val("");
                     } else {
                         $('#<%=txtCruise.ClientID%>').val(r.Cruise);
                    }
                      var cruiseship = (r.Cruise_Ship);
                     if (cruiseship == "none" || cruiseship == "NONE") {
                        $('#<%=txtCruiseShip.ClientID%>').val("");
                     } else {
                         $('#<%=txtCruiseShip.ClientID%>').val(r.Cruise_Ship);
                    }
                    var cabin = (r.Cabin);
                     if (cabin == "none" || cabin == "NONE") {
                        $('#<%=txtCabin.ClientID%>').val("");
                     } else {
                         $('#<%=txtCabin.ClientID%>').val(r.Cabin);
                    }
                    var catbkg = (r.Cat_Bkg);
                     if (catbkg == "none" || catbkg == "NONE") {
                        $('#<%=txtCat.ClientID%>').val("");
                     } else {
                         $('#<%=txtCat.ClientID%>').val(r.Cat_Bkg);
                    }
                    var booking = (r.Booking);
                     if (booking == 0 || booking == 0.00) {
                        $('#<%=txtBooking.ClientID%>').val("");
                     } else {
                         $('#<%=txtBooking.ClientID%>').val(r.Booking);
                    }
                    $('#<%=txtAdults.ClientID%>').val(r.Adults);
                    $('#<%=txtChildren.ClientID%>').val(r.Children);
                    $('#<%=txtInfants.ClientID%>').val(r.Infants);
                    var PassName = (r.Pass_Name);
                    if (PassName == "none" || PassName == "NONE") {
                        $('#<%=txtPassName.ClientID%>').val("");
                        } else {
                            $('#<%=txtPassName.ClientID%>').val(r.Pass_Name);
                    }
                    var Nationality = (r.Nationality);
                    if (Nationality == "none" || Nationality == "NONE") {
                        $('#<%=txtNationality.ClientID%>').val("");
                        } else {
                            $('#<%=txtNationality.ClientID%>').val(r.Nationality);
                    }
                    $('#<%=txtGross.ClientID%>').val(r.Gross_Rate);
                    $('#<%=txtGrossSecond.ClientID%>').val(r.Gross_Rate_Second);
                    $('#<%=txtGrossThird.ClientID%>').val(r.Gross_Rate_Third);
                  
                    $('#<%=txtGrossAmt.ClientID%>').val(r.Gross_Amount);
                    $('#<%=txtCommPer.ClientID%>').val(r.Comm_Rate);
                    $('#<%=txtCommAmt.ClientID%>').val(r.Comm_Amt);
                    $('#<%=txtMisc.ClientID%>').val(r.MiscAmt);
                    $('#<%=txtGSTRate.ClientID%>').val(r.GST_Rate);
                    $('#<%=txtGST.ClientID%>').val(r.GST_Amount);
                    $('#<%=txtTDSRate.ClientID%>').val(r.TDS_Rate);
                    $('#<%=txtTDS.ClientID%>').val(r.TDS);
                    $('#<%=txtToken.ClientID%>').val(r.advance);
                    $('#<%=txtROE.ClientID%>').val(r.ROE);
                    var CheckToken = (r.cbToken);
                    if (CheckToken == 'Y') {
                        $('#<%=cbToken.ClientID%>').prop('checked', true);
                    }
                    $('#<%=txtGTotal.ClientID%>').val(r.GTotal);
                    $('#<%=txtTotalAmt.ClientID%>').val(r.Total);
                    $('#<%=txtNCFRate.ClientID%>').val(r.NCFRate);
                    $('#<%=txtNCF.ClientID%>').val(r.NCF);
                    $('#<%=txtTAXRate.ClientID%>').val(r.TAXRate);
                    $('#<%=txtTAX.ClientID%>').val(r.TAX);
                    $('#<%=txtGTAXRate.ClientID%>').val(r.GTAXRate);
                    $('#<%=txtGTAX.ClientID%>').val(r.GTAX);
                    $('#<%=txtHSRate.ClientID%>').val(r.HSRate);
                    $('#<%=txtHS.ClientID%>').val(r.HS);
                },
                error: function (err) {
                    alert(err);
                }
            });
            });       
        function getAllEmpData() {          
            var data = [];

            $('tr').each(function () {              
                var invoicenumber = ((document.getElementById('<%=invoice.ClientID%>').value) ? (document.getElementById('<%=invoice.ClientID%>').value) : 0);
                      
                var invoicedate = dateFormat((document.getElementById('<%=txtInvoiceDate.ClientID%>').value));
                console.log(invoicedate);                
           
                var departuredate = dateFormat((document.getElementById('<%=txtDepartureDate.ClientID%>').value));
                 console.log(departuredate);    
                var agentname = ((document.getElementById('<%=ddlSearch.ClientID%>').value) ? (document.getElementById('<%=ddlSearch.ClientID%>').value) : 0);
                var passname = ((document.getElementById('<%=txtPassName.ClientID%>').value) ? (document.getElementById('<%=txtPassName.ClientID%>').value) : 'none');
                var cruiship = ((document.getElementById('<%=txtCruiseShip.ClientID%>').value) ? (document.getElementById('<%=txtCruiseShip.ClientID%>').value) : 'none');
                var cruise = ((document.getElementById('<%=txtCruise.ClientID%>').value) ? (document.getElementById('<%=txtCruise.ClientID%>').value) : 'none');
                var booking = ((document.getElementById('<%=txtBooking.ClientID%>').value) ? (document.getElementById('<%=txtBooking.ClientID%>').value) : 0);
                var cabin = ((document.getElementById('<%=txtCabin.ClientID%>').value) ? (document.getElementById('<%=txtCabin.ClientID%>').value) : 'none');
                var catbkg = ((document.getElementById('<%=txtCat.ClientID%>').value)?(document.getElementById('<%=txtCat.ClientID%>').value) : 'none');
                var nationality = ((document.getElementById('<%=txtNationality.ClientID%>').value)?(document.getElementById('<%=txtNationality.ClientID%>').value):'none');
                var currency = ((document.getElementById('<%=ddlCurrency.ClientID%>').value) ? (document.getElementById('<%=ddlCurrency.ClientID%>').value) :'none' );
                var adults = ((document.getElementById('<%=txtAdults.ClientID%>').value) ? (document.getElementById('<%=txtAdults.ClientID%>').value) : 0);
                var children = ((document.getElementById('<%=txtChildren.ClientID%>').value) ? (document.getElementById('<%=txtChildren.ClientID%>').value) : 0);
                var infants = ((document.getElementById('<%=txtInfants.ClientID%>').value) ? (document.getElementById('<%=txtInfants.ClientID%>').value) :0);
                var pax = (parseInt(adults) + parseInt(children) + parseInt(infants));
                var rate1 = ((document.getElementById('<%=txtGross.ClientID%>').value) ? (document.getElementById('<%=txtGross.ClientID%>').value) :0 );
                var rate2 = ((document.getElementById('<%=txtGrossSecond.ClientID%>').value) ? document.getElementById('<%=txtGrossSecond.ClientID%>').value :0);
                var rate3 = ((document.getElementById('<%=txtGrossThird.ClientID%>').value) ? (document.getElementById('<%=txtGrossThird.ClientID%>').value) :0);
                var grossamt = ((document.getElementById('<%=txtGrossAmt.ClientID%>').value) ? (document.getElementById('<%=txtGrossAmt.ClientID%>').value) : 0);
                var commrate = ((document.getElementById('<%=txtCommPer.ClientID%>').value) ? (document.getElementById('<%=txtCommPer.ClientID%>').value) :0 );
                var commamt = ((document.getElementById('<%=txtCommAmt.ClientID%>').value) ? (document.getElementById('<%=txtCommAmt.ClientID%>').value) :0 );
                var ncfrate = ((document.getElementById('<%=txtNCFRate.ClientID%>').value) ? (document.getElementById('<%=txtNCFRate.ClientID%>').value) :0 );
                var ncfamt = ((document.getElementById('<%=txtNCF.ClientID%>').value) ? (document.getElementById('<%=txtNCF.ClientID%>').value) :0 );
                var taxrate = ((document.getElementById('<%=txtTAXRate.ClientID%>').value) ? (document.getElementById('<%=txtTAXRate.ClientID%>').value) :0 );
                var taxamt = ((document.getElementById('<%=txtTAX.ClientID%>').value) ? (document.getElementById('<%=txtTAX.ClientID%>').value) :0 );
                var gtaxrate = ((document.getElementById('<%=txtGTAXRate.ClientID%>').value) ? (document.getElementById('<%=txtGTAXRate.ClientID%>').value) :0 );
                var gtaxamt = ((document.getElementById('<%=txtGTAX.ClientID%>').value) ? (document.getElementById('<%=txtGTAX.ClientID%>').value) :0 );
                var hsrate = ((document.getElementById('<%=txtHSRate.ClientID%>').value) ? (document.getElementById('<%=txtHSRate.ClientID%>').value) :0 );
                var hsamt = ((document.getElementById('<%=txtHS.ClientID%>').value) ? (document.getElementById('<%=txtHS.ClientID%>').value) : 0);
                var miscamt = ((document.getElementById('<%=txtMisc.ClientID%>').value) ? (document.getElementById('<%=txtMisc.ClientID%>').value) : 0);
                var totalamt = ((document.getElementById('<%=txtTotalAmt.ClientID%>').value) ? (document.getElementById('<%=txtTotalAmt.ClientID%>').value) :0 );
                var tdsrate = ((document.getElementById('<%=txtTDSRate.ClientID%>').value) ? (document.getElementById('<%=txtTDSRate.ClientID%>').value) : 0);
                var tdsamt = ((document.getElementById('<%=txtTDS.ClientID%>').value) ? (document.getElementById('<%=txtTDS.ClientID%>').value) :0 );
                var gstrate = ((document.getElementById('<%=txtGSTRate.ClientID%>').value) ? (document.getElementById('<%=txtGSTRate.ClientID%>').value) :0 );
                var gstamt = ((document.getElementById('<%=txtGST.ClientID%>').value) ? document.getElementById('<%=txtGST.ClientID%>').value : 0 );
              
                var advamt = ((document.getElementById('<%=txtToken.ClientID%>').value) ? (document.getElementById('<%=txtToken.ClientID%>').value) : 0);
                var roe = ((document.getElementById('<%=txtROE.ClientID%>').value) ? document.getElementById('<%=txtROE.ClientID%>').value :0 );

                var advamtinr = ((roe) ? parseFloat(advamt) * parseFloat(roe) : 0);
                var grandtotalamt = ((document.getElementById('<%=txtGTotal.ClientID%>').value)? (document.getElementById('<%=txtGTotal.ClientID%>').value) :0);

                var tokenval = document.getElementById('<%=cbToken.ClientID%>').checked;

                if (tokenval == true) {
                    var token = 'Y';
                } else {
                    var token = 'N';
                }

                var ddlCurrency = document.getElementById('<%=ddlCurrency.ClientID %>');             
                var selectedText = ddlCurrency.options[ddlCurrency.selectedIndex].innerHTML;
                console.log(selectedText);
                if (selectedText != "INR") {

                    var calcamtinr = parseFloat(grandtotalamt) * parseFloat(roe);
                    var totalinr = parseFloat(Math.round(calcamtinr * 100) / 100).toFixed(2);
                }
                else {
                    var calcamtinr = parseFloat(grandtotalamt);
                    var totalinr = parseFloat(Math.round(calcamtinr * 100) / 100).toFixed(2);
                                  
                }
              

                 var alldata =  {
                    'Invoice_Number': invoicenumber,
                    'Invoice_Date': invoicedate,
                    'Departure_Date': departuredate,
                    'Agent_Name': agentname,
                     'Pass_Name': passname,
                     'Cruise_Ship': cruiship,
                     'Cruise': cruise,
                     'Booking': booking,
                     'Cabin': cabin,
                     'Cat_Bkg': catbkg,
                    'Nationality': nationality,
                    'Currency': currency,
                    'Adults': adults,
                    'Children': children,
                    'Infants': infants,
                    'PAX': pax,
                    'Gross_Rate': rate1,
                    'Gross_Rate_Second': rate2,
                    'Gross_Rate_Third': rate3,
                    'Gross_Amount': grossamt,
                    'Comm_Rate': commrate,
                     'Comm_Amt': commamt,
                     'NCFRate': ncfrate,
                     'NCF': ncfamt,
                     'TAXRate': taxrate,
                     'TAX': taxamt,
                     'GTAXRate': gtaxrate,
                     'GTAX': gtaxamt,
                     'HSRate': hsrate,
                     'HS': hsamt,
                    'GST_Rate': gstrate,
                     'GST_Amount': gstamt,
                     'TDS_Rate': tdsrate,
                     'TDS': tdsamt,
                    'MiscAmt': miscamt,
                    'advance': advamt,
                    'AdvanceINR': advamtinr,
                    'GTotal': grandtotalamt,
                    'ROE': roe,
                     'cbToken': token,
                     'TotalINR': totalinr,
                     'Total':totalamt

                 }
                data.push(alldata);  
                return false;
            });
                console.log(data);
                return data;
          
        }

         function dateFormat(checkDate)
         {
            var edate = checkDate;
            var dateParts = edate.split("/");
            var dateObject = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]);

            var myDate = new Date(dateObject);           
            var d = myDate.getDate();
            var m = myDate.getMonth();
            m += 1;  
            var y = myDate.getFullYear();
            var newdate=(y+ "-" + m + "-" + d);
            return newdate;
         }


        $("#btnUpdate").click(function () {


                  var ddlSearch = document.getElementById('<%=ddlSearch.ClientID %>');             
                            var selectedText = ddlSearch.options[ddlSearch.selectedIndex].innerHTML; 
                            var adultName = ((document.getElementById('<%=txtAdults.ClientID %>').value) ? (document.getElementById('<%= txtAdults.ClientID %>').value):"");
                            var grossRate = ((document.getElementById('<%=txtGross.ClientID %>').value)?(document.getElementById('<%= txtGross.ClientID %>').value):"");                 
                           

                                 if (selectedText == "-- Select Agent --" || ddlSearch == "") {
                                  document.getElementById('<%= ddlSearch.ClientID %>').focus();
                                      
                                        return false;
                                 } else if (adultName==""){

                                    document.getElementById('<%= txtAdults.ClientID %>').focus();
                                   
                                    return false;
                                 } else if (grossRate == "") {
                                     document.getElementById('<%= txtGross.ClientID %>').focus();                                  
                                    return false;
                                 } 
           

           
                    var data = JSON.stringify(getAllEmpData());
                    console.log(data);
                    $.ajax({
                        url: 'InvoiceEdit.aspx/UpdateInvoice',
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        data: JSON.stringify({ 'empdata': data }),
                       
                        success: function (response) {
                            console.log(response.d);                           
                            alert("Invoice Updated Successfully");
                             var url = "../WebForms/InvoiceList.aspx";
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