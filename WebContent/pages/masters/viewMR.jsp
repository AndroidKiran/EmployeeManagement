

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
        <title>rx  - Edit MR </title>

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
        
        function bodyonload(){				//to preselect the double list
        	
        	var list = document.getElementById("ter_id");
        	for (var i = 0; i < list.options.length; i++) 
        	  {
        	   //alert(list.options[i].value)
        	   list.options[i].selected = true;
         	 }
        	return true;
        }
		</script>
    </head>
    
<body onload="bodyonload();" >
	

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
		  						<s:form theme="simple" name="viewMrForm" method="post" >
			<table align="center" id="getAllDetails" name="getAllDetails">
				<tr><td>
					<table align="center" class="tableStyle">
						<tr>
							<td class="tableheader" align="middle" width="728" height="6">Employee Details</td>
						</tr>
						<tr>
							<td colspan="4">&nbsp;</td>
						</tr>
					</table>
				</td></tr>
				<tr><td><br/><br/></td></tr>
				<tr><td>
					<table align="center"  class="tableStyle">
						<s:iterator value="mrEditList" var="cont" status="stat">	
							<s:hidden name="seq_no"/>
						<tr>
							<td  class="labelcell" width="40%" height="23" >Employee Name<font class="ErrorText">*</font></td>
							<td  class="labelcell" align="left" width="40%" height="23" >
								<s:textfield name="emp_name" value="%{emp_name}" id="emp_name" class="ControlText" readonly="true"/>
							</td>				
						
							<td class="labelcell"  width="40%" height="23" >Designation</td>
							<td class="labelcell"  align="left" width="40%" height="23" >
								<s:select theme="simple" name="dsg_id" value="%{dsg_id}" id="dsg_id" list="dsgnList" listKey="dsgId" listValue="dsgName" headerKey="" headerValue="--Select--" cssClass="ControlText" disabled="true"/>
							</td>
							<td class="labelcell"  width="40%" height="23" >Employee ID</td>
							<td class="labelcell"  align="left" width="40%" height="23" >
								<s:textfield name="emp_id" value="%{emp_id}" id="emp_id" class="ControlText" readonly="true"/>
							</td>
						</tr>
						
						<tr>
							<td  class="labelcell" width="40%" height="23" >Date Of Birth<font class="ErrorText">*</font></td>
							<td class="labelcell" valign="bottom" align="left" width="15%" height="20">
								<s:textfield name="dob" value="%{dob}" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="dob" class="ControlText" readonly="true"/>
								<a href="javascript:show_calendar('mr.dob');" >
									<img src="<%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
								</a>
							</td>
							
							<td  class="labelcell" width="40%" height="23" >Date Of Joining<font class="ErrorText">*</font></td>
							<td class="labelcell" valign="bottom" align="left" width="15%" height="20">
								<s:textfield name="doj" value="%{doj}" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="doj" class="ControlText" readonly="true"/>
								<a href="javascript:show_calendar('mr.doj');" >
									<img src="<%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
								</a>
							</td>								
						
							<td class="labelcell"  width="40%" height="23" >Blood Group</td>
							<td class="labelcell"  align="left" width="40%" height="23" >
								<s:select theme="simple" name="blood_grp_id" id="blood_grp_id" value="%{blood_grp_id}" class="ControlText" list="bloodGrpList" listKey="bloodGrpId" listValue="bloodGrpName" headerKey="" headerValue="--Select--"/>
							</td>					
						</tr>
						
						<tr>
							<td  class="labelcell" width="40%" height="23" >City<font class="ErrorText">*</font></td>
							<td  class="labelcell" align="left" width="40%" height="23" >
								<s:select theme="simple" name="city_id" value="%{city_id}" id="city_id" cssClass="ControlText" list="cityList" listKey="cityId" listValue="cityName" headerKey="" headerValue="--Select--" disabled="true"/>
							</td>				
						
							<td class="labelcell"  width="40%" height="23" >State</td>
							<td class="labelcell"  align="left" width="40%" height="23" >
								<s:select theme="simple" name="state_Id" value="%{state_Id}" id="state_Id" cssClass="ControlText" list="stateList" listKey="stateId" listValue="stateName" headerKey="" headerValue="--Select--" disabled="true"/>
							</td>
							<td  class="labelcell" width="40%" height="23" >Contact Number<font class="ErrorText">*</font></td>
							<td  class="labelcell" align="left" width="40%" height="23" >
								<s:textfield name="contact_no" value="%{contact_no}" id="contact_no" class="ControlText" onkeyup="validatePhoneNumber();" readonly="true"/>
							</td>
						</tr>
						
						<tr>
							<td class="labelcell"  width="40%" height="23" >Emergency Contact Number</td>
							<td class="labelcell"  align="left" width="40%" height="23" >
								<s:textfield name="emg_contact_no" value="%{emg_contact_no}" id="emg_contact_no" class="ControlText" onkeyup="validateEmgPhoneNumber();" readonly="true"/>
							</td>
							<td  class="labelcell" width="40%" height="23" >Address Line 1<font class="ErrorText">*</font></td>
							<td  class="labelcell" align="left" width="40%" height="23" >
								<s:textfield name="address_1" value="%{address_1}" id="address_1" class="ControlText" readonly="true"/>
							</td>
							<td class="labelcell"  width="40%" height="23" >Address Line 2</td>
							<td class="labelcell"  align="left" width="40%" height="23" >
								<s:textfield name="address_2" value="%{address_2}" id="address_2" class="ControlText" readonly="true"/>
							</td>
						</tr>
						
						<tr>
							<td class="labelcell"  width="40%" height="23" >Email ID</td>
							<td class="labelcell"  align="left" width="40%" height="23" >
								<s:textfield name="email_id" value="%{email_id}" id="email_id" class="ControlText" onblur="validateEmailAddress(this);" readonly="true"/>
							</td>	
							<td class="labelcell"  width="40%" height="23" >Is Active</td>
							<td class="labelcell"  align="left" width="40%" height="23" >
								<s:checkbox name="active" value="%{active}" id="active" class="ControlText" disabled="true"/>
							</td>	
						</tr>
						</s:iterator>
					</table>
				</td></tr>
				<tr><td>
					<table>
						<s:iterator value="mrEditList" var="cont" status="stat">
						<tr>
							<td class="labelcell"  width="40%" height="23" >Territory </td>
							
							<td class="labelcell"  align="left" width="40%" height="23">
								<s:optiontransferselect name="ter_idList" id="ter_idList" label="Select Territory" cssClass="ControlText" list="territoryListValueRemoved" listKey="ter_id" listValue="territory" value="" size="5" doubleName="ter_id" doubleId="ter_id" doubleList="territoryListValueInEdit" doubleValue="terrValues" doubleListKey="ter_id" doubleListValue="territory" doubleSize="" leftTitle="List OF Territory" rightTitle="Selected Territory" allowSelectAll="false" allowUpDownOnLeft="false" allowUpDownOnRight="false" allowAddAllToLeft="false" doubleMultiple="true" allowAddAllToRight="false" doubleCssClass="ControlText" addToRightLabel="'>>'" addToLeftLabel="'<<'" disabled="true" doubleDisabled="true"/>
							</td>
						</tr>
						</s:iterator>
					</table>
				</td></tr>
			<br/><br/>
				<tr><td>
					<table align="center" class="tableStyle" cellspacing="2">
						<tr>
							<td>
								<input type="button" value="CLOSE" id="closeButton" name="closeButton" onclick="window.close();" />
							</td>	
							<td>&nbsp;&nbsp;</td>
							<td>
								<input type="button" value="EDIT" id="button" name="Submit" onclick="return editMR();"/>
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
<script type="text/javascript">
	function editMR(){
		
		document.viewMrForm.action='/maa/editMR';
		document.viewMrForm.submit();
	}
</script>
</html>
