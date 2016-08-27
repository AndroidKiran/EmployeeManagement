<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.text.SimpleDateFormat" %>


<html>
    <head>
                <!-- HTTP 1.1 -->
        <meta http-equiv="Cache-Control" content="no-store"/>
        <!-- HTTP 1.0 -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <!-- Prevents caching at the Proxy Server -->
        <meta http-equiv="Expires" content="0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="icon" href="/maa/images/favicon.ico"/>
        <title>rx  - Order Booking </title>

        <link rel="stylesheet" type="text/css" media="all" href="/maa/css/rx.css" />
      	<link rel="stylesheet" type="text/css" href="/maa/commonyui/build/reset/reset.css" />
		<link rel="stylesheet" type="text/css" href="/maa/commonyui/build/fonts/fonts.css" />
		<link rel="stylesheet" type="text/css" href="/maa/css/dcr.css" />
		<link rel="stylesheet" type="text/css" href="/maa/css/common.css" />
		<style>
			html {
				background:none;
			}
		</style>
        <script type="text/javascript" src="/maa/javascripts/calender.js"></script>
        <script type="text/javascript" src="/maa/script/calendar.js" ></script>
		<script type="text/javascript" src="/maa/javascripts/validations.js"></script>
		<script type="text/javascript" src="/maa/javascripts/SASvalidation.js"></script>
		<script type="text/javascript" src="/maa/javascripts/dateValidation.js"></script>
	
		<script type="text/javascript" src="/maa/commonyui/build/yahoo/yahoo.js"></script>
		<script type="text/javascript" src="/maa/commonyui/build/dom/dom.js"></script>
		<script type="text/javascript" src="/maa/commonyui/build/autocomplete/autocomplete-debug.js"></script>
		<script type="text/javascript" src="/maa/commonyui/build/event/event-debug.js"></script>
		<script type="text/javascript" src="/maa/commonyui/build/animation/animation.js"></script>
		<script type="text/javascript" src="/maa/commonjs/ajaxCommonFunctions.js"></script>
		
		<script type="text/javascript" src="/maa/script/jsCommonMethods.js"></script>
		
		<script type="text/javascript" src="/maa/javascripts/commonjs/calendar.js"></script>
		<script type="text/javascript" src="/maa/javascripts/dateValidation.js"></script>
    </head>
    
<body >



<div class="commontopyellowbg">Order Booking System</div>
<div class="commontopbluebg"><div class="commontopdate">Today is: 
	<span class="bold" style="color:black"><%=new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date())%>
	</span></div>Welcome <span class="bold" style="color:#cccccc"><s:property value="#session.UserName"/></span>
</div>
<div class="commontopbreadc" id="breadcrumb">&nbsp;<!--%=breadCrumb%> --></div>


	
 
	<br/>
	<table align="center">
		<tr> 
			<td>
				
		  					<div align="center">
		  						<s:form theme="simple" name="OrderBookingForm" method="post" action="/BookOrder.action" onsubmit=" return validateOrderBooking();">
			
			<table align="center" class="tableStyle" width="100%">
				<tr>
				
					<td colspan=4>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="tableheader" valign="middle" align="center" colspan="2" height="26">
						Order Booking System
						
					</td>
				</tr>
			</table>
			<br/>
			
				
			<fieldset style="border:1px solid gray;padding:5px;margin:5px">
				<legend>Order Details</legend>			
				<table border="1" width="100%" align="center" id="reason_table" class="tableStyle">
					<tr>
						<td class="tablesubcaption" valign="bottom" align="center" width="10%" height="20">
							&nbsp; Select Product <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="left" width="10%" height="20">
							&nbsp; Quantity <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="10%" height="20">
							&nbsp; Select Chemist <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="10%" height="20">
							&nbsp; Order Date <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="10%" height="20">
							&nbsp; Delivery Date (Approximate) <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="5%" height="20">
							&nbsp; Add/Delete
						</td>
					</tr>
					
					<tr id="reasonrow">
			                 	<td class="labelcell" width="20%"><div align="center">
									<s:select name="productIdArr" id="productNameArr" value="" list="productList" listKey="product_id" listValue="product_name" headerKey="" headerValue="--Select--" cssClass="ControlText"/>
			      	  			</div></td>
			      	  			<td class="labelcell" width="10%"><div align="center">
			      					<s:textfield name="qtyArr" id="qtyArr"  style="width:30px" cssClass="tablerow" />
			      	  			</div></td>
			                 	<td class="labelcell" width="20%"><div align="center">
									<s:select name="chemIdArr" id="chemIdArr" value="" list="chemistListCurr" listKey="chemist_id" listValue="chemist_name" headerKey="" headerValue="--Select--" cssClass="ControlText"/>
			      	  			</div></td>
			      		 		<td class="labelcell" width="20%"><div align="center">
			      		 			<input type="text" name="orderDateArr" value="" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="orderDateArr" class="ControlText">
									<a href="javascript:show_calendar('OrderBookingForm.orderDate');" >
										<img src="images/calendaricon.gif" border="0" align="absmiddle"/> 
									</a>
			      	  			</div></td>
			      		 		<td class="labelcell" width="20%"><div align="center">
			      		 			<input type="text" name="deliveryDateArr" value="" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="deliveryDateArr" class="ControlText">
									<a href="javascript:show_calendar('OrderBookingForm.deliveryDate');" >
										<img src="images/calendaricon.gif" border="0" align="absmiddle"/> 
									</a>
			      	  			</div></td>
				  				
			      		  		  <td class="button2" valign="bottom" align="center" width="5%" height="20">
				      				<p align="center"><img src="/maa/images/add.png" alt="Add" width="18" height="18" border="0" onclick="addRole()"/>
				      				<img src="/maa/images/delete.png" alt="Remove" width="18" height="18" border="0" onclick="deleteRole(this)"/></p>
			      				  </td>
			        </tr>			                
				</table>
			</fieldset>
				<br/>
				<table align="center" class="tableStyle" width="100%">
					<tr>
						<td align="center" valign="bottom" height="20">
							<br/>
							<s:submit value="Submit Order" style="font-size:12px"/>
							<!-- input type="submit" value="Create" style="font-size:12px" -->
						</td>
						<td>
							<input type="button" value="Search" style="font-size:12px" onclick="return SearchBookedOrder();">
						</td>
					</tr>
					<tr>
						<td valign="bottom" height="20">
							<font class="ErrorText">Note : Fields marked (*) are Mandatory
								<br/>
								All date values should be in dd/MM/yyyy format eg: 31/12/2100
							</font>
						</td>
					</tr>
				</table>
		</s:form>
		  					</div>
						
			</td>
		</tr>
	</table>	
