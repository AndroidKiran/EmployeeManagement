

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
        <title>rx  - Doctor Details </title>

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
		
		<script type="text/javascript">
			function validateDocAgain() {
				if(document.getElementById('doctor_name').value=="") {
					alert("Please Enter Doctor Name");
					document.getElementById('doctor_name').focus();
					return false;
				}
				if(!isNaN(document.getElementById('doctor_name').value)) {
					alert("Doctor Name can not be a numeric value.");
					document.getElementById('doctor_name').value="";
					document.getElementById('doctor_name').focus();
					return false;
				}
				/*if(document.getElementById('doc_id').value=="") {
					alert("Please enter Doctor Id");
					document.getElementById('doc_id').focus();
					return false;
				}*/
				if(document.getElementById('specialisation').value=="") {
					alert("Please enter Specialization of Doctor");
					document.getElementById('specialisation').focus();
					return false;
				}
				if(!isNaN(document.getElementById('specialisation').value)) {
					alert("Specialization can not be a numeric value.");
					document.getElementById('specialisation').value="";
					document.getElementById('specialisation').focus();
					return false;
				}
				if(document.getElementById('qualification').value=="") {
					alert("Please enter Qualification of Doctor");
					document.getElementById('qualification').focus();
					return false;
				}
				if(!isNaN(document.getElementById('qualification').value)) {
					alert("Qualification can not be a numeric value.");
					document.getElementById('qualification').value="";
					document.getElementById('qualification').focus();
					return false;
				}
				/*if(document.getElementById('contact_no').value=="") {
					alert("Please enter Contact Number");
					document.getElementById('contact_no').focus();
					return false;
				}
				if(document.getElementById('email_id').value=="") {
					alert("Please enter Email Id");
					document.getElementById('email_id').focus();
					return false;
				}*/
				if(document.getElementById('ter_id').value=="") {
					alert("Please enter Territory ");
					document.getElementById('ter_id').focus();
					return false;
				}
				if(document.getElementById('cat_id').value=="") {
					alert("Please enter Category ");
					document.getElementById('cat_id').focus();
					return false;
				}
				/*if(document.getElementById('address_1').value=="") {
					alert("Please enter Address");
					document.getElementById('address_1').focus();
					return false;
				}*/				
				if(document.getElementById('state_id').value=="") {
					alert("Please Select State of Residence");
					document.getElementById('state_id').focus();
					return false;
				}
				if(document.getElementById('city_id').value=="") {
					alert("Please Select City of Residence");
					document.getElementById('city_id').focus();
					return false;
				}
				return true;
			}
		</script>
    </head>
    
