


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
        <title>rx  - Edit User </title>

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
		
        <script type="text/javascript" language="Javascript1.1"> 
        function validateUserFormNew() { 
        	//alert("In validateUserForm");
        	
        	if(document.getElementById('firstName').value=="") {
    			alert("Please enter First Name");
    			document.getElementById('firstName').focus();
    			return false;
    		}
        	if(!isNaN(document.getElementById('firstName').value)) {
    			alert("First Name can not be a numeric value.");
    			document.getElementById('firstName').value="";
    			document.getElementById('firstName').focus();
    			return false;
    		}
    		if(document.getElementById('empId').value=="") {
    			alert("Please enter Employee Id");
    			document.getElementById('empId').focus();
    			return false;
    		}
    		if(document.getElementById('userName').value=="") {
    			alert("Please enter a User Name");
    			document.getElementById('userName').focus();
    			return false;
    		}
    		if(!isNaN(document.getElementById('userName').value)) {
    			alert("User Name can not be a numeric value.");
    			document.getElementById('userName').value="";
    			document.getElementById('userName').focus();
    			return false;
    		}
    		if(document.getElementById('pwd').value=="") {
    			alert("Please enter a Password");
    			document.getElementById('pwd').focus();
    			return false;
    		}
    		if(document.getElementById('pwdReminder').value=="") {
    			alert("Please enter a Password Reminder");
    			document.getElementById('pwdReminder').focus();
    			return false;
    		}
    		if(document.getElementById('roleId').value=="") {
    			alert("Please Select Role for the Employee");
    			document.getElementById('roleId').focus();
    			return false;
    		}
        } 
		</script>


		<script type="text/javascript" src="/maa/javascripts/user/createUser.js"></script>
		<script type="text/javascript" src="/maa/javascripts/commonjs/calendar.js"></script>
		<script type="text/javascript" src="/maa/javascripts/dateValidation.js"></script>
    </head>
    
<body>


