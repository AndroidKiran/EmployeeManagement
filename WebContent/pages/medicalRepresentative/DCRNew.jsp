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
			/*function bodyonload() {
				alert("In Body on load");
				document.getElementById('tourPurposeArray').value = "";
				document.getElementById('tourDateArray').value = "";
				document.getElementById('timeArray').value = "";
				document.getElementById('descArrayForDoc').value = "";
				document.getElementById('descArrayForChem').value = "";
				document.getElementById('workTypeArray').value = "";
				document.getElementById('workedWithArray').value = "";
				document.getElementById('nxtVisitArray').value = "";
				document.getElementById('remarksArray').value = "";
				
			}*/
		</script>

    </head>
    
<body >



<div class="commontopyellowbg">DCR Reporting System</div>
<div class="commontopbluebg"><div class="commontopdate">Today is: 
	<span class="bold" style="color:black"><%=new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date())%>
	</span></div>Welcome <span class="bold" style="color:#cccccc"><s:property value="#session.UserName"/></span>
</div>
<div class="commontopbreadc" id="breadcrumb">&nbsp;<!--%=breadCrumb%> --></div>

	
 
	<br/>
	<table align="center">
		<tr> 
			<td>
				
		  					<div align="center">
		  						<s:form theme="simple" name="userDCRForm" method="post" enctype="multipart/form-data" >
			
			<table align="center" class="tableStyle" width="100%">
				<tr>
				
					<td colspan=4>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="tableheader" valign="middle" align="center" colspan="2" height="26">
						DCR Reporting System
						
					</td>
				</tr>
			</table>
			<br/>
			
				
			<fieldset style="border:1px solid gray;padding:5px;margin:5px">
				<legend>Create User DCR</legend>			
				<table border="1" width="100%" align="center" id="reason_table" class="tableStyle">
					<tr>
						
						<td class="tablesubcaption" valign="bottom" align="center" width="10%" height="20">
							&nbsp; Tour Date <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="left" width="10%" height="20">
							&nbsp; Time <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="10%" height="20">
							&nbsp; Doctor <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="10%" height="20">
							&nbsp; Chemist <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="10%" height="20">
							&nbsp; Work Type <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="10%" height="20">
							&nbsp; Worked With <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="10%" height="20">
							&nbsp; Topic Of Discussion <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="10%" height="20">
							&nbsp; Next Visit Due On <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="15%" height="20">
							&nbsp; Remarks <font class="ErrorText">*</font>
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="5%" height="20">
							&nbsp; Add/Delete
						</td>
					</tr>
				
					<tr id="reasonrow">
						<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
							<s:textfield name="tourDateArray" value="" size="10" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="tourDateArray" cssClass="ControlText"/>
								<a href="javascript:show_calendar('userDCRForm.tourDateArray');" >
									<img src="<%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
								</a>
						</td>
						<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
							<s:select name="timeArray" id="timeArray" cssClass="ControlText" list="timeList" listKey="timeId" listValue="time" headerKey="" headerValue="--Select Time--" />
						</td>
						<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
							<s:select name="descArrayForDoc" id="descArrayForDoc" cssClass="ControlText" list="docListCurr" listKey="doc_id" listValue="doctor_name" headerKey="" headerValue="--Select Doctor--" />
						</td>
						<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
							<s:select name="descArrayForChem" id="descArrayForChem" cssClass="ControlText" list="chemistListCurr" listKey="chemist_id" listValue="chemist_name" headerKey="" headerValue="--Select Chemist--" />
						</td>
						<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
							<s:select name="workTypeArray" id="workTypeArray" cssClass="ControlText" list="workTypeList" listKey="workTypeId" listValue="workTypeName" headerKey="" headerValue="--Select Work-Type--" />
						</td>
						<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
							<s:select name="workedWithArray" id="workedWithArray" cssClass="ControlText" list="workedWithList" listKey="dsgId" listValue="dsgName" headerKey="" headerValue="--Select Designation--" />
						</td>
						<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
							<s:select name="topicDissArray" id="topicDissArray" cssClass="ControlText" list="topicDiscussionList" listKey="topicId" listValue="topicName" headerKey="" headerValue="--Select Topic--" />
						</td>
						<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
							<s:textfield name="nxtVisitArray" value="" size="10" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="nxtVisitArray" cssClass="ControlText"/>
								<a href="javascript:show_calendar('userDCRForm.nxtVisitArray');" >
									<img src="<%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
								</a>
						</td>
						<td class="labelcell" valign="bottom" align="center" width="15%" height="20">
							<s:textarea name="remarksArray" value="" id="remarksArray" rows="3" cols="12" cssClass="ControlText"/>
						</td>
						<td class="button2" valign="bottom" align="center" width="5%" height="20">
				      		<p align="center"><img src="/maa/images/add.png" alt="Add" width="18" height="18" border="0" onclick="addRole()"/>
				      		<img src="/maa/images/delete.png" alt="Remove" width="18" height="18" border="0" onclick="deleteRole(this)"/></p>
			      		</td>
					</tr>
				</table>
				</fieldset>
				<br/>
				<table align="center" class="tableStyle" width="100%">
					<tr>
						<td align="center" valign="bottom" height="20">
							<br/>
							<input type="button" value="Submit" style="font-size:12px" onclick=" return createDCR();">
							
						</td>
						<td align="left" valign="bottom" height="20">
							<br/>
							<input type="button" value="Search DCR" style="font-size:12px" onclick=" return searchDCRFromDB();">
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
						
			</td>
		</tr>
	</table>	
