
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.text.SimpleDateFormat" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



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
        <title>rx  - Search User </title>

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
				
			function validateSearchUser() {
			    if(document.getElementById('userName').value == "") {
			   		alert("User Name is required");
			   		return false;
			   }
			}
	
	</script>
		
		<style type="text/css">
			#codescontainer .yui-ac-content {position:absolute;min-width:250px;left:inherit;border:1px solid #404040;background:#fff;overflow:hidden;z-index:9050;clear:both}
			#codescontainer .yui-ac-shadow {position:absolute;margin:.3em;width:100%;background:#a0a0a0;z-index:9049;}
			#codescontainer ul {padding:5px 0;width:100%;}
			#codescontainer li {padding:0 5px;cursor:default;white-space:nowrap;}
			#codescontainer li.yui-ac-highlight {background:#ff0;}
			#codescontainer li.yui-ac-prehighlight {background:#FFFFCC;}
			table.its thead th {position:relative;display:table-cell;z-index: 0;}
		</style>
    </head>
    
<body>


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
		  						<form name="userForm" method="post" action="/maa/SearchUser.action" onsubmit="return validateSearchUser()">
			
			
			
				<font color="red" size="5px"><s:property value="%{errorMsg}" /></font> 
			
			
			
			<table align="center" class="tableStyle" width="100%">
				<tr>
					<td colspan='4'>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="tableheader" valign="middle" align="center" colspan="2" height="26">
						Search User
						
					</td>
				</tr>
			</table>
			<br/>
			<table align="center" class="tableStyle" width="50%">
				<tr>
					<td class="labelcell" width="25%" height="23">
						User Name 
						
						<font class="ErrorText"></font>
					</td>
					<td class="labelcell" align="center">
						<input type="text" id="userName" name="userName" autocomplete="off" onkeyup="autocompletecode(this,event);" onblur="fillusernames();" />
						<div id="codescontainer"></div>
					</td>					
				</tr>
			</table>
			<br/>
			<table align="center" width="100%">
				<tr>
					<td class="button2" align="center">
						<input type="submit" value="Search">
					</td>
					
				</tr>
			</table>
			<br/>
		<s:if test="%{userList!=null}">
			<table id="its" style="color:black;border:1px solid black;thead:block" cellpadding="0" class="its" cellspacing="0">
				<thead>
				<tr>
					<th>SALUTATION</th>
					<th>FIRST NAME</th>
					<th>MIDDLE NAME</th>
					<th>LAST NAME</th>
					<th>Employee Id</th>
					<th>USER NAME</th>
				</tr></thead>
				<s:iterator value="userList" var="cont" status="stat">
				<tbody>
					<tr class="odd">
						<td><s:property value="salutation"/> </td>
						<td><s:property value="firstName"/> </td>
						<td><s:property value="middleName"/> </td>
						<td><s:property value="lastName"/> </td>
						<td><s:property value="empId"/> </td>
						<td><a href="/maa/editHoliday?seq_no=<s:property value="seq_no"/>&amp;mode=edit"></a>
						<a href="/maa/SetupUpdateUser?userName=<s:property value="userName"/>&amp;"><s:property value="userName"/> </a></td>
					</tr>
				</tbody></s:iterator></table>
		
						
						<br/>
<!-- 						<input type="button" style="font-size:12px" name="viewJur" value="View Jurisdiction" onclick="window.location = '/egi/CreateJurisdiction.do?submitType=viewJurisdiction&userid=322';" />
						<input type="button" style="font-size:12px"  name="viewJur" value="Edit Jurisdiction" onclick="window.location = '/egi/BeforeJurisdiction.do?userid=322';" />
	 -->					<div class="ErrorText">
							Click on a User Name to edit user info
						</div>
			</s:if>			
		</form>
		  					</div>
						</div>
					</div>
				</div>
			</td>
		</tr>
	</table>	
</body>
</html>