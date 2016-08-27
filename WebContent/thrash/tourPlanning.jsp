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
		<script type="text/javascript" src="/maa/javascripts/user/test.js"></script>

    </head>
    
<body   onload="bodyonload();"  >



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
		  						<s:form theme="simple" name="userTourForm" method="post" action="/CreateUserTourPlan.action" enctype="multipart/form-data" onsubmit=" return validate();">
			
			<s:hidden name="userName" />
			
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
				<table border="1" width="100%" align="center" class="tableStyle">
					<tr>
						<td class="tablesubcaption" valign="bottom" align="left" width="25%" height="20">
							&nbsp; Select Tour Purpose
						</td>
						<td class="tablesubcaption" valign="bottom" align="left" width="25%" height="20">
							&nbsp; Tour Date(dd/mm/yyyy)
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
							<select name="tourPurpose" id="tourPurpose" class="ControlText" multiple="multiple" onchange="getSelectedValue();">
							    <option value=""
							    >--- Select ---</option>
							    <option value="1">Doc Appointment</option>
							    <option value="2">Out Station</option>
							    <option value="3">Chemist</option>
							    <option value="4">Collection</option>
							    							
							</select>
							<div id="selectedItem" style="font-size:10px"></div>
						</td>
																
						<td class="labelcell" valign="bottom" align="left" width="15%" height="20">
						<input type="text" name="tourDate" value="" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="tourDate" class="ControlText">
						<a href="javascript:show_calendar('userTourForm.tourDate');" >
							<img src="<%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
						</a>
						</td>
						
						<td class="labelcell" valign="bottom" align="left" width="25%" height="20">
							<input type="text" name="desc" id="desc" value="" class="ControlText"/>
						</td>

						<td class="button2" valign="bottom" align="center" width="25%" height="20">
							<input type="button" name="delRow" value="Delete Row" onclick="deleteRole(this)" />
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
/*	
	function SelectedItemsAre(){
		
		
		var sel = document.getElementsByName('tourPurpose');
		var sv = sel.value;
		alert(sv);
		
		
		
		alert("1St step");
		var selected=new Array(); 
		
		for(var i=0;i<4;i++)
			{alert("2nd step");
				selected[i] = document.getElementById("tourPurpose").value;
				alert(selected[i]);
			}
		
		var x = document.getElementById("tourPurpose");
		//alert(selected);
		document.getElementById('selectedItem').innerHTML = "<font color='green'>Selected Tour purpose are :</font>"selected;		
	};*/
	function getSelectedValue() {  
	    //var index = document.getElementById('tourPurpose').selectedIndex;  
	   // alert("value="+document.getElementById('tourPurpose').value);  
	   // alert("Purpose="+document.getElementById('tourPurpose').options[index].text);
	    
	    var fld = document.getElementById('tourPurpose');
	    var values = [];
	    for (var i = 0; i < fld.options.length; i++) {
	      if (fld.options[i].selected) {
	        values.push(fld.options[i].text);
	      }
	    }
	   // alert(values[0]);	
	    
	    document.getElementById('selectedItem').innerHTML = "<font color='green'>Selected Tour purpose are : <br></font>"+values;   
	    
	}
	

</script>
</html>