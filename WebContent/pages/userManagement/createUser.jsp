


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
        <title>rx  - Create User </title>

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

<!-- Begin 

    function validateUserForm(form) { 
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
    	/*if(!isNaN(document.getElementById('middleName').value)) {
			alert("Middle Name can not be a numeric value.");
			document.getElementById('middleName').value="";
			document.getElementById('middleName').focus();
			return false;
		}
    	if(!isNaN(document.getElementById('lastName').value)) {
			alert("Last Name can not be a numeric value.");
			document.getElementById('lastName').value="";
			document.getElementById('lastName').focus();
			return false;
		}*/
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
/*
    function userForm_required () { 
     this.a0 = new Array("firstName", "FirstName is required.", new Function ("varName", "this.mask=/^[a-zA-Z]*$/;  return this[varName];"));
     this.a1 = new Array("userName", "UserName is required.", new Function ("varName", " return this[varName];"));
     this.a2 = new Array("empId", "Employee Id is required.", new Function ("varName", " return this[varName];"));
     this.a3 = new Array("pwd", "Password is required.", new Function ("varName", " return this[varName];"));
     this.a4 = new Array("pwdReminder", "Repeat Password is required.", new Function ("varName", " return this[varName];"));
    } 
*/
    function userForm_mask () { 
     this.a0 = new Array("firstName", "FirstName is invalid.", new Function ("varName", "this.mask=/^[a-zA-Z]*$/;  return this[varName];"));
     this.a1 = new Array("middleName", "MiddleName is invalid.", new Function ("varName", "this.mask=/^[a-zA-Z]*$/;  return this[varName];"));
     this.a2 = new Array("lastName", "LastName is invalid.", new Function ("varName", "this.mask=/^[a-zA-Z]*$/;  return this[varName];"));
     this.a3 = new Array("salutation", "Salutaion is invalid.", new Function ("varName", "this.maxlength='3'; this.mask=/^[a-zA-Z]*$/;  return this[varName];"));
    } 

    function userForm_maxlength () { 
     this.a0 = new Array("salutation", "Salutaion can not be greater than 3 characters.", new Function ("varName", "this.maxlength='3'; this.mask=/^[a-zA-Z]*$/;  return this[varName];"));
    } 

    // Trim whitespace from left and right sides of s.
    function trim(s) {
        return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
    }


//End --> 
</script>


		<script type="text/javascript" src="/maa/javascripts/user/createUser.js"></script>
		<script type="text/javascript" src="/maa/javascripts/commonjs/calendar.js"></script>
		<script type="text/javascript" src="/maa/javascripts/dateValidation.js"></script>
    </head>
    
<body   onload="bodyonload();"  >
	








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
		  						<s:form name="userForm" method="post" action="/CreateUser.action" enctype="multipart/form-data" onsubmit=" return validateUserForm(this);">
			
			<table align="center" class="tableStyle" width="100%">
				<tr>
					<td colspan=4>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="tableheader" valign="middle" align="center" colspan="2" height="26">
						Create New User
						
					</td>    
				</tr>
			</table>
			<br/>
			<fieldset style="border:1px solid gray;padding:5px;margin:5px">
			<legend>User Details</legend>
			<table align="center" class="tableStyle" width="100%" >
				<tr>
					<td class="labelcell"  height="23" style="padding-left:150px">
						First Name
						
						<font class="ErrorText">*</font>
					</td>
					<td class="labelcell" height="23">
						<input type="text" name="firstName" value="" id="firstName" class="ControlText">
					</td>
				</tr>
				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Middle Name
						
					</td>
					<td class="labelcell" height="23">
						<input type="text" name="middleName" value="" onchange="return trimText1(this,this.value);" id="middleName" class="ControlText">
					</td>
				</tr>
				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Last Name
						
					</td>
					<td class="labelcell" height="23">
						<input type="text" name="lastName" value="" onchange="return trimText1(this,this.value);" id="lastName" class="ControlText">
					</td>
				</tr>
				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Employee Id
						
						<font class="ErrorText">*</font>
					</td>
					<td class="labelcell" height="23">
						<input type="text" name="empId" value="" onchange="return trimText1(this,this.value);" id="empId" class="ControlText">
					</td>
				</tr>

<!-- 				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Date of Joining
						<font class="ErrorText">*</font>
					</td>
					<td class="labelcellforsingletd" height="23">
						<input type="text" name="fromDate" value="" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="fromDate" class="ControlText">
						<a href="javascript:show_calendar('userForm.fromDate');" >
							<img src="images/calendaricon.gif" border="0" align="absmiddle"/> 
						</a>
					</td>

				</tr>

				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Date of Relieving
						<font class="ErrorText"></font>
					</td>
					<td class="labelcellforsingletd" height="23">
						<input type="text" name="toDate" value="" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="toDate" class="ControlText">
						<a href="javascript:show_calendar('userForm.toDate');" >
							<img src="images/calendaricon.gif" border="0" align="absmiddle"/>
						</a>
					</td>
				</tr>
 -->
				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Salutation
						[Mr/Mrs/Miss]
					</td>
					<td class="labelcell" height="23">
						<input type="text" name="salutation" value="" onchange="return trimText1(this,this.value);" id="salutation" class="ControlText">
					</td>
				</tr>


<!-- 				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Date Of Birth
						
					</td>
					<td class="labelcellforsingletd" height="23">
						<input type="text" name="dob" value="" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="dob" class="ControlText">
						<a href="javascript:show_calendar('userForm.dob');" >
							<img src="images/calendaricon.gif" border="0" align="absmiddle"/>
						</a>
					</td>

				</tr>
 -->
				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						User Name 
						
						<font class="ErrorText">*</font>
					<td class="labelcell"  height="23">
						<input type="text" name="userName" value="" id="userName" class="ControlText" onblur="return validateUserNameNew(this);"><div id="userInfo" style="font-size:10px"></div>
					</td>
				</tr>
				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Password
						
						<font class="ErrorText">*</font>
					<td class="labelcell" height="23">
						<input type="password" name="pwd" value="" onchange="return trimText1(this,this.value);" id="pwd" class="ControlText">
					</td>
				</tr>
				<tr>
					<td class="labelcellforsingletd" height="23" style="padding-left:150px">
						Repeat Password
						
						<font class="ErrorText">*</font>
					</td>
					<td class="labelcell"  height="23">
						<input type="password" id="retypePwd" class="ControlText" onblur="return validatePwd();" />
					</td>
				</tr>
				<tr>
					<td class="labelcellforsingletd" height="23" style="padding-left:150px">
						Password Reminder
						<font class="ErrorText">*</font>
					</td>
					<td class="labelcell" align="left" width="40%" height="23">
						<input type="password" name="pwdReminder" value="" id="pwdReminder" class="ControlText">
					</td>
				</tr>
				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Is Active
						
					</td>
					<td class="labelcell" align="left" width="40%" height="23">
						<s:checkbox name="isActiveValue" id="isActiveValue" checked="checked"/>
					</td>
				</tr>
				
<!-- 				<tr>
					<td class="labelcell" height="23" style="padding-left:150px">
						Upload Signature
					</td>
					<td class="labelcell" align="left" width="40%" height="23">
						<input type="file" name="file" size="50" value="" id="file">
					</td>
				</tr>
 -->			</table>
			</fieldset>
				
			<fieldset style="border:1px solid gray;padding:5px;margin:5px">
				<legend>User Roles</legend>			
				<table border="1" width="100%" align="center" class="tableStyle">
					<tr>
						<td class="tablesubcaption" valign="bottom" align="left" width="25%" height="20">
							Select User Role
						</td>
<!-- 						<td class="tablesubcaption" valign="bottom" align="left" width="25%" height="20">
							&nbsp;From Date(dd/mm/yyyy)
						</td>
						<td class="tablesubcaption" valign="bottom" align="left" width="25%" height="20">
							&nbsp;To Date(dd/mm/yyyy)
						</td>
						<td class="button2" colspan="2" align="center">
							<input type=button  name="addRow" value="Add Role" onclick="addRole();" />
						</td>
 -->
					</tr>
				</table>
				<table width="100%" id="reason_table" class="tableStyle" border="1">
					<tr id="reasonrow">
						<td class="labelcell" valign="bottom" align="left" width="25%" height="20">
							<s:select theme="simple" name="roleId" id="roleId" list="rolesList" class="ControlText" listKey="roleId" listValue="roleName" headerKey="" headerValue="--Select--">
							</s:select>
						</td>
<!-- 						<td class="labelcell" valign="bottom" align="left" width="25%" height="20">
							<b><input type="text" name="fromDate1" size="19" value="" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="fromDate1"></b>
						</td>
						<td class="labelcell" valign="bottom" align="left" width="25%" height="20">
							<b><input type="text" name="toDate1" size="19" value="" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="toDate1"></b>
						</td>

						<td class="button2" valign="bottom" align="center" width="25%" height="20">
							<input type="button" name="delRow" value="Delete Role" onclick="deleteRole(this)" />
						</td>
 -->					</tr>
				</table>
				</fieldset>
				<br/>
				<table align="center" class="tableStyle" width="100%">
					<tr align="center">
						<td align="center" valign="bottom" height="20">
							<br/>
					<!-- 		<s:submit name="submit" align="center" id="submitButton" value="Create" style="font-size:12px" /> -->
							<input type="submit" value="Create" style="font-size:12px">
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