<body     >
	

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
		  						<s:form theme="simple" name="doc" method="post" action="/UpdateDoctor" onsubmit="return validateDocAgain();">
			<table align="center" id="getAllDetails" name="getAllDetails">
				<table align="center" class="tableStyle">
					<tr>
						<td class="tableheader" align="middle" width="728" height="6">Doctor Details</td>
					</tr>
					<tr>
						<td colspan="4">&nbsp;</td>
					</tr>
			</table>
			<br/><br/>
			<table align="center"  class="tableStyle">
				<s:iterator value="docListForViewAndEdit">
				
				<tr>
					<td  class="labelcell" width="40%" height="23" >Doctor Name<font class="ErrorText">*</font></td>
					<td  class="labelcell" align="left" width="40%" height="23" >
						<s:textfield name="doctor_name" value="%{doctor_name}" id="doctor_name" class="ControlText"/>
					</td>				
				
					<td class="labelcell"  width="40%" height="23" >Doctor ID</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<s:textfield name="doc_id" value="%{doc_id}" id="doc_id" class="ControlText" readonly="true"/>
					</td>
					<td class="labelcell"  width="40%" height="23" >Designation</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<s:textfield name="designation" value="%{designation}" id="designation" class="ControlText"/>
					</td>
				</tr>
				<tr>					
					<td class="labelcell"  width="40%" height="23" >Specialisation</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<s:textfield name="specialisation" value="%{specialisation}" id="specialisation" class="ControlText"/>
					</td>					
					<td class="labelcell"  width="40%" height="23" >Qualification</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<s:textfield name="qualification" value="%{qualification}" id="qualification" class="ControlText"/>
					</td>					
					<td class="labelcell"  width="40%" height="23" >Contact Number</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<s:textfield name="contact_no" value="%{contact_no}" id="contact_no" class="ControlText" onkeyup="validatePhoneNumber();"/>
					</td>					
				</tr>
				
				<tr>
					<td  class="labelcell" width="40%" height="23" >Email ID<font class="ErrorText">*</font></td>
					<td  class="labelcell" align="left" width="40%" height="23" >
						<s:textfield name="email_id" value="%{email_id}" id="email_id" class="ControlText" onblur="validateEmailAddress(this);"/>
					</td>		
					<td class="labelcell"  width="40%" height="23" >Territory</td>
					<td class="labelcell"  align="left" width="40%" height="23">
						<s:select theme="simple" name="ter_id" value="%{ter_id}" id="ter_id" cssClass="ControlText" list="territoryList" listKey="ter_id" listValue="territory" headerKey="" headerValue="---Select---"/>
					</td>
					<td  class="labelcell" width="40%" height="23" >Category<font class="ErrorText">*</font></td>
					<td  class="labelcell" align="left" width="40%" height="23" >
						<s:select theme="simple" name="cat_id" list="categoryList" value="%{cat_id}" listKey="cat_id" listValue="cat_name" headerKey="0" headerValue="---Select---"/>
					</td>			
				</tr>
				
				<tr>					
					<td  class="labelcell" width="40%" height="23" >Address Line 1<font class="ErrorText">*</font></td>
					<td  class="labelcell" align="left" width="40%" height="23" >
						<s:textfield name="address_1" value="%{address_1}" id="address_1" class="ControlText"/>
					</td>				
				
					<td class="labelcell"  width="40%" height="23" >Address Line 2</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<s:textfield name="address_2" value="%{address_2}" id="address_2" class="ControlText"/>
					</td>
					<td  class="labelcell" width="40%" height="23" >City<font class="ErrorText">*</font></td>
					<td  class="labelcell" align="left" width="40%" height="23" >
						<s:select theme="simple" name="city_id" value="%{city_id}" id="city_id" cssClass="ControlText" list="cityList" listKey="cityId" listValue="cityName" headerKey="" headerValue="--Select--"/>
					</td>				
				</tr>
						
				<tr>
					<td class="labelcell"  width="40%" height="23" >State</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<s:select theme="simple" name="state_id" value="%{state_id}" id="state_id" cssClass="ControlText" list="stateList" listKey="stateId" listValue="stateName" headerKey="" headerValue="--Select--"/>
					</td>
					<td class="labelcell"  width="40%" height="23" >Is Active</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<s:checkbox name="active" value="%{active}" id="active" class="ControlText" checked="checked"/>
					</td>
					
				</tr>
				</s:iterator>			
			</table>
			<br/><br/>
			<table align="center" class="tableStyle" cellspacing="2">
				<tr>
					<td>
						<s:submit value="Update"/>
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
	function validateEmailAddress(obj){
		//alert("In validateEmailAddress");
		 var emailStr=obj.value;
		 var objRegExp  = /^[a-z0-9]([a-z0-9_\-\.]*)@([a-z0-9_\-\.]*)(\.[a-z]{2,3}(\.[a-z]{2}){0,2})$/i;
		 
		 var check = objRegExp.test(emailStr);
		 if(check){
			 //alert("In if-->check");
			 return true;
		 }
		 else{
			 alert("Please Enter a valid Email ID");
			 document.getElementById('email_id').value="";
			 document.getElementById('email_id').focus();
			 return false;
		 }
	}
	function validatePhoneNumber(){
		
	
		var x=document.getElementById("contact_no");
		var phoneNoStr = x.value;
		var objRegExp  = /^([0-9]+)$/;
		//x.value=x.value.toUpperCase();
		var check = objRegExp.test(phoneNoStr); 
		
		if(check){
			 //alert("In if-->check");
			 return true;
		}
		else{
			
			 document.getElementById('contact_no').value="";
			 document.getElementById('contact_no').focus();
			 return false;
		}
	}
</script>
</html>