</body>

<script type="text/javascript">

function createDCR()
{
	//alert("1");
	if(validateDCR()){
		//alert("2");
		document.userDCRForm.action='/maa/CreateDCR';
		document.userDCRForm.submit();
	}
	//else return false;
}

function searchDCRFromDB()
{
	document.userDCRForm.action='/maa/searchDCRFromDB';
	document.userDCRForm.submit();
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
	document.getElementById('tourDateArray')[lastRow].value = "";
	document.getElementsByName('timeArray')[lastRow].value = "";
	document.getElementsByName('descArrayForDoc')[lastRow].value = "";
	document.getElementsByName('descArrayForChem')[lastRow].value = "";
}
function validateDCR() {
	var row = document.getElementById("reason_table").rows.length;
	
	//alert("Row --> "+row);
	
	if(row == 2){
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
			alert("Please do not Select Doctor as well as Chemist both ");
			return false;
		}
		if(document.getElementById('workTypeArray').value=="") {
			alert("Please Select Type Of Work ");
			document.getElementById('workTypeArray').focus();
			return false;
		}
		if(document.getElementById('workedWithArray').value=="") {
			alert("Please Select Worked With ");
			document.getElementById('workedWithArray').focus();
			return false;
		}
		if(document.getElementById('topicDissArray').value=="") {
			alert("Please Select Topic Of Discussion ");
			document.getElementById('topicDissArray').focus();
			return false;
		}
		if(document.getElementById('nxtVisitArray').value=="") {
			alert("Please give Next Visit Date ");
			document.getElementById('nxtVisitArray').focus();
			return false;
		}
		if(document.getElementById('remarksArray').value=="") {
			alert("Please give Remarks ");
			document.getElementById('remarksArray').focus();
			return false;
		}
	}
	else if (row > 2) {
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
		if(document.getElementsByName('workTypeArray')[row - 2].value=="") {
			alert("Please Select Type Of Work ");
			document.getElementsByName('workTypeArray')[row - 2].focus();
			return false;
		}
		if(document.getElementsByName('workedWithArray')[row - 2].value=="") {
			alert("Please Select Worked With ");
			document.getElementsByName('workedWithArray')[row - 2].focus();
			return false;
		}
		if(document.getElementsByName('topicDissArray')[row - 2].value=="") {
			alert("Please Select Topic Of Discussion ");
			document.getElementsByName('topicDissArray')[row - 2].focus();
			return false;
		}
		if(document.getElementsByName('nxtVisitArray')[row - 2].value=="") {
			alert("Please give Next Visit Date ");
			document.getElementsByName('nxtVisitArray')[row - 2].focus();
			return false;
		}
		if(document.getElementsByName('remarksArray')[row - 2].value=="") {
			alert("Please give Remarks ");
			document.getElementsByName('remarksArray')[row - 2].focus();
			return false;
		}
	}
	
	
	return true;
}

</script>
</html>