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
    
<body   onload="bodyonload();"  >



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
		  						<s:form theme="simple" name="holidayForm" method="post" action="/CreateHoliday.action" enctype="multipart/form-data" onsubmit=" return validateHoliday();">
			
			<table align="center" class="tableStyle" width="100%">
				<tr>
				
					<td colspan=4>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="tableheader" valign="middle" align="center" colspan="2" height="26">
						Create Holidays
						
					</td>
				</tr>
			</table>
			<br/>
			
				
			<fieldset style="border:1px solid gray;padding:5px;margin:5px">
				<legend>Enter Holiday</legend>			
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
						<td class="button2" colspan="2" align="center">
							<input type=button  name="addRow" value="Add Row" onclick="addRole();" />
						</td>
					</tr>
				</table>
				<table width="100%" id="reason_table" class="tableStyle" border="1">
					<tr id="reasonrow">
						<td class="labelcell" valign="bottom" align="left" width="25%" height="20">
							<s:select name="holidayRegionArr" id="holidayRegionArr" cssClass="ControlText" list="regionList" listKey="regId" listValue="regionName" headerKey="" headerValue="--Select--"/>						
						</td>
						
						<td class="labelcell" valign="bottom" align="left" width="15%" height="20">
						<input type="text" name="holidayDateArr" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="holidayDateArr" class="ControlText">
						<a href="javascript:show_calendar('holidayForm.holidayDateArr');" >
							<img src="<%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
						</a>
						</td>
						
						<td class="labelcell" valign="bottom" align="left" width="25%" height="20">
							<input type="text" name="holidayDescArr" id="holidayDescArr" class="ControlText"/>
						</td>

						<td class="button2" valign="bottom" align="center" width="25%" height="20">
							<input type="button" name="delRow" value="Delete Row" onclick="deleteRole(this)" />
						</td>

						
					</tr>
				</table>
				</fieldset>
				<br/>
				<table align="center" class="tableStyle" width="100%">
					<tr align="center">
						<td align="center" valign="bottom" height="20">
							<br/>
							<s:submit value="Create" style="font-size:12px"/>
							<!-- input type="submit" value="Create" style="font-size:12px" -->
						</td>
						
						<td align="left" valign="bottom" height="20">
							<input type="button" value="Search" style="font-size:12px" onclick=" return searchHoliday();">
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
								<td class="tablesubcaption" valign="bottom" align="left" width="10%" height="20">
									<table border="1" width="20%" align="center" class="tableStyle">
					            		<tbody>
						            		<tr>						            		
								             	<td class="tablesubcaption" valign="bottom" align="left" width="2%" height="2%">Edit </td>
								             	<td class="tablesubcaption" valign="bottom" align="left" width="2%" height="2%"><img src="/maa/images/page_edit.png" alt="Edit Data"  border="0" width="16" height="16"></td>
						             		&nbsp;
						             			<td class="tablesubcaption" valign="bottom" align="left" width="2%" height="2%">Delete </td>
								             	<td class="tablesubcaption" valign="bottom" align="left" width="2%" height="2%"><img src="/maa/images/delete.png" alt="Delete Data"  border="0" width="16" height="16"></td>
						             		</tr>
					             		</tbody>
		                                                                                                  
		             				</table>
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
									<td class="tablesubcaption" valign="bottom" align="left" width="10%" height="20">
						            	<table border="1" width="20%" align="center" class="tableStyle">
						            		<tbody><tr>
						            			
						            			<!-- Make an action for edit and Delete, here it is editHoliday and deleteHoliday-->
								             	<td class="tablesubcaption" valign="bottom" align="left" width="2%" height="2%"><a href="/maa/editHoliday?seq_no=<s:property value="seq_no"/>&amp;mode=edit">Edit </a></td>
								             	<td class="tablesubcaption" valign="bottom" align="left" width="2%" height="2%"><a href="/maa/editHoliday?seq_no=<s:property value="seq_no"/>&amp;mode=edit"><img src="/maa/images/page_edit.png" alt="Edit Data"  border="0" width="16" height="16"></a></td>
						             		&nbsp;
								             	<td class="tablesubcaption" valign="bottom" align="left" width="2%" height="2%"><a href="/maa/deleteHoliday?seq_no=<s:property value="seq_no"/>&amp;mode=delete">Delete</a></td>
								             	<td class="tablesubcaption" valign="bottom" align="left" width="2%" height="2%"><a href="/maa/deleteHoliday?seq_no=<s:property value="seq_no"/>&amp;mode=delete"><img src="/maa/images/delete.png" alt="Delete Data"  border="0" width="16" height="16"></a></td>
						             		</tr>
						             		</tbody>
						                                                                                                  
						             	 </table>
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
	function searchHoliday()
	{
		document.holidayForm.action='/maa/searchHoliday';
		document.holidayForm.submit();
	}

	function addRole() {
		var row = document.getElementById("reason_table").rows.length;
		if (row == 1) {
			
			if (document.getElementById('holidayRegionArr').value == "") {
				alert("Please select Region ");
				document.getElementById('holidayRegionArr').focus();
				return false;
			}
			if (document.getElementById('holidayDateArr').value == "") {
				alert("Please enter Holiday Date");
				document.getElementById('holidayDateArr').focus();
				return false;
			}
		} else {
			if (row > 1) {
				alert("1");
				if (document.getElementsByName('holidayRegionArr')[row - 1].value == "") {
					alert("Please select Region");
					document.getElementsByName('holidayRegionArr')[row - 1].focus();
					return false;
				}
				if (document.getElementsByName('holidayDateArr')[row - 1].value == "") {
					alert("Please enter Holiday Date");
					document.getElementsByName('holidayDateArr')[row - 1].focus();
					return false;
				}
			}
		}
		var tbl = document.getElementById("reason_table");
		var tbody = tbl.tBodies[0];
		var lastRow = tbl.rows.length;
		var rowObj = document.getElementById("reasonrow").cloneNode(true);
		tbody.appendChild(rowObj);
		document.getElementsByName('holidayRegionArr')[lastRow].value = "";
		document.getElementsByName('holidayDateArr')[lastRow].value = "";
		document.getElementsByName('holidayDescArr')[lastRow].value = "";
		
	}
	
	function validateHoliday() {
		
		var row = document.getElementById("reason_table").rows.length;
			if (document.getElementsByName('holidayRegionArr')[row - 1].value == "") {
				alert("Please select Region");
				document.getElementsByName('holidayRegionArr')[row - 1].focus();
				return false;
			}
			
			if (document.getElementsByName('holidayDateArr')[row - 1].value == "") {
				alert("Please enter Holiday Date");
				document.getElementsByName('holidayDateArr')[row - 1].focus();
				return false;
			}
			if (document.getElementsByName('holidayDescArr')[row - 1].value == "") {
				alert("Please enter Holiday Description");
				document.getElementsByName('holidayDescArr')[row - 1].focus();
				return false;
			}
			
			if (document.getElementById('holidayRegionArr') != "") {
				if (document.getElementById('holidayDateArr').value == "") {
					alert("Please enter Holiday Date");
					document.getElementById('holidayDateArr').focus();
					return false;
				}
		}
	}
	function deleteRole(obj) {
		var tbl = document.getElementById("reason_table");
		var rowNumber = getRow(obj).rowIndex;
		var rowo = tbl.rows.length;
		if (rowo <= 1) {
			alert("This row can not be deleted");
			return false;
		} else {
			tbl.deleteRow(rowNumber);
			return true;
		}
	}
	
	function bodyonload() {
		document.getElementById('holidayRegion').value = "";
		document.getElementById('holidayDate').value = "";
		document.getElementById('holidayDesc').value = "";

	}

	function trimText1(obj, value) {
		value = value;
		if (value != undefined) {
			while (value.charAt(value.length - 1) == " ") {
				value = value.substring(0, value.length - 1);
			}
			while (value.substring(0, 1) == " ") {
				value = value.substring(1, value.length);
			}
			obj.value = value;
		}
		return value;
	}

</script>
</html>