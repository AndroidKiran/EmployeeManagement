

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
        <link rel="icon" href="/maa/images/favicon.ico"/>
        <title>rx  - Product Search</title>

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
				document.getElementById('empId').value="";
				document.getElementById('fromDateAd').value="";
			}
			function checkEmpty() {
				if((document.getElementById('empId').value=="") && (document.getElementById('fromDateAd').value==""))
					{
						alert("Please give atleast one criterion to search");
						return false;
					}
				else return true;
			}
			
		</script>
    </head>
    
<body onload="bodyonload()">
	

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
				
		  					<div align="center">
		  						<s:form name="searchDCRAdmin" method="post" theme="simple" >
			<table align="center" id="getAllDetails" name="getAllDetails">
				<tr><td>
					<table align="center" class="tableStyle">
						<tr>
							<td class="tableheader" align="middle" width="728" height="6">Search Tour Plan</td>
						</tr>
						<tr>
							<td colspan="4">&nbsp;</td>
						</tr>
					</table>
				</td></tr>
				<tr><td>	<br/><br/> </td></tr>
				
				<tr><td>
					<table align="center"  class="tableStyle">
						
						<tr>
							<td  class="labelcell" width="40%" height="23" >Select User Name<font class="ErrorText">*</font></td>
							<td  class="labelcell" align="left" width="40%" height="23" >
								<s:select theme="simple" name="empId" id="empId" class="ControlText" list="userList" listKey="empId" listValue="userName" headerKey="" headerValue="--Select--"/>
							</td>				
						
							<td  class="labelcell" width="40%" height="23" >DCR Date<font class="ErrorText">*</font></td>
							<td class="labelcell" valign="bottom" align="left" width="15%" height="20">
								<input type="text" name="tourDate" value="" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="fromDateAd" class="ControlText">
								<a href="javascript:show_calendar('searchDCRAdmin.fromDateAd');" >
									<img src="<%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
								</a>
							</td>
							
							<!-- 
							<td  class="labelcell" width="40%" height="23" >To Date<font class="ErrorText">*</font></td>
							<td class="labelcell" valign="bottom" align="left" width="15%" height="20">
								<input type="text" name="toDate" value="" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="toDateAd" class="ControlText">
								<a href="javascript:show_calendar('searchTPAdmin.toDate');" >
									<img src="<//%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
								</a>
							</td> -->
						</tr>
					</table>
			  </td></tr>
				
				<tr><td> <br/><br/> </td></tr>
				
				<tr><td>
					<table align="center" class="tableStyle" cellspacing="2">
						<tr>
							<td>
								<input type="button" name="submitButton" id="submitButton" value="Search" onclick="return validateSearchDCRandSubmit();">
							</td>
							<td>&nbsp;&nbsp;&nbsp;</td>
							<td>
							<input type="button" value="CLOSE" id="closeButton" name="closeButton" onclick="window.close();" />
							</td>					
						</tr>			
					</table>
				</td></tr>
				
				<tr><td><br/><br/> </td></tr>
				<tr><td align="center">
					<font color="red" size="2px"><s:property value="%{ErrorMsg}" /></font> 
				</td></tr>
				<tr><td>
					<s:if test="%{dcrListAdmin!=null}">
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
					
					<s:iterator value="dcrListAdmin">
						<s:hidden name="seq_no" value="%{seq_no}" id="res"/>
						<tr id="reasonrow">
							<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
								<s:textfield name="tourDateArray" value="%{tourDate}" size="10" id="tourDateArray" cssClass="ControlText" />
							</td>
							<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
								<s:select name="timeArray" id="timeArray" value="%{time}" cssClass="ControlText" list="timeListAdmin" listKey="timeId" listValue="time" headerKey="" headerValue="--Select Time--" />
							</td>
							<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
								<s:select name="descArrayForDoc" id="descArrayForDoc" value="%{descDoc}" cssClass="ControlText" list="docListAdmin" listKey="doc_id" listValue="doctor_name" headerKey="" headerValue="--Select Doctor--" />
							</td>
							<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
								<s:select name="descArrayForChem" id="descArrayForChem" value="%{descChem}" cssClass="ControlText" list="chemListAdmin" listKey="chemist_id" listValue="chemist_name" headerKey="" headerValue="--Select Chemist--" />
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
								<s:textfield name="nxtVisitArray" id="nxtVisitArray" value="%{nxtVisit}" size="10" cssClass="ControlText" />
							</td>
							<td class="labelcell" valign="bottom" align="center" width="15%" height="20">
								<s:textarea name="remarksArray" value="%{remarks}" id="remarksArray" rows="3" cols="12" cssClass="ControlText" />
							</td>
							<td class="labelcell" valign="bottom" align="center" width="10%" height="20">
								<s:textfield name="createdDate" value="%{createdDateStr}" size="10" id="createdDate" cssClass="ControlText" />
							</td>
						</tr>
					</s:iterator>
				</table>
				</fieldset>
				</s:if>
									</td></tr></table>
				
								</s:form>
							</div>
						
			</td>
		</tr>
	</table>
</body>
<script type="text/javascript">
	

	
	function validateSearchDCRandSubmit(){

		if(checkEmpty()){
			document.searchDCRAdmin.action='/maa/searchDCRAdmin';
			document.searchDCRAdmin.submit();
		}
	}
	
	/*function restrictAccess(){
		
		alert("You do not have permission to click");
		document.getElementById('res').onkeypress=function(){return false;}
		//return false;
	}*/
	
</script>
</html>