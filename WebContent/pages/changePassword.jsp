<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page import="java.text.SimpleDateFormat" %> 
<%@page import="java.util.Date" %> 

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
        <title>rx  - Change Password </title>

        <link rel="stylesheet" type="text/css" media="all" href="/maa/css/rx.css" />
      	<link rel="stylesheet" type="text/css" href="/maa/commonyui/yui/build/reset/reset.css" />
		<link rel="stylesheet" type="text/css" href="/maa/commonyui/yui/build/fonts/fonts.css" />
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

		
        <meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Expires" content="0" />
		
		<script language="javascript">
			function passwordChanged() {
			var strength = document.getElementById('strengthInfo');
			var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
			var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
			var enoughRegex = new RegExp("(?=.{6,}).*", "g");

			var pwd = document.getElementById("pwd");
			if (pwd.value.length==0) {
			strength.innerHTML = '<span style="color:green"><strong>Type Password!</strong></span>';
			} else if (false == enoughRegex.test(pwd.value)) {
			strength.innerHTML = "More Characters";
			} else if (strongRegex.test(pwd.value)) {
			strength.innerHTML = '<span style="color:green">Strong!</span>';
			} else if (mediumRegex.test(pwd.value)) {
			strength.innerHTML = '<span style="color:orange">Medium!</span>';
			} else {
			strength.innerHTML = '<span style="color:red">Weak!</span>';
			};
			}
		</script>
		
		
		<script>
		/*
		function checkPasswordStrength(pwdObj) {
			if (pwdObj.value == '') {
				return true;
			}
			var ajaxRequest = initiateRequest();
			ajaxRequest.onreadystatechange = function () {
				if (ajaxRequest.readyState == 4) {
					if (ajaxRequest.status == 200) {
						var response = ajaxRequest.responseText;
						if (response.indexOf("true") != -1) {
							document.getElementById('strengthInfo').innerHTML = "<font color='green'>Password valid.</font>";
						} else {
							document.getElementById('strengthInfo').innerHTML = "<font color='red'>Password invalid.</font>";
						}
					}
				}
			}; 
			ajaxRequest.open("GET", "/maa/checkPasswordStrength.do?"+"AJAX=true&pwd="+pwdObj.value, true);		
			ajaxRequest.send(null);
		}
		*/
		</script>
    </head>
    
<body   onload="javascript:document.getElementById('strong').checked=false"  >
	








<div class="commontopyellowbg">Administration</div>
<div class="commontopbluebg"><div class="commontopdate">Today is: <span style="color:black"><%=new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date())%></span></div>Welcome <span class="bold" style="color:#cccccc"><s:property value="%{j_username}"/> </span></div>
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
		  						<form name="chgPasswordForm" method="post" action="chgPassword">
			<table align="center"  width="500px">
				<tr>
					<td class="tableheader" align="center" width="80%" height="15" colspan=4>
						Change Password
					</td>
				</tr>
				<tr>
					<td colspan=4>&nbsp;</td>
				</tr>
				<tr>
					<s:hidden name="seq_no"></s:hidden>
					<td class="labelcell"  height="23">Old Password<font class="ErrorText">*</font></td>
					<td class="labelcell" align="left" height="23" >
						<input type="password" name="oldPwd" maxlength="30" size="36" value="" class="ControlText">
					</td>
				</tr>
				<tr>
					<td class="labelcell"  height="23">New Password  <font class="ErrorText">*</font></td>
					<td class="labelcell" align="left"  height="23" >
						<input type="password" name="pwd" maxlength="30" size="36" value=""  onkeyup="return passwordChanged();" id="pwd" class="ControlText"><div id="strengthInfo" style="font-size:10px"></div>
					</td>
				</tr>
				<tr>
					<td class="labelcell"  height="23">Confirm Password<font class="ErrorText">*</font></td>
					<td class="labelcell" align="left" height="23" >
					<input type="password" name="pwdReminder" maxlength="30" size="36" value="" class="ControlText"></td>
				</tr>
				<tr>
					<td colspan="4" style="color:red"></td>
				</tr>
				<tr height="50px">
					<td colspan="4"></td>
				</tr>
				<tr>
					<td class="button2" align="center" colspan=4>
					<input type=submit name="submit" value="Submit"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="Close" onclick="javascript:window.close()"/>
					</td>			
				</tr>
				<tr><td colspan="2"><div><span style="color:red;font-size:10px" id="pwdInfo">Password must be at least 8 to 30 characters long and must have one or more :- upper case and lower case alphabet,number and special character except [<font color='black'>&amp; &lt; &gt; # % " ' / \ and space</font>]</span></div></td></tr>
			</table>
		</form>
		  					</div>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>	
	
	
</body>
</html>