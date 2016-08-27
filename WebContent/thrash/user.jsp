<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<style>
			#loadingMask {position:absolute; left:0; top:0;width:100%;height:100%; z-index:20000;background-color:#FFF; }
			#loading{ position:absolute; left:45%; top:40%; padding:2px; z-index:20001; height:auto;width:500px; }
		    #loading a { color:#225588; }
		    #loading .loading-indicator{  background:white;  color:#444; font:bold 13px tohoma,arial,helvetica; padding:10px; margin:0; height:auto; }
		    #loading-msg { font: normal 10px arial,tahoma,sans-serif;height:auto; }		    
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>rx Urban Portal</title>
		<link href="/maa/commonyui/yui/menu/assets/skins/sam/menu.css" rel="stylesheet" type="text/css"></link>
		<link href="/maa/css/style.css" rel="stylesheet" type="text/css" />
		<link href="/maa/css/portal.css" rel="stylesheet" type="text/css" />
		

		
		<script>
			var _portalTime = null;
			var moduleNames = new Array();
			var baseUrls = new Array ();
			function finishLoading() {
				_portalTime = window.setInterval(finishLoadings, 1);
			}
			function finishLoadings() {
				if (!document.getElementById("inboxframe").contentWindow.document.readyState || document.getElementById("inboxframe").contentWindow.document.readyState == "complete") {
					window.clearInterval(_portalTime);
					document.getElementById("loading").style.display = "none";
					document.getElementById("loadingMask").style.display = "none";
				}
			}
		</script>				
	</head>
	
	<body onload="loadImage();MM_preloadImages()" class="yui-skin-sam">
		<div id="loadingMask"></div>
		<div id="loading">
		    <div class="loading-indicator"><img src="<%=request.getContextPath()%>/images/loading.gif" width="32" height="32" style="margin-right:8px;float:left;vertical-align:top;"/> rx Urban Portal <br /><span id="loading-msg">Loading styles and images...</span></div>
		</div>
		<form name="dashboard" id="form">
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
				<tr>
					<td>
						<div class="topbar" style="height: 60px;">
							<div class="logorx" align="left">
								<a href="javascript:void(0);" onclick="PopupNewWindow('http://www.rxpc.co.in','rx Pharma Consultenct (P) Ltd.',850,600);">
									<img src="<%=request.getContextPath()%>/images/logo.jpg" width="90" height="49" border="0" />
								</a>
							</div>
							<div class="mainheadingnew">
								<font size="6px" id="header_font">rx Pharma Consultency (P) Ltd.
								</font>
							</div>
						</div>
												
						<div class="navibarportal">																																																						
							<div>
								
								<div style="margin-top:2px;width:400px;position:absolute;"><span class="fonthome"  onclick="showMainMenu()" style="margin-left:5px;display:none;cursor:pointer" id="homebtn">Home &nbsp;&nbsp;<img  src="<%=request.getContextPath()%>/images/dline.gif" style="cursor:default;"/>&nbsp;&nbsp;</span><span class="fonthome" style=";display: inline;"><font style="font-weight:lighter">&nbsp;Welcome</font>&nbsp; <s:property value="%{j_username}"/></span></div>				
								<div class="signoutbox" style="position:relative;">
									<li style="display:inline;">
									<a href="javascript:void(0);"  onmouseover="showHelpMenu(true);" class="fonthome noline">Help&nbsp;&nbsp;</a><img onmouseover="showHelpMenu(true);" src="<%=request.getContextPath()%>/images/arrowdown.gif" style="cursor:pointer;top:2px;position:relative"/>
									<ul class="helpmenu" id="helpmenu" onmouseout="showHelpMenu(false)">									
									</ul>
									</li>&nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/dline.gif" style="cursor:default;"/>&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="PopupNewWindow('/maa/pages/changePassword.jsp','Change Password',850,600);" class="fonthome noline">Change Password</a> &nbsp;&nbsp;<img  src="<%=request.getContextPath()%>/images/dline.gif" style="cursor:default;"/>&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="javascript:closeChildWindows();window.location='/maa/logout.do';" target="_parent" class="fonthome noline">Sign out</a>
								</div>
							</div>
						</div>
						<div class="formmainboxnew">
							<img src="<%=request.getContextPath()%>/images/hide.gif" onclick="showSidebar(this)" title="Hide" class="showhide" border="0"></img>									
							<table id="portaltable" width="100%" border="0" cellspacing="0" cellpadding="0" >
								<tr>
									<td  id="sidebar" width="265px" bgcolor="#93C8E9" valign="top" height="480px">
										<div  class="rightpersonalboxplain">
											<div id="accordion1" >
												<dl class="accordion" id="slider1">
													<dt style="background-image: none;background-color: #f0f0f0;border:1px solid #CCC;color:#416a9c" id="inboxbtn" onclick="showInbox(this)" onmouseover="this.style.backgroundColor='#92b4d5'" onmouseout="this.style.backgroundColor='#f0f0f0'"><img src="<%=request.getContextPath()%>/images/email.gif" border="0"/>&nbsp;&nbsp;Inbox</dt>
													<dt style="background-image: none;background-color: #f0f0f0;border:1px solid #CCC;border-top:0px;color:#416a9c" id="draftbtn" onclick="showInbox(this)" onmouseover="this.style.backgroundColor='#92b4d5'" onmouseout="this.style.backgroundColor='#f0f0f0'"><img src="<%=request.getContextPath()%>/images/draft.png" />&nbsp;&nbsp;Drafts</dt>
													<dt style="background-image: none;background-color: #f0f0f0;border:1px solid #CCC;border-top:0px;color:#416a9c" id="notificationbtn" onclick="showInbox(this)" onmouseover="this.style.backgroundColor='#92b4d5'" onmouseout="this.style.backgroundColor='#f0f0f0'"><img src="<%=request.getContextPath()%>/images/new-file.png" border="0" width="18" height="18"/>&nbsp;&nbsp;Notifications</dt>
												</dl>
											</div>
											
											<br />
											
											<div id="accordion5" class="accordiondiv">
												<dl class="accordion" id="slider5">
													<dt style= "background-color:#416a9c;font-size:14px;font-family: Arial;font-weight: bold;color: #CCC;" ><img src="<%=request.getContextPath()%>/images/selfservice.png" style="margin-right:6px" height="16" width="16"/>Self Service</dt>
													<dd id="selfservice">
													<span id="selfservicespan">
														
																<a id='ss#829'  name='fave' class="buttonforaccord lineheight"  href='javascript:void(0);' onclick= "PopupCenter('/payroll/salaryadvance/beforeSalaryadvance.do?ess=1','portalApp829', 850,600)">Apply Advance</a>
																<br/>      		
												         		
																<a id='ss#832'  name='fave' class="buttonforaccord lineheight"  href='javascript:void(0);' onclick= "PopupCenter('/eis/leave/BeforeLeaveAction.do?ess=1&submitType=beforeCreate&master=LeaveApplication','portalApp832', 850,600)">Apply Leave</a>
																<br/>      		
												         		
																<a id='ss#835'  name='fave' class="buttonforaccord lineheight"  href='javascript:void(0);' onclick= "PopupCenter('/eis/pims/AfterSearchAction.do?ess=1&submitType=executeAttReport','portalApp835', 850,600)">Attendance Report</a>
																<br/>      		
												         		
																<a id='ss#834'  name='fave' class="buttonforaccord lineheight"  href='javascript:void(0);' onclick= "PopupCenter('/eis/pims/AfterSearchAction.do?ess=1&submitType=executeSearch&module=Employee&masters=Leave&mode=Reports','portalApp834', 850,600)">Leave Report</a>
																<br/>      		
												         		
																<a id='ss#830'  name='fave' class="buttonforaccord lineheight"  href='javascript:void(0);' onclick= "PopupCenter('/payroll/salaryadvance/beforeModifyAdvance.do?ess=1&mode=view','portalApp830', 850,600)">My Advances</a>
																<br/>      		
												         		
																<a id='ss#836'  name='fave' class="buttonforaccord lineheight"  href='javascript:void(0);' onclick= "PopupCenter('/eis/pims/BeforePIMSMasterAction.do?ess=1&submitType=setIdForDetailsView&master=Employee','portalApp836', 850,600)">My Details</a>
																<br/>      		
												         		
																<a id='ss#837'  name='fave' class="buttonforaccord lineheight"  href='javascript:void(0);' onclick= "PopupCenter('/eis/nomineeMaster/nomineeCreateModify!Create.action?ess=1&mode=view','portalApp837', 850,600)">My Nominees</a>
																<br/>      		
												         		
																<a id='ss#841'  name='fave' class="buttonforaccord lineheight"  href='javascript:void(0);' onclick= "PopupCenter('/payroll/reports/selfService.do?reportType=showPaySummaryReport','portalApp841', 850,600)">My Pay Summary</a>
																<br/>      		
												         		
																<a id='ss#842'  name='fave' class="buttonforaccord lineheight"  href='javascript:void(0);' onclick= "PopupCenter('/payroll/reports/selfService.do?reportType=showPayslipHistory','portalApp842', 850,600)">My Payslip History</a>
																<br/>      		
												         		
																<a id='ss#843'  name='fave' class="buttonforaccord lineheight"  href='javascript:void(0);' onclick= "PopupCenter('/payroll/payslip/BeforeviewGenPaySlips.do?ess=1&mode=viewcentral','portalApp843', 850,600)">My Payslips</a>
																<br/>      		
												         		
																<a id='ss#833'  name='fave' class="buttonforaccord lineheight"  href='javascript:void(0);' onclick= "PopupCenter('/eis/pims/BeforeListAction.do?ess=1&submitType=beforeCreate&master=LeaveApplication&action=View','portalApp833', 850,600)">View Leave details</a>
																<br/>      		
												         		
														</span> 												
													</dd>
												</dl>
											</div>												
											
											<br />
											
											<div id="accordion3" class="accordiondiv" style="display:none">
												<div class="headleftnavi pointer" title="Back to Applications" id="accordion4head" onclick='showMainMenu()'></div>
												<dl class="accordion" id="slider3">
												</dl>
											</div>
											<div id="accordion4" class="accordiondiv">
												<div class="headleftnavi" class="pointer"><img src="<%=request.getContextPath()%>/images/application.gif" style="margin-right:6px"/>Applications</div>
												<dl class="accordion" id="slider4">
												
												 	<script>
												 	moduleNames['0'] =  'Administration';
												 	baseUrls['0'] =  'maa';
												 	</script>
												 	<dt style="background-image: none" onclick="prepareApplicationBar('1','Administration','/maa')">Administration</dt>
													
												 	<script>
												 	moduleNames['1'] =  'Medical Representative';
												 	baseUrls['1'] =  'mr';
												 	</script>
												 	<dt style="background-image: none" onclick="prepareApplicationBar('170','Medical Representative','/mr')">Medical Representative</dt>
													
												 	<script>
												 	moduleNames['2'] =  'Doctor';
												 	baseUrls['2'] =  'dr';
												 	</script>
												 	<dt style="background-image: none" onclick="prepareApplicationBar('83','Doctor','/dr')">Doctor</dt>
													
												 	<script>
												 	moduleNames['3'] =  'EIS';
												 	baseUrls['3'] =  'eis';
												 	</script>
												 	<dt style="background-image: none" onclick="prepareApplicationBar('9','EIS','/eis')">EIS</dt>
													
												 	<script>
												 	moduleNames['4'] =  'Product';
												 	baseUrls['4'] =  'pro';
												 	</script>
												 	<dt style="background-image: none" onclick="prepareApplicationBar('36','Product','/pro')">Product</dt>
													
												 	<script>
												 	moduleNames['5'] =  'Chemist';
												 	baseUrls['5'] =  'chem';
												 	</script>
												 	<dt style="background-image: none" onclick="prepareApplicationBar('113','Chemist','/chem')">Chemist</dt>
													
													
												</dl>
											</div>
											<br />												
										</div>
									</td>
									<td valign="top" style="padding-left:8px">
										<iframe src="" onload="finishLoading()" id="inboxframe" style="min-height:480px;" name="inboxframe" width="100%"  height="480" scrolling="no" frameborder="0"></iframe>
									</td>  
							
								</tr>
							</table>
						</div>
						<div class="footer" align="center" >
							<span class="rxfooter"><a href="http://www.rxpc.com/" style="font-size:11px;">rx</a> Urban Portal @  version 1.0 </span>
						</div>
						
						<input type="hidden" id="BASEURL" value=""/>
					</td>
				</tr>
			</table>						
		</form>	
		
		<script type="text/javascript">
		var loadingMsg = document.getElementById('loading-msg');
		loadingMsg.innerHTML = 'Loading Core API...';
		</script>
		
		<script type="text/javascript" src="/maa/commonyui/yui/yahoo/yahoo-min.js"></script>
		<script type="text/javascript" src="/maa/commonyui/yui/yahoo-dom-event/yahoo-dom-event.js"></script> 
		<script type="text/javascript" src="/maa/commonyui/yui/event/event-min.js"></script>  
		<script type="text/javascript" src="/maa/commonyui/yui/connection/connection-min.js"></script> 
		<script type="text/javascript" src="/maa/commonyui/yui/container/container_core-min.js"></script>	
		<script type="text/javascript">loadingMsg.innerHTML = 'Loading Portal Components...';</script>	
		<script type="text/javascript" src="/maa/commonyui/yui/menu/menu-min.js"></script>
		
		<script type="text/javascript" src="/maa/javascripts/script.js"></script>
		
		<script type="text/javascript">loadingMsg.innerHTML = 'Loading Inbox...';</script>
		<script src="/maa/javascripts/portal.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			loadingMsg.innerHTML = 'Initializing Urban Portal...';
			var lat = '0.0';
			var lng = '0.0';	
		</script>
		
	</body>




</html>