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
    
<body onload="bodyonload();" >



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
		  						<s:form theme="simple" name="userTourForm" method="post" action="/CreateUserTourPlan.action" enctype="multipart/form-data" onsubmit=" return validateTP();">
			
			<table align="center" class="tableStyle" width="100%">
				<tr>
				
					<td colspan=4>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="tableheader" valign="middle" align="center" colspan="2" height="26">
						Create Tour Plan
						
					</td>
				</tr>
			</table>
			<br/>
			
				
			<fieldset style="border:1px solid gray;padding:5px;margin:5px">
				<legend>User Tour Plan</legend>			
				<table border="1" width="100%" align="center" id="reason_table" class="tableStyle">
					<tr>
						<td class="tablesubcaption" valign="bottom" align="center" width="20%" height="20">
							&nbsp; Tour Date <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">
							&nbsp; Time <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="20%" height="20">
							&nbsp; Purpose <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="20%" height="20">
							&nbsp; Doctor <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="20%" height="20">
							&nbsp; Chemist <font class="ErrorText">*</font>
						</td>
						<td class="button2" colspan="2" align="center">
							<input type=button  name="addRow" value="Add Row" onclick="addRole();" />
						</td>
					</tr>
				
					<tr id="reasonrow">
						<td class="labelcell" valign="bottom" align="center" width="20%" height="20">
							<s:textfield name="tourDateArray" value="" size="10" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="tourDateArray" cssClass="ControlText"/>
								<a href="javascript:show_calendar('userTourForm.tourDateArray');" >
									<img src="<%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
								</a>
						</td>
						
<!-- 						<td class="labelcell" valign="bottom" align="center" width="20%" height="20">
							<s:combobox name="timeArray" id="timeArray" cssClass="ControlText" list="timeList" listKey="timeId" listValue="time" label="Select Time" headerKey="" headerValue="-- Select Time--"/>
						</td>
						<td class="labelcell" valign="bottom" align="center" width="20%" height="20">
							<s:combobox name="tourPurposeArray" id="tourPurposeArray" cssClass="ControlText" label="Select Purpose" list="tourPurposeList" listKey="tourPurposeId" listValue="tourPurposeName" headerKey="" headerValue="--Select--" />
						</td>
						<td class="labelcell" valign="bottom" align="center" width="20%" height="20">
							<s:combobox name="descArrayForDoc" id="descArrayForDoc" cssClass="ControlText" label="Select Doctor" list="docListCurr" listKey="doc_id" listValue="doctor_name" headerKey="" headerValue="--Select Doctor--" />
						</td>
						<td class="labelcell" valign="bottom" align="center" width="20%" height="20">
							<s:combobox name="descArrayForChem" id="descArrayForChem" cssClass="ControlText" label="Select Chemist" list="chemistListCurr" listKey="chemist_id" listValue="chemist_name" headerKey="" headerValue="--Select Chemist--" />
						</td>
 -->						
						
					<td class="labelcell" valign="bottom" align="center" width="20%" height="20">
							<s:select name="timeArray" id="timeArray" cssClass="ControlText" list="timeList" listKey="timeId" listValue="time" headerKey="" headerValue="--Select Time--" />
						</td>
						
						<td class="labelcell" valign="bottom" align="center" width="20%" height="20">
							<s:select name="tourPurposeArray" id="tourPurposeArray" cssClass="ControlText" list="tourPurposeList" listKey="tourPurposeId" listValue="tourPurposeName" headerKey="" headerValue="--Select--" />
						</td>
						<td class="labelcell" valign="bottom" align="center" width="20%" height="20">
							<s:select name="descArrayForDoc" id="descArrayForDoc" cssClass="ControlText" list="docListCurr" listKey="doc_id" listValue="doctor_name" headerKey="" headerValue="--Select Doctor--" />
						</td>
						<td class="labelcell" valign="bottom" align="center" width="20%" height="20">
							<s:select name="descArrayForChem" id="descArrayForChem" cssClass="ControlText" list="chemistListCurr" listKey="chemist_id" listValue="chemist_name" headerKey="" headerValue="--Select Chemist--" />
						</td>
					<td class="button2" valign="bottom" align="center" width="20%" height="20">
							<input type="button" name="delRow" value="Delete" onclick="deleteRole(this)" />
						</td>
					</tr>
				</table>
				</fieldset>
				<br/>
				<table align="center" class="tableStyle" width="100%">
					<tr>
						<td align="center" valign="bottom" height="20">
							<br/>
							<s:submit value="Create" style="font-size:12px"/>
							<!-- input type="submit" value="Create" style="font-size:12px" -->
						</td>
						<td valign="bottom" height="20">
							<input type="button" value="Holiday List" style="font-size:12px" onclick=" return searchHolidayForMR()">
						</td>
						<td valign="bottom" height="20">
							<input type="button" value="Tour Plan List" style="font-size:12px" onclick=" return searchTourPlanMR()">
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
				
				
				
				<!-- Fields for Holiday List -->
				<s:if test="%{holidayList!=null}">
					
					<fieldset style="border:1px solid gray;padding:5px;margin:5px">
						<legend>list of Holiday's</legend>			
						<table border="1" width="100%" align="center" class="tableStyle">
							<tr>								
								<td class="tablesubcaption" valign="bottom" align="left" width="25%" height="20">
									&nbsp; Region
								</td>
								<td class="tablesubcaption" valign="bottom" align="left" width="25%" height="20">
									&nbsp; Date(dd/mm/yyyy)
								</td>
								<td class="tablesubcaption" valign="bottom" align="left" width="25%" height="20">
									&nbsp; Description
								</td>					
							</tr>
						
							<s:iterator value="holidayList" var="cont" status="stat">			
								<tr id="reasonrow">
									
									<td class="labelcell" valign="bottom" align="left" width="25%" height="20">
										<s:select name="holidayRegion" value="holidayRegion" id="holidayRegion" cssClass="ControlText" list="regionList" listKey="regId" listValue="regionName" headerKey="0" headerValue="--Select--" disabled="true"/>						
									</td>
									
									<td class="labelcell" valign="bottom" align="left" width="15%" height="20">
										<s:property value="holidayDate"/>
									</td>
									
									<td class="labelcell" valign="bottom" align="left" width="25%" height="20">
										<s:property value="holidayDesc"/>
									</td>
								</tr>
							</s:iterator>
						</table>						
					</fieldset>				
				</s:if>			
				
				
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

