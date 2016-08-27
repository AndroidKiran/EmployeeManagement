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
        <link rel="icon" href="/maa/images/favicon.ico"/>
        <title>rx  - Create DCR </title>

        <link rel="stylesheet" type="text/css" media="all" href="/maa/css/rx.css" />
      	<link rel="stylesheet" type="text/css" href="/maa/commonyui/build/reset/reset.css" />
		<link rel="stylesheet" type="text/css" href="/maa/commonyui/build/fonts/fonts.css" />
		<link rel="stylesheet" type="text/css" href="/maa/css/dcr.css" />
		<link rel="stylesheet" type="text/css" href="/maa/css/common.css" />
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
		/*
		
		function bodyonload() {
			document.getElementById('isCompletedArray').value = "";
			document.getElementById('tourDateArray').value = "";
			document.getElementById('timeArray').value = "";
			document.getElementById('remarksArray').value = "";
			document.getElementById('contactPersonArray').value = "";

		}
		*/
		
		function addRole() {
			
			var row = document.getElementById("reason_table").rows.length;
			if (row == 1) {
				if (document.getElementById('tourDateArray').value == "") {
					alert("Please enter Tour Date");
					document.getElementById('tourDateArray').focus();
					return false;
				}
				if (document.getElementById('timeArray').value == "") {
					alert("Please Enter Time of Visit. ");
					document.getElementById('timeArray').focus();
					return false;
				}
				if (document.getElementById('remarksArray').value == "") {
					alert("Please Write Remarks for Visit. ");
					document.getElementById('remarksArray').focus();
					return false;
				}
				if (document.getElementById('contactPersonArray').value == "") {
					alert("Please Select Contact Person Name of Visit. ");
					document.getElementById('contactPersonArray').focus();
					return false;
				}
			} else {
				if (row > 1) {
					if (document.getElementsByName('timeArray')[row - 1].value == "") {
						alert("Please Enter Time of Visit.");
						document.getElementsByName('timeArray')[row - 1].focus();
						return false;
					}
					if (document.getElementsByName('tourDateArray')[row - 1].value == "") {
						alert("Please enter Tour Date");
						document.getElementsByName('tourDateArray')[row - 1].focus();
						return false;
					}
					if (document.getElementById('remarksArray')[row - 1].value == "") {
						alert("Please Write Remarks for Visit. ");
						document.getElementById('remarksArray')[row - 1].focus();
						return false;
					}
					if (document.getElementById('contactPersonArray')[row - 1].value == "") {
						alert("Please Select Contact Person Name of Visit. ");
						document.getElementById('contactPersonArray')[row - 1].focus();
						return false;
					}
				}
			}
			
			var tbl = document.getElementById("reason_table");
			var tbody = tbl.tBodies[0];
			var lastRow = tbl.rows.length;
			var rowObj = document.getElementById("detailsRow").cloneNode(true);
			tbody.appendChild(rowObj);
			document.getElementsByName('isCompletedArray')[lastRow].value = "";
			document.getElementsByName('tourDateArray')[lastRow].value = "";
			document.getElementsByName('timeArray')[lastRow].value = "";
			document.getElementsByName('remarksArray')[lastRow].value = "";
			document.getElementsByName('contactPersonArray')[lastRow].value = "";
		}
		function validate() {
			if(document.getElementById('isCompletedArray').value=="") {
				alert("Please tick ");
				document.getElementById('isCompletedArray').focus();
				return false;
			}
			if(document.getElementById('tourDateArray').value=="") {
				alert("Please Enter Tour Date ");
				document.getElementById('tourDateArray').focus();
				return false;
			}
			if(document.getElementById('timeArray').value=="") {
				alert("Please enter Tour Time in 24 hour formate ");
				document.getElementById('timeArray').focus();
				return false;
			}
			if(document.getElementById('remarksArray').value=="") {
				alert("Please give Remarks ");
				document.getElementById('remarksArray').focus();
				return false;
			}
			if(!isNaN(document.getElementById('remarksArray').value)) {
				alert("Remarks can not be a numeric value.");
				document.getElementById('remarksArray').value="";
				document.getElementById('remarksArray').focus();
				return false;
			}
			if(document.getElementById('contactPersonArray').value=="") {
				alert("Please Enter Contact person ");
				document.getElementById('contactPersonArray').focus();
				return false;
			}
			if(!isNaN(document.getElementById('contactPersonArray').value)) {
				alert("Contact Person Name can not be a numeric value.");
				document.getElementById('contactPersonArray').value="";
				document.getElementById('contactPersonArray').focus();
				return false;
			}
			
			return true;
			
		}

		
		</script>

    </head>
    
