

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



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
        <title>rx  - Product Details </title>

        <link rel="stylesheet" type="text/css" media="all" href="/maa/css/rx.css" />
      	<link rel="stylesheet" type="text/css" href="/maa/commonyui/build/reset/reset.css" />
		<link rel="stylesheet" type="text/css" href="/maa/commonyui/build/fonts/fonts.css" />
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
		
        <script>

			function validationAgain() {
				
				
				if(document.getElementById('product_id').value=="") {
					alert("Please Enter a Product ID");
					document.getElementById('product_id').focus();
					return false;
				}
				if(document.getElementById('product_name').value=="") {
					alert("Please enter Product Name");
					document.getElementById('product_name').focus();
					return false;
				}
				if(!isNaN(document.getElementById('product_name').value)) {
					alert("Product Name can not be a numeric value.");
					document.getElementById('product_name').value="";
					document.getElementById('product_name').focus();
					return false;
				}
				if(document.getElementById('ingrediants').value=="") {
					alert("Please Give Ingrediants of the Product");
					document.getElementById('ingrediants').focus();
					return false;
				}
				if(!isNaN(document.getElementById('ingrediants').value)) {
					alert("Ingrediants can not be a numeric value.");
					document.getElementById('ingrediants').value="";
					document.getElementById('ingrediants').focus();
					return false;
				}
				if(document.getElementById('dosage_form').value=="") {
					alert("Please give form of dosages");
					document.getElementById('dosage_form').focus();
					return false;
				}
				if(!isNaN(document.getElementById('dosage_form').value)) {
					alert("Form Of Dosage can not be a numeric value.");
					document.getElementById('dosage_form').value="";
					document.getElementById('dosage_form').focus();
					return false;
				}
				if(document.getElementById('indications').value=="") {
					alert("Please mention Indications ");
					document.getElementById('indications').focus();
					return false;
				}
				if(!isNaN(document.getElementById('indications').value)) {
					alert("Indications can not be a numeric value.");
					document.getElementById('indications').value="";
					document.getElementById('indications').focus();
					return false;
				}
				if(document.getElementById('reference_id').value=="") {
					alert("Please select Reference of this product");
					document.getElementById('reference_id').focus();
					return false;
				}
				if(document.getElementById('dos').value=="") {
					alert("Please enter the Date of Launch of this product");
					document.getElementById('dos').focus();
					return false;
				}
				return true;
			}
		</script>
    </head>
    
<body >
	

<div class="commontopyellowbg">Administration</div>
<div class="commontopbluebg"><div class="commontopdate">Today is: 
	<span class="bold" style="color:black"><%=new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date())%>
	</span></div>Welcome <span class="bold" style="color:#cccccc"><s:property value="#session.UserName"/></span>
</div>
<div class="commontopbreadc" id="breadcrumb">&nbsp;<!--%=breadCrumb%> --></div>
<!--  script>
	if (document.getElementById('breadcrumb').innerHTML == '') {
		document.getElementById('breadcrumb').innerHTML = ''+  " > "+document.title;
	}
</script -->
	
 
	<br/>
	<table align="center">
		<tr> 
			<td>
				<div id="main">
		  			<div id="m2">
		  				<div id="m3">
		  					<div align="center">
		  						<s:form theme="simple" name="prEdit" method="post" enctype="multipart/form-data">
			<table align="center" id="getAllDetails" name="getAllDetails">
				<table align="center" class="tableStyle">
					<tr>
						<td class="tableheader" align="middle" width="728" height="6">Product Details</td>
					</tr>
					<tr>
						<td colspan="4">&nbsp;</td>
					</tr>
			</table>
			<br/><br/>
			<table align="center"  class="tableStyle">
				<s:iterator value="productListViewEdit">
					<s:hidden name="seq_no"/>
					<tr>
						<td  class="labelcell" width="40%" height="23" >Product ID<font class="ErrorText">*</font></td>
						<td  class="labelcell" align="left" width="40%" height="23" >
							<s:textfield name="product_id" value="%{product_id}" id="product_id" class="ControlText"/>
						</td>				
					
						<td class="labelcell"  width="40%" height="23" >Product Name<font class="ErrorText">*</font></td>
						<td class="labelcell"  align="left" width="40%" height="23" >
							<s:textfield name="product_name" value="%{product_name}" id="product_name" class="ControlText"/>
						</td>
					</tr>
					
					<tr>
						<td  class="labelcell" width="40%" height="23" >Ingredients<font class="ErrorText">*</font></td>
						<td  class="labelcell" align="left" width="40%" height="23" >
							<s:textarea name="ingrediants" value="%{ingrediants}" id="ingrediants" cols="25" rows="5" cssClass="ControlText"/>
						</td>				
					
						<td class="labelcell"  width="40%" height="23" >Dosage Form<font class="ErrorText">*</font></td>
						<td class="labelcell"  align="left" width="40%" height="23" >
							<s:textarea name="dosage_form" value="%{dosage_form}" id="dosage_form" cols="25" rows="5" cssClass="ControlText"/>
						</td>
					</tr>
				
					<tr>
						<td  class="labelcell" width="40%" height="23" >Indications<font class="ErrorText">*</font></td>
						<td  class="labelcell" align="left" width="40%" height="23" >
							<s:textarea name="indications" value="%{indications}" id="indications" cols="25" rows="5" cssClass="ControlText"/>
						</td>						
						<td class="labelcell"  width="40%" height="23" >Reference ID<font class="ErrorText">*</font></td>
						<td class="labelcell"  align="left" width="40%" height="23" >
							<s:select name="reference_id" id="reference_id" list="referenceList" value="%{reference_id}" listKey="ref_id" cssClass="ControlText" listValue="ref_type" headerKey="" headerValue="---Select---"/>
						</td>
					</tr>	
						
					<tr>
						<td  class="labelcell" width="40%" height="23" >Date Of Starting<font class="ErrorText">*</font></td>
						<td class="labelcell" valign="bottom" align="left" width="15%" height="20">
							<s:textfield name="dos" value="%{dos}" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="dos" cssClass="ControlText"/>
							<a href="javascript:show_calendar('prEdit.dos');" >
								<img src="<%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
							</a>
						</td>
						
						<td class="labelcell"  width="40%" height="23" >Product Logo</td>
						<td class="labelcell"  align="left" width="40%" height="23" >
							<s:file name="fileUpload" value="%{fileUpload}" cssClass="ControlText" />
						</td>					
					</tr>
				</s:iterator>				
			</table>
			<br/><br/>
			<table align="center" class="tableStyle" cellspacing="2">
				<tr>
					<td>
						<input type="button" value="Save" id="save" name="save" onclick="return updateProduct();" />
					</td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td>
						<input type="button" value="CLEAR" id="button" name="clear" onclick="this.form.reset();"/>
					</td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td>
					<input type="button" value="CLOSE" id="closeButton" name="closeButton" onclick="window.close();" />
					</td>					
					
				</tr>			
			</table>
			</table>
		</s:form>
		  					</div>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>	
</body>
<script type="text/javascript">
function updateProduct()
{
	//var rf = validationAgain();
	
	if(validationAgain()){	
		//alert("inside");
		document.prEdit.action='/maa/UpdateProduct';
		document.prEdit.submit();
	}
	//else return false;
}

</script>
</html>

