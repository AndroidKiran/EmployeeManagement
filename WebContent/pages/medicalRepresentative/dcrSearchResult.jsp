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
		  						<s:form theme="simple" name="searchDCRForm" method="post" action="/ReopenDCR.action" enctype="multipart/form-data" >
			
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
			
				
				<!-- 
					After Search Result of DCR
				 -->
				<s:if test="%{dcrListAfterSearch!=null}">
					<fieldset style="border:1px solid gray;padding:5px;margin:5px">
					<legend>Created DCR</legend>			
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
								&nbsp; Created Date
							</td>
						</tr>
					
					<s:iterator value="dcrListAfterSearch">
						<s:hidden name="seq_no" value="%{seq_no}"/>
						<tr id="reasonrow">
							<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
								<s:textfield name="tourDateArray" value="%{tourDate}" size="10" id="tourDateArray" cssClass="ControlText"/>
							</td>
							<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
								<s:select name="timeArray" id="timeArray" value="%{time}" cssClass="ControlText" list="timeList" listKey="timeId" listValue="time" headerKey="" headerValue="--Select Time--" />
							</td>
							<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
								<s:select name="descArrayForDoc" id="descArrayForDoc" value="%{descDoc}" cssClass="ControlText" list="docListCurr" listKey="doc_id" listValue="doctor_name" headerKey="" headerValue="--Select Doctor--" />
							</td>
							<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
								<s:select name="descArrayForChem" id="descArrayForChem" value="%{descChem}" cssClass="ControlText" list="chemistListCurr" listKey="chemist_id" listValue="chemist_name" headerKey="" headerValue="--Select Chemist--" />
							</td>
							<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
								<s:select name="workTypeArray" id="workTypeArray" value="%{workType}" cssClass="ControlText" list="workTypeList" listKey="workTypeId" listValue="workTypeName" headerKey="" headerValue="--Select Work-Type--" />
							</td>
							<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
								<s:select name="workedWithArray" id="workedWithArray" value="%{workedWith}" cssClass="ControlText" list="workedWithList" listKey="dsgId" listValue="dsgName" headerKey="" headerValue="--Select Designation--" />
							</td>
							<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
								<s:select name="topicDissArray" id="topicDissArray" value="%{topicDiss}" cssClass="ControlText" list="topicDiscussionList" listKey="topicId" listValue="topicName" headerKey="" headerValue="--Select Topic--" />
							</td>
							<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
								<s:textfield name="nxtVisitArray" id="nxtVisitArray" value="%{nxtVisit}" size="10" cssClass="ControlText"/>
							</td>
							<td class="labelcell" valign="bottom" align="center" width="15%" height="20">
								<s:textarea name="remarksArray" value="%{remarks}" id="remarksArray" rows="3" cols="12" cssClass="ControlText"/>
							</td>
							<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
								<s:textfield name="createdDate" value="%{createdDateStr}" size="10" id="createdDate" cssClass="ControlText"/>
							</td>
						</tr>
					</s:iterator>
				</table>
				</fieldset>
				</s:if>
				
				<table align="center" class="tableStyle" width="100%">
					<tr>
						<td align="center" valign="bottom" height="20">
							<br/>
							<!-- <s:submit name="submit" value="Back"/> -->
							<input type="button" value="Close" id="closeButton" name="closeButton" onclick="window.close();">
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
/*function goToDCR()
{
	document.searchDCRForm.action='/maa/ReopenDCR';
	document.searchDCRForm.submit();
}*/
</script>

</html>