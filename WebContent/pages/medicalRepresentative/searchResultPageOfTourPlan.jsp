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
        <link rel="icon" href="/egi/images/favicon.ico"/>
        <title>rx  - Create Tour Plan </title>

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
		
		<script type="text/javascript" src="/maa/javascripts/commonjs/calendar.js"></script>
		<script type="text/javascript" src="/maa/javascripts/dateValidation.js"></script>
		
		<script type="text/javascript">
			function bodyonload() {
				//alert("In Body on load");
				document.getElementById('tourPurposeArray').value = "";
				document.getElementById('tourDateArray').value = "";
				document.getElementById('timeArray').value = "";
				document.getElementById('descArrayForDoc').value = "";
				document.getElementById('descArrayForChem').value = "";
				
			}
		</script>

    </head>
    
<body >



<div class="commontopyellowbg">Tour Planning System</div>
<div class="commontopbluebg"><div class="commontopdate">Today is: 
	<span class="bold" style="color:black"><%=new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date())%>
	</span></div>Welcome <span class="bold" style="color:#cccccc"><s:property value="#session.UserName"/></span>
</div>
<div class="commontopbreadc" id="breadcrumb">&nbsp;<!--%=breadCrumb%> --></div>

	
 
	<br/>
	<table align="center">
		<tr> 
			<td>
				<div id="main">
		  			<div id="m2">
		  				<div id="m3">
		  					<div align="center">
		  						<s:form theme="simple" name="CreatedUserTourForm" method="post" action="/CreateUserTourPlan.action" enctype="multipart/form-data" onsubmit=" return validateTP();">
			
			<table align="center" class="tableStyle" width="100%">
				<tr>
				
					<td colspan=4>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="tableheader" valign="middle" align="center" colspan="2" height="26">
						Created Tour Plan
						
					</td>
				</tr>
			</table>
			<br/>
				<!-- 				
					Search Result of Tour Plan
				 -->
				
				<font color="red" size="2px"><s:property value="%{dispResult}" /></font> 
				
				<s:if test="%{tourDetailsListForTP!=null}">
				
					<fieldset style="border:1px solid gray;padding:5px;margin:5px">
				<legend>Created User Tour Plan</legend>			
				<table border="1" width="100%" align="center" id="reason_table" class="tableStyle">
					<tr>
						<td class="tablesubcaption" valign="bottom" align="center" width="20%" height="20">
							&nbsp; Tour Date
						</td>
						<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">
							&nbsp; Time
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="20%" height="20">
							&nbsp; Purpose
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="20%" height="20">
							&nbsp; Doctor
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="20%" height="20">
							&nbsp; Chemist
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="15%" height="20">
							&nbsp; Is Completed
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="15%" height="20">
							&nbsp;
							<table width="100%" class="tableStyle">
			            		<tbody><tr>
					             	<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">Edit</td>
					             	<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20"><img src="/maa/images/page_edit.png" alt="Edit Data"  border="0" width="16" height="16"></td>
			             		</tr></tbody>
		             		</table>
						</td>
					</tr>
					<s:iterator value="tourDetailsListForTP" >
					<tr id="reasonrow">
						<td class="labelcell" valign="bottom" align="center" width="20%" height="20">
							<s:textfield name="tourDateArray" value="%{tourDate}" size="10" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="tourDateArray" cssClass="ControlText" readonly="true"/>
								<a href="javascript:show_calendar('userTourForm.tourDateArray');" >
									<img src="<%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
								</a>
						</td>
						<td class="labelcell" valign="bottom" align="center" width="20%" height="20">
							<s:select name="timeArray" id="timeArray" cssClass="ControlText" list="timeList" value="%{time}" listKey="timeId" listValue="time" headerKey="" headerValue="--Select Time--" disabled="true"/>
						</td>
						<td class="labelcell" valign="bottom" align="center" width="20%" height="20">
							<s:select name="tourPurposeArray" id="tourPurposeArray" value="%{tourPurpose}" cssClass="ControlText" list="tourPurposeList" listKey="tourPurposeId" listValue="tourPurposeName" headerKey="" headerValue="--Select--" disabled="true" />
						</td>
						<td class="labelcell" valign="bottom" align="center" width="20%" height="20">
							<s:select name="descArrayForDoc" id="descArrayForDoc" value="%{descDoc}" cssClass="ControlText" list="docListCurr" listKey="doc_id" listValue="doctor_name" headerKey="" headerValue="--Select Doctor--" disabled="true" />
						</td>
						<td class="labelcell" valign="bottom" align="center" width="20%" height="20">
							<s:select name="descArrayForChem" id="descArrayForChem" value="%{descChem}" cssClass="ControlText" list="chemistListCurr" listKey="chemist_id" listValue="chemist_name" headerKey="" headerValue="--Select Chemist--" disabled="true" />
						</td>
						<td class="labelcell" valign="bottom" align="left" width="15%" height="20">
						<s:checkbox name="isCompleted" value="%{isCompleted}" id="isCompleted" class="ControlText" disabled="true"/>
						</td>
						
						<td class="labelcell" valign="bottom" align="left" width="30%" height="20">
		            	<table border="1" width="100%" align="center" class="tableStyle">
		            		<tbody><tr>
		            			
		            			<!-- Make an action for edit, here it is editTP -->
				             	<td class="labelcell" valign="bottom" align="left" width="20%" height="20"><a href="/maa/editTP?seq_no=<s:property value="seq_no"/>&amp;">Edit</a></td>
				             	<td class="labelcell" valign="bottom" align="left" width="20%" height="20"><a href="/maa/editTP?seq_no=<s:property value="seq_no"/>&amp;"><img src="/maa/images/page_edit.png" alt="Edit Data"  border="0" width="16" height="16"></a></td>
		             		</tr></tbody>
		                                                                                                  
		             	</table>
		           </td>
						
					</tr>
					</s:iterator>
				</table>
				</fieldset>
				</s:if>
				
				<br/>
				<table align="center" class="tableStyle" width="100%">
					<tr>
						<td valign="bottom" height="20" align="center">
							<input type="button" value="BACK" style="font-size:12px" onclick=" return tourPlanPage()">
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
	function tourPlanPage(){
		document.CreatedUserTourForm.action='/maa/backToTourPlanForm';
		document.CreatedUserTourForm.submit();
	}
</script>
</html>