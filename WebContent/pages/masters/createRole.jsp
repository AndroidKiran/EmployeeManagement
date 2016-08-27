

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
        <link rel="icon" href="/egi/images/favicon.ico"/>
        <title>rx  - Create Role </title>

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
			function bodyonload() {
				document.getElementById('roleName').value="";
				document.getElementById('roleDesc').value="";
			}

			function validation() {
				if(document.getElementById('roleName').value=="") {
					alert("Please enter a Role Name");
					return false;
				}
				if(!isNaN(document.getElementById('roleName').value)) {
					alert("Role Name can not be a numeric value.");
					document.getElementById('roleName').value="";
					document.getElementById('roleName').focus();
					return false;
				}
				/*
   				if(!uniqueCheckingBoolean('/maa/commonyui/rx/uniqueCheckAjax.jsp' , 'EG_ROLES', 'ROLE_NAME', 'roleName', 'no', 'no')) {
   					alert("Role Name already exists..!");
   					document.getElementById('roleName').value="";
   					document.getElementById('roleName').focus();
   					return false;
				}*/
				return true;
			}
		</script>
    </head>
    
<body   onload="bodyonload()"  >
	

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
		  						<form name="roleForm" method="post" action="/maa/CreateRole.action?bool=CREATE" onsubmit="return validation()"><div><input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="cd26b486fa21a3d69bf8bf3fa6505400"></div>
			<table align="center" id="getAllDetails" name="getAllDetails">
				<table align="center" class="tableStyle">
					<tr>
						<td class="tableheader" align="middle" width="728" height="6">Create Role</td>
					</tr>
					<tr>
						<td colspan="4">&nbsp;</td>
					</tr>
			</table>
			<br/><br/>
			<table align="center"  class="tableStyle">
				<!-- tr>
					<td  class="labelcell" width="40%" height="23" >Role Id<font class="ErrorText">*</font></td>
					<td  class="labelcell" align="left" width="40%" height="23" >
						<input type="text" name="roleId" value="Auto-Generated" id="roleId" class="ControlText" readonly="readonly">
					</td>
				</tr-->
				<tr>
					<td  class="labelcell" width="40%" height="23" >Role Name<font class="ErrorText">*</font></td>
					<td  class="labelcell" align="left" width="40%" height="23" >
						<input type="text" name="roleName" value="" id="roleName" class="ControlText">
					</td>
				</tr>
				<tr>
					<td class="labelcell"  width="40%" height="23" >Role Description</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<input type="text" name="roleDesc" value="" id="roleDesc" class="ControlText">
					</td>
				</tr>
			</table>
			<br/><br/>
			<table align="center" class="tableStyle">
				<tr>
					<td align="middle" width="728" colspan="4" >
						<input type="submit" value="  Save  ">
					</td>
				</tr>			
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