<body >



<div class="commontopyellowbg">DCR System</div>
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
		  						<s:form theme="simple" name="DcrForm" method="post" action="/CreateDCR.action" onsubmit=" return validate();">
				<font color="red" size="2px"><s:property value="%{dispResult}" /></font> 
			<table align="center" class="tableStyle" width="100%">
				<tr>
				
					<td colspan=4>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="tableheader" valign="middle" align="center" colspan="2" height="26">
						DCR Entry System
						
					</td>
				</tr>
			</table>
			<br/>
			
			
			<fieldset style="border:1px solid gray;padding:5px;margin:5px">
				<legend>DCR Entry</legend>			
				<table border="1" id="reason_table" width="100%" align="center" class="tableStyle">
					
					
					<tr>
			            <td colspan="5" width="50%">
			              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tablebottom" name="grid" id="grid">
			               
			                
			              
			                <tr>
			                      <th class="bluebgheadtd" >Is Completed</th>
							      <th class="bluebgheadtd" ><label for="tourDateArray">Tour Date<span class="mandatory">*</span></label></th>
							      <th class="bluebgheadtd" ><label for="timeArray">Time</label></th>
							      <th class="bluebgheadtd" ><label for="remarksArray">Remarks</label></th>
							      <th class="bluebgheadtd" >Doc/Chem<span id="contactPersonArray" style="display:none" class="mandatory">*</span></th>
							      <th class="bluebgheadtd" ><label for="adddel">Add/Delete</label></th>
			                 </tr>
			                  
			                  <s:iterator value="tourDetailsList">
			                  	<s:hidden name="seq_no_tourPOJOArray" value="%{seq_no}" ></s:hidden>
			                  <tr id="detailsRow">
			                 	<td class="blueborderfortd" width="5%"><div align="center">
									<s:checkbox name="isCompletedArray" value="" id="isCompletedArray" style="width:25px" class="ControlText"/>
			      	  			</div></td>
			      		 		<td class="blueborderfortd" width="10%"><div align="center">
			      					<s:textfield name="tourDateArray" value="%{tourDate}" size="10" id="tourDateArray" cssClass="ControlText" readonly="true"/>
			      	  			</div></td>
			      	  			<td class="blueborderfortd" width="10%"><div align="center">
			      	      			 <input type="text" name="timeArray" value="" size="10" id="timeArray" class="ControlText"/>
			      		  </div></td>
								 <td class="blueborderfortd" width="10%"><div align="center">
			      					<s:textarea name="remarksArray" rows="3" cols="20" value="" id="remarksArray" cssClass="ControlText"/>
			      	 			</div></td>
				  				<td class="blueborderfortd" width="10%"><div align="center">
				    				<!--  <select name="contactPersonArray" id="contactPersonArray"/>   -->
				    				<s:select name="contactPersonArray" id="contactPersonArray" cssClass="select" list="docList" listKey="doc_id" listValue="doctor_name" value="%{desc}" headerKey="" headerValue="--Select--" />
				    			<!-- <s:textfield name="contactPersonArray" size="18" value="%{desc}" id="contactPersonArray" cssClass="tablerow" readonly="true"/> -->
									    
									
					    			</div>       
			      				 </td>
			      		  		  <td id="pet" class="blueborderfortd" width="5%"><div align="center">
						      		<p align="center"><img src="/maa/images/add.png" alt="Add" width="18" height="18" border="0" onclick="addRole()"/>
						      		<img src="/maa/images/delete.png" alt="Remove" width="18" height="18" border="0" onclick="deleteRole(this)"/></p>
			      		 		  </div></td>
			                  </tr>
			                </s:iterator>
			              </table></td></tr>
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