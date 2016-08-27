<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.text.SimpleDateFormat" %>  

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
        <title>rx  - Create Reference </title>

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
				document.getElementById('ref_id').value="";
				document.getElementById('ref_path').value="";
				document.getElementById('ref_type').value="";
			}

			function validation() {
				/*if(document.getElementById('ref_id').value=="") {
					alert("Please enter a Reference Id");
					document.getElementById('ref_id').focus();
					return false;
				}*/
				if(document.getElementById('ref_type').value=="") {
					alert("Please enter Reference Type");
					return false;
				}
				else if(!isNaN(document.getElementById('ref_type').value)) {
					alert("Reference Type can not be a numeric value.");
					document.getElementById('ref_type').value="";
					document.getElementById('ref_type').focus();
					return false;
				}
				
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
		  						<form name="roleForm" method="post" action="/maa/addReference" onsubmit="return validation()"><div><input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="cd26b486fa21a3d69bf8bf3fa6505400"></div>
			<table align="center" id="getAllDetails" name="getAllDetails">
				<tr><td>
					<table align="center" class="tableStyle">
						<tr>
							<td class="tableheader" align="middle" width="728" height="6">Create Reference</td>
						</tr>
						<tr>
							<td colspan="4">&nbsp;</td>
						</tr>
					</table>
					</td></tr>
					
				<tr><td><br/><br/></td></tr>
				<tr><td>
					<table align="center"  class="tableStyle">
						<tr>
						<!-- tr>
							<td  class="labelcell" width="40%" height="23" >Role Id<font class="ErrorText">*</font></td>
							<td  class="labelcell" align="left" width="40%" height="23" >
								<input type="text" name="roleId" value="Auto-Generated" id="roleId" class="ControlText" readonly="readonly">
							</td>
						</tr-->						
							<td class="labelcell" width="40%" height="23" >Reference ID<font class="ErrorText">*</font></td>
							<td class="labelcell" align="left" width="40%" height="23" >
								<input type="text" value="Auto-Generated" class="ControlText" readonly="readonly">
								<input type="hidden" name="ref_id" value="" id="ref_id" class="ControlText" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td class="labelcell"  width="40%" height="23" >Reference Path</td>
							<td class="labelcell"  align="left" width="40%" height="23" >
								<input type="text" name="ref_path" value="" id="ref_path" class="ControlText">
							</td>
						</tr>
						<tr>
							<td class="labelcell"  width="40%" height="23" >Reference Type<font class="ErrorText">*</font></td>
							<td class="labelcell"  align="left" width="40%" height="23" >
								<input type="text" name="ref_type" value="" id="ref_type" class="ControlText">
							</td>
						</tr>
					</table>
				</td></tr>
				
				<tr><td><br/><br/></td></tr>
				<tr><td>
					<table align="center" class="tableStyle">
						<tr>
							<td align="middle" width="728" colspan="4" >
								<input type="submit" value="  Save  ">
							</td>			
						
						</tr>			
					</table>
				</td></tr>
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
<script type="text/javascript">
	function validateRefId(){
		
		var x=document.getElementById("ref_id");
		var phoneNoStr = x.value;
		var objRegExp  = /^([0-9]+)$/;
		//x.value=x.value.toUpperCase();
		var check = objRegExp.test(phoneNoStr); 
		
		if(check){
			 //alert("In if-->check");
			 return true;
		}
		else{
			
			 document.getElementById('ref_id').value="";
			 document.getElementById('ref_id').focus();
			 return false;
		}
	}
</script>
</html>


