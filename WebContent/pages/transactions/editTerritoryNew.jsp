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
        <title>rx  - Create Territory </title>

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

			function validation() {
				if(document.getElementById('territory').value=="") {
					alert("Please enter a Territory Name");
					return false;
				}
				else if(!isNaN(document.getElementById('territory').value)) {
					alert("Territory Name can not be a numeric value.");
					document.getElementById('territory').value="";
					document.getElementById('territory').focus();
					return false;
				}
			}
		</script>
    </head>
    
<body  >
	

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
		  						<s:form theme="simple" name="editTerritory" method="post" action="/UpdateTerritory" onsubmit="return validation()">
			<table align="center" id="getAllDetails" name="getAllDetails">
				<tr><td>
					<table align="center" class="tableStyle">
						<tr>
							<td class="tableheader" align="middle" width="728" height="6">Create Territory</td>
						</tr>
						<tr>
							<td colspan="4">&nbsp;</td>
						</tr>
					</table>
				</td></tr>
				<tr><td><br/><br/></td></tr>
				
				<tr><td>
					<table align="center"  class="tableStyle">
						<s:iterator status="stat" id="itr" var="terVar" value="territoryListEdit">
						<s:hidden name="seq_no" value="%{seq_no}"></s:hidden>
						<tr>		
							<td  class="labelcell" width="40%" height="23" >Territory ID<font class="ErrorText">(Auto-generated)</font></td>
							<td  class="labelcell" align="left" width="40%" height="23" >
								<s:textfield name="ter_id" value="%{ter_id}" id="ter_id" class="ControlText" readonly="true"/>
							</td>
						</tr>
						<tr>
							<td class="labelcell"  width="40%" height="23" >Territory Name<font class="ErrorText">*</font></td>
							<td class="labelcell"  align="left" width="40%" height="23" >
								<s:textfield name="territory" value="%{territory}" id="territory" class="ControlText" />
							</td>
						</tr>
						</s:iterator>
					</table>
				</td></tr>
				<tr><td><br/><br/></td></tr>
				
				<tr><td>
					<table align="center" class="tableStyle">
						<tr>
							<td align="middle" width="728" colspan="4" >
								<input type="submit" value="  UPDATE  ">
							</td>
						</tr>			
					</table>
				</td></tr>
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

</html>



