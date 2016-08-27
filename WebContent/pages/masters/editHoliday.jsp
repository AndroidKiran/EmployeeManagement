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
		<script type="text/javascript" src="/maa/javascripts/user/holiday.js"></script>

    </head>
    
<body>



<div class="commontopyellowbg">Holidays</div>
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
		  						<s:form theme="simple" name="editHolidayForm" method="post" action="/UpdateHoliday.action" enctype="multipart/form-data" onsubmit=" return validate();">
			
			<table align="center" class="tableStyle" width="100%">
				<tr>
				
					<td colspan=4>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="tableheader" valign="middle" align="center" colspan="2" height="26">
						Edit Holiday
						
					</td>
				</tr>
			</table>
			<br/>
			
				
			<fieldset style="border:1px solid gray;padding:5px;margin:5px">
				<legend>Edit Holiday</legend>			
				<table border="1" width="100%" align="center" class="tableStyle">
					<tr>
						<td class="tablesubcaption" valign="bottom" align="left" width="25%" height="20">
							&nbsp; Select Region
						</td>
						<td class="tablesubcaption" valign="bottom" align="left" width="25%" height="20">
							&nbsp; Date(dd/mm/yyyy)
						</td>
						<td class="tablesubcaption" valign="bottom" align="left" width="25%" height="20">
							&nbsp; Description
						</td>
					</tr>
				</table>
				<table width="100%" id="reason_table" class="tableStyle" border="1">
				<s:iterator value="editHolidayList">
					<s:hidden name="seq_no"></s:hidden>
					
				
					<tr id="reasonrow">
						<td class="labelcell" valign="bottom" align="left" width="25%" height="20">
							<s:select name="holidayRegion" value="%{holidayRegion}" id="holidayRegion" cssClass="ControlText" list="regionList" listKey="regId" listValue="regionName" headerKey="0" headerValue="--Select--"/>						
						</td>
						
						<td class="labelcell" valign="bottom" align="left" width="15%" height="20">
							<s:textfield name="holidayDate" value="%{holidayDate}" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="holidayDate" cssClass="ControlText"/>
						<a href="javascript:show_calendar('editHolidayForm.holidayDate');" >
							<img src="<%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
						</a>
						</td>
						
						<td class="labelcell" valign="bottom" align="left" width="25%" height="20">
							<s:textfield name="holidayDesc" id="holidayDesc" value="%{holidayDesc}" class="ControlText"/>
						</td>
					</tr>
					</s:iterator>
				</table>
				</fieldset>
				<br/>
				<table align="center" class="tableStyle" width="100%">
					<tr>
						<td align="center" valign="bottom" height="20">
							<br/>
							<s:submit value="Update" style="font-size:12px"/>
							<!-- input type="submit" value="Create" style="font-size:12px" -->
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


</html>