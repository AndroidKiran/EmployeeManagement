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
		  						<s:form theme="simple" name="userTourForm" method="post" action="/CreateUserTourPlan.action" enctype="multipart/form-data" onsubmit=" return validateTP();">
			
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
						<td class="tablesubcaption" valign="bottom" align="center" width="25%" height="20">
							&nbsp; Tour Date(dd/mm/yyyy)
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="25%" height="20">
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
							<select name="tourPurposeArray" id="tourPurposeArray" class="ControlText" onchange="getSelectedValue();">
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
						<input type="text" name="tourDateArray" value="" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="tourDateArray" class="ControlText">
						<a href="javascript:show_calendar('userTourForm.tourDateArray');" >
							<img src="<%=request.getContextPath()%>/images/calendaricon.gif" border="0" align="middle"/>
						</a>
						</td>
						
						<td id="idForDisableAnother" class="labelcell" valign="bottom" align="left" width="25%" height="20">
							<table>
								<tr>
									<td>
										<s:select name="descArrayForDoc" id="descArrayForDoc" cssClass="ControlText" list="docList" listKey="doc_id" listValue="doctor_name" headerKey="" headerValue="--Select Doctor--" />
									</td>
								</tr>
								<tr>
									<td>
										<s:select name="descArrayForChem" id="descArrayForChem" cssClass="ControlText" list="chemistList" listKey="chemist_id" listValue="chemist_name" headerKey="" headerValue="--Select Chemist--" />
										<!-- onchange="disableAnother(this);" -->
									</td>
								</tr>
							</table>						
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
				
				
				
				<font color="red" size="2px"><s:property value="%{dispResult}" /></font> 
				
				<s:if test="%{tourDetailsListForTP!=null}">
				
					<fieldset style="border:1px solid gray;padding:5px;margin:5px">
				<legend>Created User Tour Plan</legend>			
				<table border="1" width="100%" align="center" class="tableStyle">
					<tr>
						<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">
							&nbsp; Tour Purpose
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="20%" height="20">
							&nbsp; Tour Date(dd/mm/yyyy)
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="20%" height="20">
							&nbsp; Description
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="15%" height="20">
							&nbsp; Is Completed
						</td>
						<td class="tablesubcaption" valign="bottom" align="center" width="15%" height="20">
							&nbsp; Edit
						</td>
						
					</tr>
				
					<s:iterator value="tourDetailsListForTP">
					<s:hidden name="seq_no"></s:hidden>
					<tr id="reasonrow">
						<td class="labelcell" valign="bottom" align="left" width="20%" height="20">
							<s:select name="tourPurposeArray" id="tourPurposeArray" list="tourPurposeList" value="%{tourPurpose}" cssClass="ControlText" listKey="tourPurposeId" listValue="tourPurposeName" headerKey="" headerValue="--Select--" disabled="true"/>
						</td>
																
						<td class="labelcell" valign="bottom" align="left" width="20%" height="20">
						<s:textfield name="tourDateArray" value="%{tourDate}" size="15" onkeyup="DateFormat(this,this.value,event,false,'3')" onblur="validateDateFormat(this);" id="tourDateArray" class="ControlText" readonly="true"/>
						
						</td>
						
						<td class="labelcell" valign="bottom" align="left" width="20%" height="20">
							<!--<s:select name="descArray" id="descArray" value="%{desc}" cssClass="ControlText" list="docList" listKey="doc_id" listValue="doctor_name" headerKey="" headerValue="--Select--" disabled="true"/>-->
							<table>
								<tr>
									<td>
										<s:select name="descArrayForDoc" id="descArrayForDoc" value="%{descDoc}" cssClass="ControlText" list="docList" listKey="doc_id" listValue="doctor_name" headerKey="" headerValue="--Select Doctor--" disabled="true"/>
									</td>
								</tr>
								<tr>
									<td>
										<s:select name="descArrayForChem" id="descArrayForChem" value="%{descChem}" cssClass="ControlText" list="chemistList" listKey="chemist_id" listValue="chemist_name" headerKey="" headerValue="--Select Chemist--" disabled="true" />
										<!-- onchange="disableAnother(this);" -->
									</td>
								</tr>
							</table>	
						</td>
						
						<td class="labelcell" valign="bottom" align="left" width="15%" height="20">
						<s:checkbox name="isCompleted" value="%{isCompleted}" id="isCompleted" class="ControlText" disabled="true"/>
						
						</td>
						
						<td class="labelcell" valign="bottom" align="left" width="15%" height="20">
		            	<table border="1" width="100%" align="center" class="tableStyle">
		            		<tbody><tr>
		            			
		            			<!-- Make an action for edit, here it is editTP -->
				             	<td width="5%"><a href="/maa/editTP?seq_no=<s:property value="seq_no"/>&amp;mode=edit">Edit</a></td>
				             	<td width="5%"><a href="/maa/editTP?seq_no=<s:property value="seq_no"/>&amp;mode=edit"><img src="/maa/images/page_edit.png" alt="Edit Data"  border="0" width="16" height="16"></a></td>
		             		</tr></tbody>
		                                                                                                  
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
/*	
	function SelectedItemsAre(){
		
		
		var sel = document.getElementsByName('tourPurposeArray');
		var sv = sel.value;
		alert(sv);
		
		
		
		alert("1St step");
		var selected=new Array(); 
		
		for(var i=0;i<4;i++)
			{alert("2nd step");
				selected[i] = document.getElementById("tourPurposeArray").value;
				alert(selected[i]);
			}
		
		var x = document.getElementById("tourPurposeArray");
		//alert(selected);
		document.getElementById('selectedItem').innerHTML = "<font color='green'>Selected Tour purpose are :</font>"selected;		
	};*/
	function getSelectedValue() {  
	    //var index = document.getElementById('tourPurposeArray').selectedIndex;  
	   // alert("value="+document.getElementById('tourPurposeArray').value);  
	   // alert("Purpose="+document.getElementById('tourPurposeArray').options[index].text);
	    var row = document.getElementById("reason_table").rows.length;
	    alert("row no = "+row);
	    
	    if(row==1){
	    	
	    	if (document.getElementById('tourPurposeArray').value == 1) {
    			alert("2");
    			document.getElementById('descArrayForDoc').removeAttribute("disabled");
    			document.getElementById('descArrayForDoc').value = "";
    			document.getElementById('descArrayForChem').value = "";
    			document.getElementById('descArrayForChem').setAttribute("disabled","disabled");
    		}
    		else {
    			alert("3");
    			document.getElementById('descArrayForChem').removeAttribute("disabled");
    			document.getElementById('descArrayForDoc').setAttribute("disabled","disabled");
    		}
	    	
	    	
		    var fld = document.getElementById('tourPurposeArray');
		    var values = [];
		    for (var i = 0; i < fld.options.length; i++) {
		      if (fld.options[i].selected) {
		        values.push(fld.options[i].text);
		      }
		    }
		   // alert(values[0]);	
		    
		   // document.getElementById('selectedItem').innerHTML = "<font color='green'>Selected Tour purpose are : <br></font>"+values;   
		    document.getElementById('selectedItem').innerHTML = "<font color='green'>Selected is : </font>"+values;  
		    //values=null;
	    }
	    else if (row>1)
	    	{
	    		alert("In row > 1");
	    		alert("row no = "+row);
	    		
	    	if (document.getElementsByName('tourPurposeArray')[row].value == 1) {
				alert("In else -- 1");
				document.getElementById('descArrayForDoc')[row].removeAttribute("disabled");
				document.getElementById('descArrayForChem')[row].setAttribute("disabled","disabled");
			}
			else {
				alert("In else -- 2"); 
				document.getElementById('descArrayForChem')[row].removeAttribute("disabled");
				document.getElementById('descArrayForDoc')[row].setAttribute("disabled","disabled");
			}
	    	
		    	var fld = document.getElementById('tourPurposeArray')[row - 1];
			    var values = [];
			    for (var i = 0; i < fld.options.length; i++) {
			      if (fld.options[i].selected) {
			        values.push(fld.options[i].text);
			      }
			    }
			   // alert(values[0]);	
			    
			   // document.getElementById('selectedItem').innerHTML = "<font color='green'>Selected Tour purpose are : <br></font>"+values;   
			    document.getElementById('selectedItem').innerHTML = "<font color='green'>Selected is : </font>"+values;  
			    //values=null;
	    	}
	    
	   
	    	/*var row = document.getElementById("reason_table").rows.length;
	    	if (row == 1) {
	    		alert("1");
	    		if (document.getElementById('tourPurposeArray').value == 1) {
	    			alert("2");
	    			document.getElementById('descArrayForDoc').disabled=false;
	    			document.getElementById('descArrayForChem').disabled=true;
	    		}
	    		else {
	    			alert("3");
	    			document.getElementById('descArrayForChem').disabled=false;
	    			document.getElementById('descArrayForDoc').disabled=true;
	    		}
	    	} else {
	    		alert("In else");
	    		if (row > 1) {
	    			if (document.getElementsByName('tourPurposeArray')[row - 1].value == 1) {
	    				alert("In else -- 1");
	    				document.getElementById('descArrayForDoc')[row - 1].disabled=false;
	    				document.getElementById('descArrayForChem')[row - 1].disabled=true;
	    			}
	    			else {
	    				alert("In else -- 2");
	    				document.getElementById('descArrayForChem')[row - 1].disabled=false;
	    				document.getElementById('descArrayForDoc')[row - 1].disabled=true;
	    			}
	    		}
	    	}
	    
	    */
	    
	    
	    
	    
	    
	    
	    
	    
		/*var row = document.getElementById("reason_table").rows.length;
		
		var tbl = document.getElementById("reason_table");
		var lastRow = tbl.rows.length;
		
		
		if(row == 1){
			alert("here 1");
			document.getElementById('descArrayForDoc').disabled=false;
			document.getElementById('descArrayForChem').disabled=false;
		}
		else if(row > 1){
			alert("here 2");
			
			document.getElementById('descArrayForDoc')[lastRow].disabled=false;
			document.getElementById('descArrayForDoc')[lastRow].value="";
			document.getElementById('descArrayForChem')[lastRow].disabled=false;
			document.getElementById('descArrayForChem')[lastRow].value="";
			*/
			/*document.getElementById('descArrayForDoc')[row - 1].value="";
			document.getElementById('descArrayForDoc')[row - 1].disabled=false;
			document.getElementById('descArrayForChem')[row - 1].value="";
			document.getElementById('descArrayForChem')[row - 1].disabled=false;
			*/
//		}
		
	}// End of getSelectedValue Function
	
	/*function disableAnother(obj){
		//alert("1st");
		
		var row = document.getElementById("reason_table").rows.length;
		
		if(row==1){
		
		
		if(document.getElementById('descArrayForDoc').value=="" && document.getElementById('descArrayForChem').value=="" )
			{			
				document.getElementById('descArrayForDoc').disabled=false;
				document.getElementById('descArrayForChem').disabled=false;
			}
		if(document.getElementById('descArrayForDoc').value=="")
			{			
				//document.getElementById('descArrayForDoc').disabled=false;
				document.getElementById('descArrayForChem').disabled=false;
			}
		if(document.getElementById('descArrayForChem').value=="")
			{			
				document.getElementById('descArrayForDoc').disabled=false;
				//document.getElementById('descArrayForChem').disabled=false;
			}
           // document.getElementById('descArrayForChem').disabled=true;
            //document.getElementById('descArrayForDoc').disabled=false;
          if(document.getElementById('descArrayForDoc').value!="" )
        	  {
        	  document.getElementById('descArrayForChem').disabled=true;        	  
        	  }
          if(document.getElementById('descArrayForChem').value!="" )
        	  {
        	  document.getElementById('descArrayForDoc').disabled=true;        	  
        	  }
		}
		else if(row>1){
			
			alert("Here in disable where row>1");
			
			if(document.getElementById('descArrayForDoc')[row - 1].value=="" && document.getElementById('descArrayForChem')[row - 1].value=="" )
			{			
				document.getElementById('descArrayForDoc')[row - 1].disabled=false;
				document.getElementById('descArrayForChem')[row - 1].disabled=false;
			}
		if(document.getElementById('descArrayForDoc')[row - 1].value=="")
			{			
				//document.getElementById('descArrayForDoc').disabled=false;
				document.getElementById('descArrayForChem')[row - 1].disabled=false;
			}
		if(document.getElementById('descArrayForChem')[row - 1].value=="")
			{			
				document.getElementById('descArrayForDoc')[row - 1].disabled=false;
				//document.getElementById('descArrayForChem').disabled=false;
			}
           // document.getElementById('descArrayForChem').disabled=true;
            //document.getElementById('descArrayForDoc').disabled=false;
          if(document.getElementById('descArrayForDoc')[row - 1].value!="" )
        	  {
        	  document.getElementById('descArrayForChem')[row - 1].disabled=true;        	  
        	  }
          if(document.getElementById('descArrayForChem')[row - 1].value!="" )
        	  {
        	  document.getElementById('descArrayForDoc')[row - 1].disabled=true;        	  
        	  }
		}
	}*/
	/*function anotherFunction(){
		
		alert("anotherFunction");
		
		var row = document.getElementById("reason_table").rows.length;
		
		document.getElementById('descArrayForDoc').disabled=false;
		document.getElementById('descArrayForChem').disabled=false;
	}*/
	

</script>
</html>