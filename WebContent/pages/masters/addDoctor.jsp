

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
        <title>rx  - Doctor Details </title>

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
				document.getElementById('state').value="";
				document.getElementById('city').value="";
				document.getElementById('address_1').value="";
				document.getElementById('cat_id').value="";
				document.getElementById('ter_id').value="";
				document.getElementById('email_id').value="";
				document.getElementById('contact_no').value="";
				document.getElementById('qualification').value="";
				document.getElementById('specialisation').value="";
				//document.getElementById('doc_id').value="";
				document.getElementById('doctor_name').value="";
				
			}

			function validateDoctor() {
				if(document.getElementById('doctor_name').value=="") {
					alert("Please Enter Doctor Name");
					document.getElementById('doctor_name').focus();
					return false;
				}
				if(!isNaN(document.getElementById('doctor_name').value)) {
					alert("Doctor Name can not be a numeric value.");
					document.getElementById('doctor_name').value="";
					document.getElementById('doctor_name').focus();
					return false;
				}
				/*if(document.getElementById('doc_id').value=="") {
					alert("Please enter Doctor Id");
					document.getElementById('doc_id').focus();
					return false;
				}*/
				if(document.getElementById('specialisation').value=="") {
					alert("Please enter Specialization of Doctor");
					document.getElementById('specialisation').focus();
					return false;
				}
				if(!isNaN(document.getElementById('specialisation').value)) {
					alert("Specialization can not be a numeric value.");
					document.getElementById('specialisation').value="";
					document.getElementById('specialisation').focus();
					return false;
				}
				if(document.getElementById('qualification').value=="") {
					alert("Please enter Qualification of Doctor");
					document.getElementById('qualification').focus();
					return false;
				}
				if(!isNaN(document.getElementById('qualification').value)) {
					alert("Qualification can not be a numeric value.");
					document.getElementById('qualification').value="";
					document.getElementById('qualification').focus();
					return false;
				}
				/*if(document.getElementById('contact_no').value=="") {
					alert("Please enter Contact Number");
					document.getElementById('contact_no').focus();
					return false;
				}
				if(document.getElementById('email_id').value=="") {
					alert("Please enter Email Id");
					document.getElementById('email_id').focus();
					return false;
				}*/
				if(document.getElementById('ter_id').value=="") {
					alert("Please enter Territory ");
					document.getElementById('ter_id').focus();
					return false;
				}
				if(document.getElementById('cat_id').value=="") {
					alert("Please enter Category ");
					document.getElementById('cat_id').focus();
					return false;
				}
				/*if(document.getElementById('address_1').value=="") {
					alert("Please enter Address");
					document.getElementById('address_1').focus();
					return false;
				}*/				
				if(document.getElementById('state_id').value=="") {
					alert("Please Select State of Residence");
					document.getElementById('state_id').focus();
					return false;
				}
				if(document.getElementById('city_id').value=="") {
					alert("Please Select City of Residence");
					document.getElementById('city_id').focus();
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
		  						<s:form theme="simple" name="doc" method="post" >
			<table align="center" id="getAllDetails" name="getAllDetails">
				<tr><td>
					<table align="center" class="tableStyle">
						<tr>
							<td class="tableheader" align="middle" width="728" height="6">Doctor Details</td>
						</tr>
						<tr>
							<td colspan="4">&nbsp;</td>
						</tr>
					</table>
				</td></tr>
				<tr><td><br/><br/></td></tr>
			<tr><td>
				<table align="center"  class="tableStyle">
					
					<tr>
						<td  class="labelcell" width="40%" height="23" >Doctor Name<font class="ErrorText">*</font></td>
						<td  class="labelcell" align="left" width="40%" height="23" >
							<input type="text" name="doctor_name" value="" id="doctor_name" class="ControlText">
						</td>				
					
						<td class="labelcell"  width="40%" height="23" >Doctor ID<font class="ErrorText" size="-2">(Autogenerated)</font> </td>
						<td class="labelcell"  align="left" width="40%" height="23" bgcolor="yellow">
							<input type="text" name="" value="Autogenerated" id="" class="ControlText" readonly="readonly" >
						</td>
						<td class="labelcell"  width="40%" height="23" >Designation</td>
						<td class="labelcell"  align="left" width="40%" height="23" >
							<input type="text" name="designation" value="" id="designation" class="ControlText">
						</td>
					</tr>
					<tr>					
						<td class="labelcell"  width="40%" height="23" >Specialisation</td>
						<td class="labelcell"  align="left" width="40%" height="23" >
							<input type="text" name="specialisation" value="" id="specialisation" class="ControlText">
						</td>					
						<td class="labelcell"  width="40%" height="23" >Qualification</td>
						<td class="labelcell"  align="left" width="40%" height="23" >
							<input type="text" name="qualification" value="" id="qualification" class="ControlText">
						</td>					
						<td class="labelcell"  width="40%" height="23" >Contact Number</td>
						<td class="labelcell"  align="left" width="40%" height="23" >
							<input type="text" name="contact_no" value="" id="contact_no" class="ControlText" onkeyup="validatePhoneNumber();">
						</td>					
					</tr>
					
					<tr>
						<td  class="labelcell" width="40%" height="23" >Email ID<font class="ErrorText">*</font></td>
						<td  class="labelcell" align="left" width="40%" height="23" >
							<input type="text" name="email_id" value="" id="email_id" class="ControlText" onblur="validateEmailAddress(this);">
						</td>		
						<!-- <td class="labelcell"  width="40%" height="23" >Territory ID</td>
						<td class="labelcell"  align="left" width="40%" height="23">
							<s:select theme="simple" name="ter_id" id="ter_id" cssClass="ControlText" list="territoryList" listKey="ter_id" listValue="territory" headerKey="" headerValue="---Select---"/>
						</td>  -->
						<td  class="labelcell" width="40%" height="23" >Category <font class="ErrorText">*</font></td>
						<td  class="labelcell" align="left" width="40%" height="23" >
							<s:select theme="simple" name="cat_id" id="cat_id" list="categoryList" cssClass="ControlText" listKey="cat_id" listValue="cat_name" headerKey="" headerValue="---Select---"/>
						</td>	
						<td  class="labelcell" width="40%" height="23" >Address Line 1<font class="ErrorText">*</font></td>
						<td  class="labelcell" align="left" width="40%" height="23" >
							<input type="text" name="address_1" value="" id="address_1" class="ControlText" maxlength="30">
						</td>		
					</tr>
					
					<tr>					
										
					
						<td class="labelcell"  width="40%" height="23" >Address Line 2</td>
						<td class="labelcell"  align="left" width="40%" height="23" >
							<input type="text" name="address_2" value="" id="address_2" class="ControlText" maxlength="30">
						</td>
						<td  class="labelcell" width="40%" height="23" >City<font class="ErrorText">*</font></td>
						<td  class="labelcell" align="left" width="40%" height="23" >
							<s:select theme="simple" name="city_id" value="" id="city_id" cssClass="ControlText" list="cityList" listKey="cityId" listValue="cityName" headerKey="" headerValue="--Select--"/>
						</td>				
				
						<td class="labelcell"  width="40%" height="23" >State</td>
						<td class="labelcell"  align="left" width="40%" height="23" >
							<s:select theme="simple" name="state_id" value="" id="state_id" cssClass="ControlText" list="stateList" listKey="stateId" listValue="stateName" headerKey="" headerValue="--Select--"/>
						</td>
<!-- 						<td class="labelcell"  width="40%" height="23" >City</td>
						<td class="labelcell"  align="left" width="40%" height="23" >
							<input type="text" name="city" value="" id="city" class="ControlText">
						</td>
						
						<td  class="labelcell" width="40%" height="23" >State<font class="ErrorText">*</font></td>
						<td  class="labelcell" align="left" width="40%" height="23" >
							<input type="text" name="state" value="" id="state" class="ControlText">
						</td>
-->						
					</tr>
					
					<tr>
						<td class="labelcell"  width="40%" height="23" >Is Active</td>
						<td class="labelcell"  align="left" width="40%" height="23" >
							<s:checkbox name="active" value="" id="active" cssClass="ControlText" checked="checked"/>
						</td>
					</tr>
				</table>
				<tr><td>
					<table>
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
						</tr>					
					</table>
			</td></tr>
			<br/><br/>
			<tr><td>
				<table align="center" class="tableStyle" cellspacing="2">
					<tr>
						<td>
							<input type="button" name="Submit" value="SAVE" onclick="return addDoctor();"/>
							<!-- <input type="button" value="SAVE" id="button" name="Submit" onclick="return addDoctor();"/>  -->
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
						<td>&nbsp;&nbsp;&nbsp;</td>
<!-- 						<td>				
							<input type="button" value="Export Excel" id="buttonExport" name="exportExcel" onclick="return showUploader();" />
						</td>					
	 -->					
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
	
	/*
		JavaScript to select multiple territories
	*/
	/*var selectedId = document.getElementById('mstrList')
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
	function addDoctor()
	{
		var tf = selectAll();
		
		var rf = validateDoctor();
		//alert("After validation --> "+rf);
		if(rf && tf){	
			//alert("In if");
			document.doc.action='/maa/addDoctor';
			document.doc.submit();
		}
		//else return false;
	}
	
	function selectAll()
	{
		var list = document.getElementById("ter_id");
		if (list.options.length > 1) {
			alert("Please Select only one Territory");
			return false;
		}
		for (var i = 0; i < list.options.length; i++) 
		  {
		   //alert(list.options[i].value)
		   list.options[i].selected = true;
	 	 }
		return true;
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

function showUploader(){
	//alert("Inside ShowUploader");
	document.doc.action='/maa/showUploaderDoctor';
	document.doc.submit();
}

</script>
</html>

