
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
		<script type="text/javascript">
			function bodyonload() {
				document.getElementById('upload').value=="";
			}
		</script>
		
    </head>
    
<body onload="bodyonload();">
	

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
		  						<s:form enctype="multipart/form-data" theme="simple" name="impChem" method="post" action="/ImportChemist.action" >
			<table align="center" id="getAllDetails" name="getAllDetails">
				<tr><td>
					<table align="center" class="tableStyle">
						<tr>
							<td class="tableheader" align="middle" width="728" height="6">Import Excel for Chemist</td>
						</tr>
						<tr>
							<td colspan="4">&nbsp;</td>
						</tr>
					</table>
				</td></tr>
			<br/><br/>
				<tr><td>
					<table align="center"  class="tableStyle">
						<tr>
							<td>
								<h1>Select Excel File (.xls) : </h1>
							</td>
							<td>&nbsp;&nbsp;&nbsp;</td>
							<td>
								<s:file name="upload" label="File" id="upload"  /> 
							</td>
						</tr>				
					</table>
				</td></tr>
			<br/><br/>
				<tr><td>
					<table align="center" class="tableStyle" cellspacing="2">
						<tr>
							<td>
								<s:submit name="Submit" value="Upload" id="button" onclick="return validateChemistUpload();"  />
							</td>
							<td>&nbsp;&nbsp;&nbsp;</td>
							<td>
								<input type="button" value="CLEAR" id="button" name="clear" onclick="this.form.reset();"/>
							</td>
							<td>&nbsp;&nbsp;&nbsp;</td>
							<td>
							<input type="button" value="CLOSE" id="closeButton" name="closeButton" onclick="window.close();" />
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
function validateChemistUpload(){
	
	if(document.getElementById('upload').value==""){
		alert("Please select a file to Upload");
		return false;
	}
	var fileName = document.getElementById('upload').value;
	//alert(fileName);
	var extension = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();

	if (extension == "xls") {
         // Valid file type
        fileName == '';
        
        return true;
    }
	else {
			alert("Please upload .xls Excel File Only");
			
			return false;
		}
}
</script>
</html>

