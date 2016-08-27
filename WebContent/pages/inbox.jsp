 
<html>
  <head>
    <title>Inbox</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="/maa/commonyui/yui/fonts/fonts-min.css" type="text/css" rel="stylesheet"></link>
	<link rel="stylesheet" type="text/css" href="/maa/commonyui/yui/paginator/assets/skins/sam/paginator.css"/>
	<link href="/maa/commonyui/yui/datatable/assets/skins/sam/datatable.css" type="text/css" rel="stylesheet"> </link>
	<link href="/maa/commonyui/yui/menu/assets/skins/sam/menu.css" rel="stylesheet" type="text/css" />
	<link href="/maa/commonyui/yui/calendar/assets/skins/sam/calendar.css" rel="stylesheet" type="text/css">
	<link href="/maa/css/workflow/inbox.css" rel="stylesheet" type="text/css"> </link>
  </head>  
  <body class="yui-skin-sam" id="body" oncontextmenu="return false;">
  	<div id="calender" class="cal"></div> 
  	<div class="inboxstrip"><div style="padding-top:5px" id="inboxtitle">Inbox</div></div>
	<div id="toolsbar" class="toolsbar">
		<div class="refreshbtn hand"><img src="<%=request.getContextPath()%>/images/refresh.gif" title="Refresh" onclick="rxInbox.refresh();" id="refresh"></div>
		<div class="filterbtn hand"><img src="<%=request.getContextPath()%>/images/filter.gif"  title="Filter" onclick="rxInbox.showFilter();" id="filter"></div>
		<div style="position:absolute;right:10px;top:1px">
		<table>
			<tr>
				<td style="font-family:verdana;font-size: 10px">Show </td>
				<td><input type="text" title="Number of items to be showing" value="15" id="pageSize" value="1" name="pageSize" maxlength="3" size="3" style="text-align:center; font-weight:bold;height:15px;font-size: 10px;" onchange="rxInbox.refresh();"/></td>
			</tr>
		</table>
		</div>
	</div>
	<div id="inboxContainer" class="inboxContainer">
			<img src="<%=request.getContextPath()%>/images/loading.gif" id="loadImg" class="loadImg"/>
			<span id="error" class="error"></span>
			<div class="inbxDiv1" id="inbxDiv1">
				<div id="inbox" title="Right click on a record to get its History"></div>
			</div>
			<div id="historyContainer" class="historyContainer" onmousedown="javascript:if (document.getElementById('min').title == 'Minimize') rxInbox.DragAndDrop(this,event,'movebar');">
				<span class="titles inbxtitle" >History</span>
				<span class="titler hisminimize" onclick="rxInbox.minimizeHistory(this)" id="min" title="Minimize">-</span>
				<span class="titler hisclose" onclick="rxInbox.closeHistory()" title="Close">X</span>
				<table  height="25px" border="0" cellspacing="0" width="100%" id="movebar">
					<tr height="11px" class="titlrTr1" width="100%"><td width="100%" class="bordertopb" align="right"></td></tr>
					<tr height="14px" class="titlrTr2" width="100%"><td width="100%" class="borderbtmb"></td></tr>
				</table>
				<div class="inbxDiv2">
					<div id="history"></div>
				</div>
			</div>		
			<div id="filterContainer" class="filterContainer" onmousedown="rxInbox.DragAndDrop(this,event,'movebar2')" >
				<span class="titles my" >Inbox Filter</span>
				<table  height="25px" border="0" cellspacing="0" width="100%" id="movebar2">
					<tr height="11px" class="titlrTr1" width="100%"><td width="100%" class="bordertopb" align="right"></td></tr>
					<tr height="14px" class="titlrTr2" width="100%"><td width="100%" class="borderbtmb"></td></tr>
				</table>
				<div class="filterDiv">
					<table>
						<tr>
							<td>From Date : </td>
							<td><input type="text" size="20" class="filterBox" id="fromDate" ></td>
							<td><img src="<%=request.getContextPath()%>/images/calendaricon.gif" id="fromDateBtn" onclick="javascript:rxInbox.forDate='fromDate'" class="hand"/></td>
						</tr>
						<tr>
							<td>To Date : </td>
							<td><input type="text" size="20" class="filterBox" id="toDate" ></td>
							<td><img src="<%=request.getContextPath()%>/images/calendaricon.gif" id="toDateBtn" onclick="javascript:rxInbox.forDate='toDate'" class="hand"/></td>
						</tr>
						<tr>
    <td class="tdLabel"><label for="sender" class="label">Sender:</label></td>
    <td
><select name="" id="sender">
    <option value=""
    >----Select a sender-----</option>


</select></td>
</tr>

	<tr>
    <td class="tdLabel"><label for="task" class="label">Task:</label></td>
    <td>
    	<select name="" id="task">
    <option value=""
    >----Select a task-----</option>


</select></td>
</tr>

					</table>
					<div class="btndiv">
						<input type="button" value="   Filter   " onclick="rxInbox.filterInbox()"> &nbsp;&nbsp;
						<input type="button" value="   Close  " onclick="rxInbox.closeFilter()">
					</div>
				</div>				
			</div>			
		</div>
	</body>		
</html>
	<script type="text/javascript" src="/maa/commonyui/yui/yahoo-dom-event/yahoo-dom-event.js"></script>
	<script type="text/javascript" src="/maa/commonyui/yui/element/element-min.js"></script>
	<script type="text/javascript" src="/maa/commonyui/yui/yahoo/yahoo-min.js"></script> 
	<script type="text/javascript" src="/maa/commonyui/yui/json/json-min.js"></script>  
	<script type="text/javascript" src="/maa/commonyui/yui/event/event-min.js"></script>
	<script type="text/javascript" src="/maa/commonyui/yui/container/container_core-min.js"></script> 
	<script type="text/javascript" src="/maa/commonyui/yui/calendar/calendar-min.js"></script>
	<script type="text/javascript" src="/maa/commonyui/yui/connection/connection-min.js"></script> 		
	<script type="text/javascript" src="/maa/commonyui/yui/menu/menu-min.js"></script>	
	<script type="text/javascript" src="/maa/commonyui/yui/paginator/paginator-min.js"></script> 
	<script type="text/javascript" src="/maa/commonyui/yui/dragdrop/dragdrop-min.js"></script>	
	<script type="text/javascript" src="/maa/commonyui/yui/datasource/datasource-min.js"></script>	
	<script type="text/javascript" src="/maa/commonyui/yui/datatable/datatable-min.js"></script>
	<script type="text/javascript" src="/maa/javascripts/workflow/inbox.js"></script>
	<script type="text/javascript">
		var inboxData = "";
		var draftData = "";
		document.getElementById('inbox').style.display='none';	
	</script>
	