</body>

<script type="text/javascript">

function SearchBookedOrder()
{
	document.OrderBookingForm.action='/maa/SearchBookedOrder';
	document.OrderBookingForm.submit();
}

function deleteRole(obj) {
	var tbl = document.getElementById("reason_table");
	var rowNumber = getRow(obj).rowIndex;
	//alert("rowNumber --> "+rowNumber);
	var rowo = tbl.rows.length;
	//alert("rowo --> "+rowo);
	if (rowo <= 2) {
		alert("This row can not be deleted");
		return false;
	} else {
		tbl.deleteRow(rowNumber);
		return true;
	}
}
function addRole() {
	
	var tbl = document.getElementById("reason_table");
	var tbody = tbl.tBodies[0];
	var lastRow = tbl.rows.length;
	//alert("last Row --> "+lastRow);
	var rowObj = document.getElementById("reasonrow").cloneNode(true);
	tbody.appendChild(rowObj);
	document.getElementsByName('productIdArr')[lastRow].value = "";
	document.getElementsByName('qtyArr')[lastRow].value = "";
	document.getElementsByName('chemIdArr')[lastRow].value = "";
	document.getElementsByName('orderDateArr')[lastRow].value = "";
	document.getElementsByName('deliveryDateArr')[lastRow].value = "";
}
function validateOrderBooking() {
	var row = document.getElementById("reason_table").rows.length;
	
	//alert("Row --> "+row);
	
	if(row == 2){
		//alert("0");
		if(document.getElementById('productNameArr').value=="") {
			alert("Please Select Product Name ");
			document.getElementById('productNameArr').focus();
			return false;
		}
		//alert("1");
		if(document.getElementById('qtyArr').value=="") {
			alert("Please Enter Quantity of Product to be Ordered ");
			document.getElementById('qtyArr').focus();
			return false;
		}
		//alert("2");
		if(isNaN(document.getElementById('qtyArr').value)) {
			alert("Please Enter Quantity in Numbers i.e 1,2,3,4 etc.");
			document.getElementById('qtyArr').value="";
			document.getElementById('qtyArr').focus();
			return false;
		}
		//alert("3");
		if(document.getElementById('chemIdArr').value=="") {
			alert("Please Select Chemist Name ");
			document.getElementById('chemIdArr').focus();
			return false;
		}
		//alert("4");
		if(document.getElementById('orderDateArr').value=="") {
			alert("Please Enter Date Of Order ");
			document.getElementById('orderDateArr').focus();
			return false;
		}
		//alert("5");
		if(document.getElementById('deliveryDateArr').value=="") {
			alert("Please Enter Approximate Delivery Date ");
			document.getElementById('deliveryDateArr').focus();
			return false;
		}
		//alert("6");
	}
	
	else if (row > 2) {
		//alert("7");
		if(document.getElementsByName('productIdArr')[row - 2].value=="") {
			alert("Please Select Product Name ");
			document.getElementsByName('productIdArr')[row - 2].focus();
			return false;
		}
		//alert("8");
		if(document.getElementsByName('qtyArr')[row - 2].value=="") {
			alert("Please Enter Quantity of Product to be Ordered ");
			document.getElementsByName('qtyArr')[row - 2].focus();
			return false;
		}
		//alert("9");
		if(document.getElementsByName('chemIdArr')[row - 2].value=="") {
			alert("Please Select Chemist Name ");
			document.getElementsByName('chemIdArr')[row - 2].focus();
			return false;
		}
		//alert("10");
		if(document.getElementsByName('orderDateArr')[row - 2].value=="") {
			alert("Please Enter Date of Order of Product ");
			document.getElementsByName('orderDateArr')[row - 2].focus();
			return false;
		}
		//alert("11");
		if(document.getElementsByName('deliveryDateArr')[row - 2].value=="") {
			alert("Please Enter Approximate Delivery Date ");
			document.getElementsByName('deliveryDateArr')[row - 2].focus();
			return false;
		}
		//alert("12");
	}
	
	//alert("13");
	return true;
}

</script>
</html>
