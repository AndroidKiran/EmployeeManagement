

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.masters.AddTerritoryActionPojo" %>

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
        <title>rx  - MR Details </title>

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
				document.getElementById('emp_name').value="";
				document.getElementById('dsg_id').value="";
				document.getElementById('emp_id').value="";
				document.getElementById('dob').value="";
				document.getElementById('doj').value="";
				document.getElementById('city_id').value="";
				document.getElementById('state_Id').value="";
				document.getElementById('email_id').value="";
				document.getElementById('emg_contact_no').value="";
				document.getElementById('address_1').value="";
				document.getElementById('ter_id').value="";
				document.getElementById('division_id').value="";
				document.getElementById('contact_no').value="";
				document.getElementById('blood_grp_id').value="";
				
			}

			function validation() {
				
				if(document.getElementById('address_1').value=="") {
					alert("Please enter Address");
					document.getElementById('address_1').focus();
					return false;
				}
				if(document.getElementById('contact_no').value=="") {
					alert("Please enter Contact Number");
					document.getElementById('contact_no').focus();
					return false;
				}
				if(document.getElementById('emg_contact_no').value=="") {
					alert("Please enter Emergency Contact Number");
					document.getElementById('emg_contact_no').focus();
					return false;
				}
				if(document.getElementById('email_id').value=="") {
					alert("Please enter Email Id");
					document.getElementById('email_id').focus();
					return false;
				}
				if(document.getElementById('state_Id').value=="") {
					alert("Please enter State of Residence");
					document.getElementById('state_Id').focus();
					return false;
				}
				if(document.getElementById('city_id').value=="") {
					alert("Please Select City of Residence");
					document.getElementById('city_id').focus();
					return false;
				}
				if(document.getElementById('doj').value=="") {
					alert("Please enter Date of Joining");
					document.getElementById('doj').focus();
					return false;
				}
				if(document.getElementById('dob').value=="") {
					alert("Please enter Date of Birth");
					document.getElementById('dob').focus();
					return false;
				}
				if(document.getElementById('dsg_id').value=="") {
					alert("Please enter a Designation Id");
					document.getElementById('dsg_id').focus();
					return false;
				}
				if(document.getElementById('blood_grp_id').value=="") {
					alert("Please enter Blood Group");
					document.getElementById('blood_grp_id').focus();
					return false;
				}

				
				if(document.getElementById('emp_name').value=="") {
					alert("Please enter a Employee Name");
					document.getElementById('emp_name').focus();
					return false;
				}
				if(!isNaN(document.getElementById('emp_name').value)) {
					alert("Employee Name can not be a numeric value.");
					document.getElementById('emp_name').value="";
					document.getElementById('emp_name').focus();
					return false;
				}
				
				/*
				    var oDDL = document.getElementById(ter_id);
				    
				    alert("Check");
				    
				    if (!oDDL) {
				        alert("No such element: " + ter_id);
				        return;
				    }
				    for (var i = 0; i < oDDL.options.length; i++) {
				        if (oDDL.options[i].value.length > 0) {
				            oDDL.selectedIndex = i;
				            if (oDDL.change)
				                oDDL.change();
				            else if (oDDL.onchange)
				                oDDL.onchange();
				        }
				    }
				   */
				    if(document.getElementById('ter_id').value=="") {
						alert("Please Select Territory");
						document.getElementById('ter_id').focus();
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
		  						<s:form theme="simple" name="mr" method="post" onsubmit="return validation()"><div><input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="cd26b486fa21a3d69bf8bf3fa6505400"></div>
			<table align="center" id="getAllDetails" name="getAllDetails">
				<table align="center" class="tableStyle">
					<tr>
						<td class="tableheader" align="middle" width="728" height="6">Employee Details</td>
					</tr>
					<tr>
						<td colspan="4">&nbsp;</td>
					</tr>
			</table>
			<br/><br/>
			<table align="center"  class="tableStyle">
				
				<tr>
					<td  class="labelcell" width="40%" height="23" >Employee Name<font class="ErrorText">*</font></td>
					<td  class="labelcell" align="left" width="40%" height="23" >
						<input type="text" name="emp_name" value="" id="emp_name" class="ControlText">
					</td>				
				
					<td class="labelcell"  width="40%" height="23" >Designation</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<s:select theme="simple" name="dsg_id" value="" id="dsg_id" list="dsgnList" listKey="dsgId" listValue="dsgName" headerKey="" headerValue="--Select--" cssClass="ControlText"/>
					</td>
					<td class="labelcell"  width="40%" height="23" >Employee ID</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<input type="text" value="Auto-Generated" class="ControlText" readonly="readonly">
						<input type="hidden" name="emp_id" value="" id="emp_id" class="ControlText" readonly="readonly">
					</td>
				</tr>
				
				<tr>
					<td  class="labelcell" width="40%" height="23" >Date Of Birth<font class="ErrorText">*</font></td>
					<td class="labelcell" valign="bottom" align="left" width="15%" height="20">
						<input type="text" name="dob" value="" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="dob" class="ControlText">
						<a href="javascript:show_calendar('mr.dob');" >
							<img src="<%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
						</a>
					</td>
					
					<td  class="labelcell" width="40%" height="23" >Date Of Joining<font class="ErrorText">*</font></td>
					<td class="labelcell" valign="bottom" align="left" width="15%" height="20">
						<input type="text" name="doj" value="" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="doj" class="ControlText">
						<a href="javascript:show_calendar('mr.doj');" >
							<img src="<%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
						</a>
					</td>								
				
					<td class="labelcell"  width="40%" height="23" >Blood Group</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<s:select theme="simple" name="blood_grp_id" id="blood_grp_id" class="ControlText" list="bloodGrpList" listKey="bloodGrpId" listValue="bloodGrpName" headerKey="" headerValue="--Select--"/>
					</td>					
				</tr>
				
				<tr>
					<td  class="labelcell" width="40%" height="23" >City<font class="ErrorText">*</font></td>
					<td  class="labelcell" align="left" width="40%" height="23" >
						<s:select theme="simple" name="city_id" value="" id="city_id" cssClass="ControlText" list="cityList" listKey="cityId" listValue="cityName" headerKey="" headerValue="--Select--"/>
					</td>				
				
					<td class="labelcell"  width="40%" height="23" >State</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<s:select theme="simple" name="state_Id" value="" id="state_Id" cssClass="ControlText" list="stateList" listKey="stateId" listValue="stateName" headerKey="" headerValue="--Select--"/>
					</td>
					
					<td  class="labelcell" width="40%" height="23" >Contact Number<font class="ErrorText">*</font></td>
					<td  class="labelcell" align="left" width="40%" height="23" >
						<input type="text" name="contact_no" value="" id="contact_no" class="ControlText" onkeyup="validatePhoneNumber();">
					</td>	
				</tr>
				
				<tr>
					<td class="labelcell"  width="40%" height="23" >Emergency Contact Number</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<input type="text" name="emg_contact_no" value="" id="emg_contact_no" class="ControlText" onkeyup="validateEmgPhoneNumber();" >
					</td>
					
					<td  class="labelcell" width="40%" height="23" >Address Line 1<font class="ErrorText">*</font></td>
					<td  class="labelcell" align="left" width="40%" height="23" >
						<input type="text" name="address_1" value="" id="address_1" class="ControlText">
					</td>
					
					<td class="labelcell"  width="40%" height="23" >Address Line 2</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<input type="text" name="address_2" value="" id="address_2" class="ControlText">
					</td>
				</tr>
				
				<tr>
					<td class="labelcell"  width="40%" height="23" >Email ID</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<input type="text" name="email_id" value="" id="email_id" class="ControlText" onblur="validateEmailAddress(this);">
					</td>	
					
					<td class="labelcell"  width="40%" height="23" >Region</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<s:select theme="simple" name="regionId" value="" id="regionId" cssClass="ControlText" list="regionList" listKey="regId" listValue="regionName" headerKey="" headerValue="--Select--"/>
					</td>
					
					<td class="labelcell"  width="40%" height="23" >Is Active</td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<s:checkbox name="active" value="" id="active" class="ControlText" checked="checked"/>
					</td>				
				</tr>
			</table>
			
			<table align="center"  class="tableStyle">
				
				<tr>
					<td class="labelcell"  width="40%" height="23" >Territory </td>
					
<!-- 					
					<td class="labelcell"  align="left" width="40%" height="23">
						<s:select theme="simple" id="mstrList" cssClass="ControlText" list="territoryList" listKey="ter_id" listValue="territory" headerKey="" headerValue="---Select---" onchange="getSelected(this.value)"/>
					</td>
					<td class="labelcell"  align="left" width="40%" height="23">
						<s:select theme="simple" name="ter_id" id="ter_id" cssClass="ControlText" size="5" list="territoryList" listKey="ter_id" listValue="" multiple="true" ondblclick="removeSelected(this.value)"/>
					</td>
-->				
					<td class="labelcell"  align="left" width="40%" height="23">
						<s:optiontransferselect name="ter_idList" id="ter_idList" label="Select Territory" cssClass="ControlText" list="territoryList" listKey="ter_id" listValue="territory" size="5" doubleName="ter_id" doubleId="ter_id" doubleList="" doubleSize="" leftTitle="List OF Territory" rightTitle="Selected Territory" allowSelectAll="false" allowUpDownOnLeft="false" allowUpDownOnRight="false" allowAddAllToLeft="false" doubleMultiple="true" allowAddAllToRight="false" doubleCssClass="ControlText" addToRightLabel="'>>'" addToLeftLabel="'<<'" />
					</td>
					
					
					
					
					
					
					
					
				<!-- 
					<td class="labelcell"  align="left" width="40%" height="23">
						<table align="center"  class="tableStyle">
							<tr>
								<td>
									<input type="button" value=">>" id="add" onclick="return addTerritory();"/>
								</td>
							</tr>
							<tr>
								<td>
									<input type="button" value="<<" id="remove" onclick="return removeTerritory();"/>
								</td>
							</tr>
						</table>
					</td>
				 -->
			<!-- 		<td>
						<s:textarea name="ter_id" id="ter_id" cssClass="ControlText"></s:textarea>
					</td>
			 -->	</tr>
			</table>
			
			<br/><br/>
			<table align="center" class="tableStyle" cellspacing="2">
				<tr>
					<td>
						<input type="button" value="SAVE" id="button" name="Submit" onclick="return addMR();"/>
					</td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td>
						<input type="button" value="CLEAR" id="button" name="clear" onclick="this.form.reset();"/>
					</td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td>
						<input type="button" value="CLOSE" id="closeButton" name="closeButton" onclick="window.close();" />
					</td>		
					<td>&nbsp;&nbsp;&nbsp;</td>	
					<td>
						<input type="button" value="Import Excel" id="importExcel" name="importExcel" onclick="return showUploader();" />
					</td>			
				
				</tr>			
			</table>
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

function selectAll()
{
	var list = document.getElementById("ter_id");
	for (var i = 0; i < list.options.length; i++) 
	  {
	   //alert(list.options[i].value)
	   list.options[i].selected = true;
 	 }
	return true;
	
	//IMPORTAINT	IMPORTAINT	IMPORTAINT	IMPORTAINT	IMPORTAINT	IMPORTAINT	IMPORTAINT	
	
	/* If the selectAll function is called on submit then add the below code
	var form = document.getElementById("right");
	form.submit();
	     return true;
	*/
}

	/*  JQUERY for two select tag----> to transfer item from first select to another select 
    
    var selectedId = document.getElementById('mstrList')
    , selectedTer_id = document.getElementById('ter_id')
    , option;

    selectedId.onchange = function() { 
    option = document.createElement('option');
    option.value = this.value;
    option.text = this.options[this.selectedIndex].text;
    option.selected = true;
    ter_id.appendChild(option);
    
    selectedId.removeChild(this.options[this.selectedIndex]);  
  };
  
    var selectedId1 = document.getElementById('ter_id')
    , selectedTer_id = document.getElementById('mstrList')
    , option;

    selectedId1.ondblclick = function() { 
    option = document.createElement('option');
    option.value = this.value;
    option.text = this.options[this.selectedIndex].text;
    mstrList.appendChild(option);
    selectedId1.removeChild(this.options[this.selectedIndex]);  
  };
   
  */
  
/*function addTerritory(){
	
	var x=document.getElementById('mstrList');
	
	 //List<AddTerritoryActionPojo> selectedTerritoryList = new ArrayList<AddTerritoryActionPojo>();
	
	alert(x);
	 var values = [];
	    for (var i = 0; i < x.options.length; i++) {
	      if (x.options[i].selected) {
	        values.push(x.options[i].text);
	        //selectedTerritoryList.
	      }
	    }
	    alert("values --> "+values);
	    
	    document.getElementsByName('ter_id').value = ""+values;   
	
}*/

function addMR()
{
	//alert("Before Select All Method");
	selectAll();
	//alert("After Select All Method");
	
	if(validation()){	
	document.mr.action='/maa/addMR';
	document.mr.submit();
	}
	else return false;
}
function validateEmailAddress(obj){
	//alert("In validateEmailAddress");
	 var emailStr=obj.value;
	 var objRegExp  = /^[a-z0-9]([a-z0-9_\-\.]*)@([a-z0-9_\-\.]*)(\.[a-z]{2,3}(\.[a-z]{2}){0,2})$/i;
	 
	 var check = objRegExp.test(emailStr);
	 if(check){
		 //alert("In if-->check");
		 return true;
	 }
	 else{
		 alert("Please Enter a valid Email ID");
		 document.getElementById('email_id').value="";
		 document.getElementById('email_id').focus();
		 return false;
	 }
}
function validatePhoneNumber(){
	

	var x=document.getElementById("contact_no");
	var phoneNoStr = x.value;
	var objRegExp  = /^([0-9]+)$/;
	//x.value=x.value.toUpperCase();
	var check = objRegExp.test(phoneNoStr); 
	
	if(check){
		 //alert("In if-->check");
		 return true;
	}
	else{
		
		 document.getElementById('contact_no').value="";
		 document.getElementById('contact_no').focus();
		 return false;
	}
}
function validateEmgPhoneNumber(){
	

	var x=document.getElementById("emg_contact_no");
	var phoneNoStr = x.value;
	var objRegExp  = /^([0-9]+)$/;
	//x.value=x.value.toUpperCase();
	var check = objRegExp.test(phoneNoStr); 
	
	if(check){
		 //alert("In if-->check");
		 return true;
	}
	else{
		
		 document.getElementById('emg_contact_no').value="";
		 document.getElementById('emg_contact_no').focus();
		 return false;
	}
}
function showUploader(){
	//alert("Inside ShowUploader");
	document.mr.action='/maa/showUploaderMR';
	document.mr.submit();
}
</script>
</html>

