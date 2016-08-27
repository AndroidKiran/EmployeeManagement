<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>



	<!--
        REMOTE IP ADDRESS USING getRemoteAddr :115.108.9.198
        REMOTE IP ADDRESS USING getHeader("X-Forwarded-For") :null
        FINAL IP ADDRESS GOING TO USE :  115.108.9.198
    -->
	
<html>
	<head>
		<title>rx Portal Login</title>		
		<link rel="stylesheet" type="text/css" href="/maa/css/login.css"/>		
		
		

	</head>
	<body oncontextmenu="return false" onkeypress="checkCapsLock(event)" bgcolor="#D4EAF5">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" > <!-- bgcolor="#D4EAF5" -->
			<tr>
				<td>
					<div class="topbar" style="height: 60px;">
						<div class="logoLeft">
							<img src="logo.jpg" width="200" height="60"/><!-- width="200" height="80"  -->
						</div>
						
						<div class="mainheading" align="center">
							rx Pharma Consultancy (P) Ltd.						
						</div>
					</div>
					<div class="navibarportal">
					</div>
<!-- 				<div class="fullBlue">
					</div>		 -->
					<div class="authorized" align="center">For Authorized Users Only</div>
					</div>
						<div class="formmainbox">
							<div class="insidecontent">
								<div class="rbroundbox2">
									<div class="rbtop2">
										<div></div>
									</div>
									<div class="rbcontent2">
										<form method="post" id="UserValidateForm" name="UserValidateForm" action="/maa/j_security_check" autocomplete="off" >
											<input type="hidden" id="ipAddress" name="ipAddress" value="115.108.9.198"/>
											<input type="hidden" id="loginType" name="loginType" />
											<table width="100%" border="0" cellspacing="0" cellpadding="0">
												<!-- 
												<tr>
													<td colspan="3" align="center"><div class="authorized">For Authorized Users Only</div>	</td>
												</tr> -->
												<tr>
													<td width="26%">	
														<s:if test="%{setLabel!=null}">
															<s:property value="setLabel"/>
														</s:if>																								
													</td>
													
													
													
													<td width="40%">
														<div class="loginboxmain">
															<div class="loginheadingnew3">
																Login
															</div>
															<div class="loginboxnew1">
																<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
																	<tr>
																		<td height="25px" colspan="2"/>
																	</tr>
																	<tr>
																		<td width="50%" align="right">
																			Name / User Name: &nbsp;&nbsp;
																		</td>
																		<td width="50%" align="left">
																			<input type="text" id="j_username" name="j_username" tabindex="1" class="textAlignLeft"	onblur="checkRole()" autocomplete="off"/>
																		</td>
																	</tr>
																	<tr>
																		<td height="5" colspan="2"></td>
																	</tr>
																	<tr>
																		<td width="50%" align="right">
																			Password:&nbsp;&nbsp;
																		</td>
																		<td width="50%" align="left">
																			<input type="password" id="j_password" 	name="j_password" tabindex="1" class="textAlignLeft" onkeydown="checkEnterKey(event)" autocomplete="off"/>
																		</td>
																	</tr>
																	<tr>
																		<td height="5" colspan="2"></td>
																	</tr>
																	<tr style="display: none" id="locationRow">
																		<td width="50%" align="right">
																			Location<span style="color:red">*</span>:&nbsp;&nbsp;
																		</td>
																		<td width="50%" align="left">
																			<input type="text" id="locationname" name="locationname" tabindex="1" class="fieldinput" readonly="true" /> 
																			<input type="hidden" name="locationId" id="locationId" />
																		</td>
																	</tr>
																	<tr>
																		<td height="5" colspan="2"></td>
																	</tr>
																	<tr style="display: none" id="counterRow">
																		<td width="50%" align="right">
																			Counter<span style="color:red">*</span>:&nbsp;&nbsp;
																		</td>
																		<td width="50%" align="left">
																			<select name="counterId" id="counterId" class="fieldinput" tabindex="1"/>
																		</td>
																	</tr>
																	<tr>
																		<td height="15" colspan="2"></td>
																	</tr>
																	<tr>
																		<td  align="center" colspan="2" >
																			<input type="button" class="buttongeneral" 	tabindex="1" value="Login" onclick="buttonpress();" />
																			&nbsp;
																			<input type="button" class="buttongeneral" tabindex="1" value="Close" onclick="closeWindow()" />
																		</td>
																	</tr>
																</table>
															</div>
															<span id="tooltip" class="capslock">CAPS LOCK : ON</span>														
														</div>
													</td>
													<td width="19%">																								
													</td>
												</tr>
											</table>
										</form>
									<!-- </div> -->
									<div class="rbbot2">
										<div></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="buttonbottom"> rx Administration System Designed and Implemented by <a href="http://www.rxpc.com/">rx Pharma Consultancy (P) Ltd.</a>&nbsp;&copy; All Rights Reserved
					</div>
				</td>
			</tr>
		</table>
		<script type="text/javascript" src="javascripts/login.js"></script>
	</body>
</html>

