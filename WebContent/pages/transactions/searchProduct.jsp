

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
		
    </head>
    
<body >
	

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
		  						<s:form name="searchProduct" action="/searchProduct" method="post" theme="simple" >
			<table align="center" id="getAllDetails" name="getAllDetails">
				<table align="center" class="tableStyle">
					<tr>
						<td class="tableheader" align="middle" width="728" height="6">Product Details</td>
					</tr>
					<tr>
						<td colspan="4">&nbsp;</td>
					</tr>
			</table>
			<br/><br/>
			<table align="center"  class="tableStyle">
				
				<tr>
					<td  class="labelcell" width="40%" height="23" >Product ID<font class="ErrorText">*</font></td>
					<td  class="labelcell" align="left" width="40%" height="23" >
						<input type="text" name="product_id" value="" id="product_id" class="ControlText">
					</td>				
				
					<td class="labelcell"  width="40%" height="23" >Product Name<font class="ErrorText">*</font></td>
					<td class="labelcell"  align="left" width="40%" height="23" >
						<input type="text" name="product_name" value="" id="product_name" class="ControlText">
					</td>
				</tr>
				
			</table>
			<br/><br/>
			<table align="center" class="tableStyle" cellspacing="2">
				<tr>
					<td>
						<s:submit value="Search"/>
					</td>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td>
					<input type="button" value="CLOSE" id="closeButton" name="closeButton" onclick="window.close();" />
					</td>					
					
				</tr>			
			</table>
			
			<s:if test="%{productList!=null}">
				<table border="1" width="100%" align="center" class="tableStyle">	
			
				<tr>
					<td class="tablesubcaption" valign="bottom" align="left" width="10%" height="20">Sl. No.</td>
					<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">Product ID</td>
					<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">Product Name</td>
					<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">Date of Starting</td>
					<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">
						<table width="100%" class="tableStyle">
		            		<tbody><tr>
		            		
				             	<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">Edit</td>
				             	<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20"><img src="/maa/images/page_edit.png" alt="Edit Data"  border="0" width="16" height="16"></td>
		             		</tr>
		             		<tr>
		             			<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20">View</td>
				             	<td class="tablesubcaption" valign="bottom" align="left" width="20%" height="20"><img src="/maa/images/page_view.png" alt="View Data"  border="0" width="16" height="16"></td>
		             		</tr></tbody>
		                                                                                                  
		             	</table>
					</td>
				</tr>
				
				<s:iterator value="productList" var="cont" status="stat">
					<s:hidden name="seq_no"/>
				  <tr id="reasonrow">
				  	<td class="labelcell" valign="bottom" align="left" width="5%" height="20">
		               <s:property value="%{#stat.index + 1}" />
		            </td>
				    <td class="labelcell" valign="bottom" align="left" width="20%" height="20"><s:property value="product_id"/></td>
				    <td class="labelcell" valign="bottom" align="left" width="20%" height="20"><s:property value="product_name"/></td>
				    <td class="labelcell" valign="bottom" align="left" width="20%" height="20"><s:property value="dos"/></td>

				    <td class="labelcell" valign="bottom" align="left" width="30%" height="20">
		            	<table border="1" width="100%" align="center" class="tableStyle">
		            		<tbody><tr>
		            			
		            			<!-- Make an action for edit, here it is editProduct -->
				             	<td class="labelcell" valign="bottom" align="left" width="20%" height="20"><a href="/maa/editProduct?seq_no=<s:property value="seq_no"/>&amp;">Edit</a></td>
				             	<td class="labelcell" valign="bottom" align="left" width="20%" height="20"><a href="/maa/editProduct?seq_no=<s:property value="seq_no"/>&amp;"><img src="/maa/images/page_edit.png" alt="Edit Data"  border="0" width="16" height="16"></a></td>
		             		</tr>
		             		<tr>
		             			<td class="labelcell" valign="bottom" align="left" width="20%" height="20"><a href="/maa/viewProduct?seq_no=<s:property value="seq_no"/>&amp;">View</a></td>
				             	<td class="labelcell" valign="bottom" align="left" width="20%" height="20"><a href="/maa/viewProduct?seq_no=<s:property value="seq_no"/>&amp;"><img src="/maa/images/page_view.png" alt="View Data"  border="0" width="16" height="16"></a></td>
		             		
		             		</tr></tbody>
		                                                                                                  
		             	</table>
		           </td>
				    
				  </tr>
				</s:iterator>
				</table>
			</s:if>	  					
	</table>	
								</s:form>
							</div>
						</div>
					</div>
				</div>
			</td>
		</tr>
</body>
</html>