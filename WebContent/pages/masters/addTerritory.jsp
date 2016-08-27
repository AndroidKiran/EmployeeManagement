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
			function bodyonload() {
				document.getElementById('ter_id').value="";
				document.getElementById('territory').value="";
			}

			function validation() {
				if(document.getElementById('ter_id').value=="") {
					alert("Please enter a Territory ID");
					return false;
				}
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
		  						<form name="addTerritory" method="post" action="/maa/addTerritory" onsubmit="return validation()">
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
						<tr>		
							<td  class="labelcell" width="40%" height="23" >Territory ID</td>
							<td  class="labelcell" align="left" width="40%" height="23" >
								<input type="text" name="ter_id" value="" id="ter_id" class="ControlText">
							</td>
						</tr>
						<tr>
							<td class="labelcell"  width="40%" height="23" >Territory Name<font class="ErrorText">*</font></td>
							<td class="labelcell"  align="left" width="40%" height="23" >
								<input type="text" name="territory" value="" id="territory" class="ControlText">
							</td>
						</tr>
					</table>
				</td></tr>
				<tr><td><br/><br/></td></tr>
				<tr><td>
					<table align="center" class="tableStyle">
						<tr align="center">
							<td align="center" >
								<input align="middle" type="submit" value="  Save  ">
							</td>
							<td>&nbsp;&nbsp;</td>
							<td align="center">
								<input align="middle" type="button" value="Search" id="button" name="Submit" onclick="return searchTerritory();"/>
							</td>
						</tr>			
					</table>
				</td></tr>
				<tr><td>
			
					<s:if test="%{territoryListAll!=null}">
						<table border="1" width="100%" align="center" class="tableStyle">	
					
							<tr>
								<td class="tablesubcaption" valign="bottom" align="left" width="10%" height="20">Sl. No.</td>
								<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">Territory ID</td>
								<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">Territory Name</td>
								<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">
									<table width="100%" class="tableStyle">
					            		<tbody><tr>
					            		
							             	<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">Edit</td>
							             	<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20"><img src="/maa/images/page_edit.png" alt="Edit Data"  border="0" width="16" height="16"></td>
					             		</tr>
					             		<tr>
					             			<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">Delete</td>
							             	<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20"><img src="/maa/images/delete.png" alt="Delete Data"  border="0" width="16" height="16"></td>
					             		</tr></tbody>
					                                                                                                  
					             	</table>
								</td>
							</tr>
						
							<s:iterator value="territoryListAll" var="cont" status="stat">
							  <tr id="reasonrow">
							  	<td class="labelcell" valign="bottom" align="left" width="5%" height="20">
					               <s:property value="%{#stat.index + 1}" />
					            </td>
							    <td class="labelcell" valign="bottom" align="left" width="20%" height="20"><s:property value="ter_id"/></td>
							    <td class="labelcell" valign="bottom" align="left" width="20%" height="20"><s:property value="territory"/></td>
							    <td class="labelcell" valign="bottom" align="left" width="30%" height="20">
					            	<table border="1" width="100%" align="center" class="tableStyle">
					            		<tbody><tr>
					            			
					            			<!-- Make an action for edit, here it is editTerritory -->
							             	<td class="labelcell" valign="bottom" align="left" width="20%" height="20"><a href="/maa/editTerritory?seq_no=<s:property value="seq_no"/>&amp;">Edit</a></td>
							             	<td class="labelcell" valign="bottom" align="left" width="20%" height="20"><a href="/maa/editTerritory?seq_no=<s:property value="seq_no"/>&amp;"><img src="/maa/images/page_edit.png" alt="Edit Data"  border="0" width="16" height="16"></a></td>
					             		</tr>
					             		<tr>
					             			<td class="labelcell" valign="bottom" align="left" width="20%" height="20"><a href="/maa/deleteTerritory?seq_no=<s:property value="seq_no"/>&amp;">Delete</a></td>
							             	<td class="labelcell" valign="bottom" align="left" width="20%" height="20"><a href="/maa/deleteTerritory?seq_no=<s:property value="seq_no"/>&amp;"><img src="/maa/images/delete.png" alt="View Data"  border="0" width="16" height="16"></a></td>
					             		
					             		</tr></tbody>
					                                                                                                  
					             	</table>
					           </td>
							    
							  </tr>
							</s:iterator>
						</table>
					</s:if>	  
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
function searchTerritory(){
	
	document.addTerritory.action='/maa/searchTerritory';
	document.addTerritory.submit();
}
</script>
</html>