<div class="commontopyellowbg">Administration</div>
<div class="commontopbluebg"><div class="commontopdate">Today is: <span class="bold" style="color:black">
09/03/2013
</span></div>Welcome <span class="bold" style="color:#cccccc">
rx.superuser</span></div>
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
		  						<s:form theme="simple" name="EditUserForm" method="post" action="/UpdateUser" enctype="multipart/form-data" onsubmit=" return validateUserFormNew();">
			
			<table align="center" class="tableStyle" width="100%">
				<tr>
					<td colspan=4>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="tableheader" valign="middle" align="center" colspan="2" height="26">
						Edit User
						
					</td>
				</tr>
			</table>
			<br/>
			
			<fieldset style="border:1px solid gray;padding:5px;margin:5px">
			<legend>Edit User Details</legend>
			<table align="center" class="tableStyle" width="100%" >
			<s:iterator value="userList" var="cont" status="stat">
			
				<tr>
					<td class="labelcell"  height="23" style="padding-left:150px">
						First Name
						
						<font class="ErrorText">*</font>
					</td>
					<td class="labelcell" height="23">
						<s:textfield name="firstName" value="%{firstName}" id="firstName" cssClass="ControlText"/>						
					</td>
				</tr>
				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Middle Name
						
					</td>
					<td class="labelcell" height="23">
						<s:textfield name="middleName" value="%{middleName}" onchange="return trimText1(this,this.value);" id="middleName" cssClass="ControlText"/>
					</td>
				</tr>
				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Last Name
						
					</td>
					<td class="labelcell" height="23">
						<s:textfield name="lastName" value="%{lastName}" onchange="return trimText1(this,this.value);" id="lastName" cssClass="ControlText"/>
					</td>
				</tr>
				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Employee Id
						
						<font class="ErrorText">*</font>
					</td>
					<td class="labelcell" height="23">
						<s:textfield name="empId" value="%{empId}" onchange="return trimText1(this,this.value);" id="empId" cssClass="ControlText"/>
					</td>
				</tr>
				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Salutation
						[Mr/Mrs/Miss]
					</td>
					<td class="labelcell" height="23">
						<s:textfield name="salutation" value="%{salutation}" onchange="return trimText1(this,this.value);" id="salutation" cssClass="ControlText"/>
					</td>
				</tr>



				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						User Name 
						
						<font class="ErrorText">*</font>
					<td class="labelcell"  height="23">
						<s:textfield name="userName" value="%{userName}" id="userName" cssClass="ControlText" onblur="return validateUserNameNew(this);" /><div id="userInfo" style="font-size:10px"></div>
					</td>
				</tr>
				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Password
						
						<font class="ErrorText">*</font>
					<td class="labelcell" height="23">
					<!--	<input type="password" name="pwd" value="%{pwd}" onchange="return trimText1(this,this.value);" id="pwd" class="ControlText" /> -->
				 		<s:password name="pwd" value="%{pwd}" showPassword="true" id="pwd" onchange="return trimText1(this,this.value);" cssClass="ControlText"/> 
					</td>
				</tr>
				<tr>
					<td class="labelcellforsingletd" height="23" style="padding-left:150px">
						Repeat Password
						
						<font class="ErrorText">*</font>
					</td>
					<td class="labelcell"  height="23">
						<s:password id="retypePwd" class="ControlText" onblur="return validatePwd();"/>
					</td>
				</tr>
				<tr>
					<td class="labelcellforsingletd" height="23" style="padding-left:150px">
						Password Reminder
						<font class="ErrorText">*</font>
					</td>
					<td class="labelcell" align="left" width="40%" height="23">
						<s:password name="pwdReminder" value="%{pwdReminder}" showPassword="true" id="pwdReminder" class="ControlText" />
					</td>
				</tr>
				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Is Active
						
					</td>
					<td class="labelcell" align="left" width="40%" height="23">
						<s:checkbox name="isActiveValue" id="isActiveValue" value="%{isActiveValue}"/>
					</td>
				</tr>
				</s:iterator>
			</table>
			</fieldset>
				
			<fieldset style="border:1px solid gray;padding:5px;margin:5px">
				<legend>User Roles</legend>			
				<table border="1" width="100%" align="center" class="tableStyle">
					<tr>
						<td class="tablesubcaption" valign="bottom" align="left" width="25%" height="20">
							Select User Role
						</td>
					</tr>
				</table>
				<table width="100%" id="reason_table" class="tableStyle" border="1">
				<s:iterator value="userList" var="cont" status="stat">
					<s:hidden name="seq_no" value="%{seq_no}"></s:hidden>
					<tr id="reasonrow">
						<td class="labelcell" valign="bottom" align="left" width="25%" height="20">
							<s:select theme="simple" value="%{roleId}" name="roleId" id="roleId" list="rolesList" class="ControlText" listKey="roleId" listValue="roleName" headerKey="" headerValue="--Select--">
							</s:select>
						</td>
					</tr>
					</s:iterator>
				</table>
				</fieldset>
				<br/>
				<table align="center" class="tableStyle" width="100%">
					<tr>
						<td align="center" valign="bottom" height="20">
							<br/>
							<input type="submit" value="Update" style="font-size:12px">
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
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>	
</body>
<script type="text/javascript">
function validateUserNameNew(pwdObj) {
	if (pwdObj.value == '') {
		return true;
	}
	var ajaxRequest = initiateRequest();
	//alert("Here in validateUserName----1");
	ajaxRequest.onreadystatechange = function () {
		//alert("Here in validateUserName----2");
		if (ajaxRequest.readyState == 4) {
			//alert("Here in validateUserName----3");
			if (ajaxRequest.status == 200) {
				
				//alert("Here in validateUserName----4");
				var response = ajaxRequest.responseText;
				//alert(response);
				if (response)
				{
					//alert("Here in validateUserName----5");
					document.getElementById('userInfo').innerHTML = "<font color='green'>User Name Available.</font>";
				} else {
					//alert("Here in validateUserName----6");
					//document.getElementById('userName').value="";
					document.getElementById('userName').focus();
					document.getElementById('userInfo').innerHTML = "<font color='red'>User Name Not Available.</font>";
				}
			}
		}
	}; 
	ajaxRequest.open("GET", "/maa/uniqueCheck?"+"AJAX=true&userName="+pwdObj.value, true);		
	ajaxRequest.send(null);
}

</script>
</html>