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
		  						<s:form theme="simple" name="bookedOrderForm" method="post" >
			
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
			
			<s:if test="%{bookedOrderSearchList!=null}">
				<font color="red" size="2px"><s:property value="%{errorMsg}" /></font> 
				<fieldset style="border:1px solid gray;padding:5px;margin:5px">
					<legend>Placed Order Details</legend>			
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
								&nbsp; Created Date
							</td>
						</tr>
						
						<s:iterator value="bookedOrderSearchList">
							<tr id="reasonrow">
			                 	<td class="labelcell" width="20%"><div align="center">
									<s:select name="productIdArr" id="productNameArr" value="%{productId}" list="productList" listKey="product_id" listValue="product_name" headerKey="" headerValue="--Select--" cssClass="ControlText"/>
			      	  			</div></td>
			      	  			<td class="labelcell" width="10%"><div align="center">
			      					<s:textfield name="qtyArr" id="qtyArr" value="%{qty}" style="width:30px" cssClass="tablerow" />
			      	  			</div></td>
			                 	<td class="labelcell" width="20%"><div align="center">
									<s:select name="chemIdArr" id="chemIdArr" value="%{chemId}" list="chemistListCurr" listKey="chemist_id" listValue="chemist_name" headerKey="" headerValue="--Select--" cssClass="ControlText"/>
			      	  			</div></td>
			      		 		<td class="labelcell" width="20%"><div align="center">
			      		 			<s:textfield name="orderDateArr" value="%{orderDate}" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="orderDateArr" cssClass="ControlText"/>
			      	  			</div></td>
			      		 		<td class="labelcell" width="20%"><div align="center">
			      		 			<s:textfield name="deliveryDateArr" value="%{deliveryDate}" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="deliveryDateArr" cssClass="ControlText"/>
			      	  			</div></td>
			      		 		<td class="labelcell" width="20%"><div align="center">
			      		 			<s:textfield name="createdDateArr" value="%{createdDateStr}" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="orderDateArr" cssClass="ControlText"/>
			      	  			</div></td>
				        	</tr>
				        </s:iterator>			                
					</table>
				</fieldset>
			</s:if>	
			<br/>
				<table align="center" class="tableStyle" width="100%">
					<tr>
						<td valign="bottom" height="20" align="center">
							<input type="button" value="BACK" style="font-size:12px" onclick=" return OrderBookPage()">
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
function OrderBookPage(){
	document.bookedOrderForm.action='/maa/backToOrderBookForm';
	document.bookedOrderForm.submit();
}
</script>

</script>
</html>