function searchHolidayForMR()
{
	document.userTourForm.action='/maa/searchHolidayForMR';
	document.userTourForm.submit();
}
function searchTourPlanMR()
{
	document.userTourForm.action='/maa/searchTourPlanMR';
	document.userTourForm.submit();
}


function deleteRole(obj) {
	var tbl = document.getElementById("reason_table");
	var rowNumber = getRow(obj).rowIndex;
	//alert("rowNumber --> "+rowNumber);
	var rowo = tbl.rows.length;
	//alert("rowo --> "+rowo);
	if (rowo <= 2) {
		alert("This row can not be deleted");
		return false;
	} else {
		tbl.deleteRow(rowNumber);
		return true;
	}
}
function addRole() {
	
	var tbl = document.getElementById("reason_table");
	var tbody = tbl.tBodies[0];
	var lastRow = tbl.rows.length;
	//alert("last Row --> "+lastRow);
	var rowObj = document.getElementById("reasonrow").cloneNode(true);
	tbody.appendChild(rowObj);
	document.getElementsByName('tourPurposeArray')[lastRow].value = "";
	document.getElementsByName('tourDateArray')[lastRow].value = "";
	document.getElementsByName('timeArray')[lastRow].value = "";
	document.getElementsByName('descArrayForDoc')[lastRow].value = "";
	document.getElementsByName('descArrayForChem')[lastRow].value = "";
}
function validateTP() {
	var row = document.getElementById("reason_table").rows.length;
	
	//alert("Row --> "+row);
	
	if(row == 2){
		if(document.getElementById('tourPurposeArray').value=="") {
			alert("Please Select Tour Purpose ");
			document.getElementById('tourPurposeArray').focus();
			return false;
		}
		if(document.getElementById('tourDateArray').value=="") {
			alert("Please Enter Tour Date ");
			document.getElementById('tourDateArray').focus();
			return false;
		}
		if(document.getElementById('timeArray').value=="") {
			alert("Please Select Time ");
			document.getElementById('timeArray').focus();
			return false;
		}
		if((document.getElementById('descArrayForDoc').value=="") && (document.getElementById('descArrayForChem').value=="")) {
			alert("Please Select either Doctor or Chemist ");
			return false;
		}
		if((document.getElementById('descArrayForDoc').value!="") && (document.getElementById('descArrayForChem').value!="")) {
			alert("Please Select either Doctor or Chemist ");
			return false;
		}
	}
	else if (row > 2) {
		if(document.getElementsByName('tourPurposeArray')[row - 2].value=="") {
			alert("Please Select Tour Purpose ");
			document.getElementsByName('tourPurposeArray')[row - 2].focus();
			return false;
		}
		if(document.getElementsByName('tourDateArray')[row - 2].value=="") {
			alert("Please Enter Tour Date ");
			document.getElementsByName('tourDateArray')[row - 2].focus();
			return false;
		}
		if(document.getElementsByName('timeArray')[row - 2].value=="") {
			alert("Please Select Time ");
			document.getElementsByName('timeArray')[row - 2].focus();
			return false;
		}
		if((document.getElementsByName('descArrayForDoc')[row - 2].value=="") && (document.getElementsByName('descArrayForChem')[row - 2].value=="")) {
			alert("Please Select either Doctor or Chemist ");
			return false;
		}
		if((document.getElementsByName('descArrayForDoc')[row - 2].value!="") && (document.getElementsByName('descArrayForChem')[row - 2].value!="")) {
			alert("Please Select either Doctor or Chemist ");
			return false;
		}
		
	}
	
	
	if(row < 11){
		alert("You are Supposed to fill atleast 10 Tour Plan Every Day.");
		var remaining = 11 - row;
		alert("Remaining Tour Plan for the Day is "+remaining);
	}
	return true;
}

</script>
</html>