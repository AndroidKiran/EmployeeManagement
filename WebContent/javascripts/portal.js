
/*
var local_key="ABQIAAAAtbk-RyspW0lCYKWTiVsURRT2yXp_ZAY8_ufC3CFXhHIE1NvwkxT8q2Gmil2f8XTW7xQ9AurAhv_T4w"
var remote_key="ABQIAAAAtbk-RyspW0lCYKWTiVsURRTu-lqTQF55wd5QvdC4VLAb3ES68hTIVzljNhi4_xLX_SoL299ws_rVtw"
*/
function MM_openBrWindow(theURL, winName, features) { //v2.0
	window.open(theURL, winName, features);
}
function MM_goToURL() { //v3.0
	var i, args = MM_goToURL.arguments;
	document.MM_returnValue = false;
	for (i = 0; i < (args.length - 1); i += 2) {
		eval(args[i] + ".location='" + args[i + 1] + "'");
	}
}
function MM_showHideLayers() { //v9.0
	var i, p, v, obj, args = MM_showHideLayers.arguments;
	for (i = 0; i < (args.length - 2); i += 3) {
		with (document) {
			if (getElementById && ((obj = getElementById(args[i])) != null)) {
				v = args[i + 2];
				if (obj.style) {
					obj = obj.style;
					v = (v == "show") ? "visible" : (v == "hide") ? "hidden" : v;
				}
				obj.visibility = v;
			}
		}
	}
}
function MM_callJS(jsStr) { //v2.0
	return eval(jsStr);
}
function show(x) {
	if (document.getElementById(x).style.display == "none") {
		document.getElementById(x).style.display = "";
	} else {
		document.getElementById(x).style.display = "none";
	}
}
function loadImage() {
	img1 = new Image();
	img2 = new Image();
	img3 = new Image();
	img4 = new Image();
	url = document.location.toString().substring(0, document.location.toString().lastIndexOf("common"));
	img1.src = url + "html/common/image/sm1.gif";
	img2.src = url + "html/common/image/sm2.gif";
	img3.src = url + "html/common/image/ficon1.gif";
	img4.src = url + "html/common/image/ficon2.gif";
}
function MM_preloadImages() { //v3.0
	var d = document;
	if (d.images) {
		if (!d.MM_p) {
			d.MM_p = new Array();
		}
		var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
		for (i = 0; i < a.length; i++) {
			if (a[i].indexOf("#") != 0) {
				d.MM_p[j] = new Image;
				d.MM_p[j++].src = a[i];
				alert(a[i]);
			}
		}
	}
}
var windows = new Array();
var winCnt = new Array();
var gblWinCnt = 0;
function PopupCenter(pageURL, title, w, h) {
	var left = (screen.width / 2) - (w / 2);
	var top = (screen.height / 2) - (h / 2);
	if (windows[title] && !windows[title].closed) {
		windows[title].focus();
	} else {
		winCnt[gblWinCnt++] = windows[title] = window.open(pageURL, title, "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=no, width=" + w + ", height=" + h + ", top=" + top + ", left=" + left);
	}
}
function PopupNewWindow(pageURL, title, w, h) {
	var load = window.open(pageURL, "", "scrollbars=yes,menubar=yes,height=500,width=600,resizable=yes,toolbar=yes,location=no,status=yes,alwaysLowered=yes");
}
function MM_jumpMenu(targ, selObj, restore) { //v3.0
	eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value + "'");
	if (restore) {
		selObj.selectedIndex = 0;
	}
}

function showInbox(obj) {
	var contentFrame = document.getElementById("inboxframe").contentWindow;
	if (obj.id == "inboxbtn") {
		contentFrame.egovInbox.from = "Inbox";
		contentFrame.egovInbox.refresh();
		} else if (obj.id == "draftbtn"){
		contentFrame.egovInbox.from = "Drafts";
		contentFrame.egovInbox.refresh();
	} else {
		contentFrame.egovInbox.from = "Notifications";
		contentFrame.egovInbox.refresh();
	}
}

function closeChildWindows() {
	for (var i = 0; i < winCnt.length; i++) {
		try {
			winCnt[i].close();
		}
		catch (e) {
		}
	}
	try {
		var winCntAry = document.getElementById("inboxframe").contentWindow.winCntAry;
		if (winCntAry) {
			for (var i = 0; i < winCntAry.length; i++) {
				try {
					winCntAry[i].close();
				}
				catch (e) {
				}
			}
		}
	}
	catch (e) {
	}
}

//prepareApplicationBar('1','Administration','/maa')

function prepareApplicationBar(parentId, appName, baseURL) {
	document.getElementById("BASEURL").value = baseURL.substring(baseURL.lastIndexOf("/") + 1, baseURL.length);
	var url = "getAllModules?parentId=" + parentId;
	var callback = {success:function (oResponse) {
		document.getElementById("accordion3").style.display = "block";
		document.getElementById("accordion4").style.display = "none";
		document.getElementById("accordion4head").innerHTML = "<img src='images/actionBack.gif' style='margin-right:6px'/>"+appName;
		var moduleSlider = document.getElementById("slider3");
		while (moduleSlider.hasChildNodes()) {
			moduleSlider.removeChild(moduleSlider.lastChild);
		}
		if (oResponse.responseText == "") {
			return;
		}
		var modules = eval("(" + oResponse.responseText + ")");
		for (var i = 0; i < modules.length; i++) {
			var dt = document.createElement("dt");
			var dd = document.createElement("dd");
			dt.innerHTML = modules[i].ModuleName;
			dt.setAttribute("id", "dt#" + modules[i].ModuleId);
			dd.setAttribute("id", "dd" + modules[i].ModuleId);
			dt.setAttribute("onclick", "populateSubmodules(event,\"" + baseURL + "\");");
			moduleSlider.appendChild(dt);
			moduleSlider.appendChild(dd);
			YAHOO.util.Event.addListener(dt, "click", populateSubmodules, baseURL);
		}
		slider3.init("slider3",100,"open");
		document.getElementById("homebtn").style.display = "inline";
	}, failure:function (oResponse) {
	}, argument:{}, timeout:30000};
	YAHOO.util.Connect.asyncRequest("GET", url, callback);
}
function populateSubmodules(event, baseURL) {
	var parentId;
	if (!document.all) {
		parentId = event.currentTarget.id;
	} else {
		parentId = event.srcElement.id;
	}
	var parentIdn = parentId.split("#")[1];
	var url = "/maa/getAllModules.action?parentId=" + parentIdn + "&baseURL=" + baseURL;
	var callback = {success:function (oResponse) {
		if (oResponse.responseText == "") {
			return;
		}
		var modules = eval("(" + oResponse.responseText + ")");
		var table = document.createElement("table");
		table.setAttribute("width", "100%");
		table.setAttribute("height", "100%");
		table.setAttribute("id", "nodetable");
		var span = document.createElement("span");
		var moduleSlider = document.getElementById("dd" + parentIdn);
		moduleSlider.style.height = "100%";
		moduleSlider.style.overflow = 'auto';
		for (var i = 0; i < modules.length; i++) {
			var tr = document.createElement("tr");
			var tr2 = document.createElement("tr");
			var td = document.createElement("td");
			var td2 = document.createElement("td");
			var a = null;
			var img;
			if (modules[i].ModuleURL != "") {
				if (document.all) {
					try {
						//IE8 and below
						a = document.createElement("<a name='action'></a>");
					} catch (e) {
						//IE9 and above
						a = document.createElement("a");
						a.setAttribute("name", "action");
					}
				} else {
					a = document.createElement("a");
					a.setAttribute("name", "action");
				}
				a.setAttribute("onclick", "PopupCenter(\""+ modules[i].ModuleURL + "\", \"portalApp" + modules[i].ModuleId + "\", 850,600)");
				a.className = "buttonforaccord";
				
			} else {
				a = document.createElement("a");
				a.className = "normallink buttonforaccord";
			}
			a.setAttribute("id", modules[i].ModuleId);
			a.setAttribute("href", "javascript:void(0);");
			a.innerHTML = modules[i].ModuleName;
			if (img) {
				td.appendChild(img);
				td.appendChild(document.createTextNode('\u00A0'));
			}
			td.appendChild(a);
			tr.appendChild(td);
			table.appendChild(tr);
			if (modules[i].ModuleChild != "") {
				td2.innerHTML = modules[i].ModuleChild;
				tr2.appendChild(td2);
				table.appendChild(tr2);
			}
		}
		span.appendChild(table);
		try { moduleSlider.removeChild(moduleSlider.firstChild); } catch (e) { }
		moduleSlider.innerHTML = "<span>" + span.innerHTML + "</span>";
	}, failure:function (oResponse) {
	}, argument:{}, timeout:7000};
	if (document.getElementById("dd" + parentIdn).childNodes.length == 0) {
		YAHOO.util.Connect.asyncRequest("GET", url, callback);
	} else {
		document.getElementById("dd" + parentIdn).style.height = "100%";
	}
}
function showMainMenu() {
	document.getElementById("accordion3").style.display = "none";
	document.getElementById("accordion4").style.display = "block";
	document.getElementById("homebtn").style.display = "none";
}
var slider3 = new accordion.slider("slider3");

var linkNode = null;
function onTriggerContextMenu(event) {
	linkNode = this.contextEventTarget;
}

function showHelpMenu(toShow) {
	if (toShow) {
		document.getElementById('helpmenu').style.right  = '152px';
		if (document.all) {
			document.getElementById('helpmenu').style.top  = '24px';
		}
		document.getElementById('helpmenu').style.display  = 'block';
	} else {
		document.getElementById('helpmenu').style.display  = 'none';
	}
}


function heightLight(obj,on) {
	if(on) {
		obj.className = 'helpmenu_div helpHigh';
	} else {
		obj.className = 'helpmenu_div'
	}
}

var helpMenu = document.getElementById('helpmenu');
for (var i = 0; i < moduleNames.length;i++) {
	var div = document.createElement('ul');
	div.setAttribute('id',i+'help');
	div.className ='helpmenu_div';
	var args = new Array();
	args[0] = '/'+baseUrls[i]+'/help/Index.htm';
	args[1] = baseUrls[i];
	args[2] = 850;
	args[3] = 600;
	YAHOO.util.Event.addListener(div, "click", InterEventHandler,args);
	YAHOO.util.Event.addListener(div, "mouseover", InterEventHandler,true);
	YAHOO.util.Event.addListener(div, "mouseout", InterEventHandler,true);
	div.innerHTML = moduleNames[i];
	helpMenu.appendChild(div);
}

function InterEventHandler(eve,arg) {
	var event = window.event ? window.event : eve;
	if (eve.type == 'mouseover') {
		showHelpMenu(true);
		heightLight(eve.srcElement ? eve.srcElement : eve.currentTarget,true);
	}
	if(eve.type == 'click') {
		PopupCenter(arg[0],arg[1],arg[2],arg[3]);
	}

	if (eve.type == 'mouseout') {
		heightLight(eve.srcElement ? eve.srcElement : eve.currentTarget,false);
	}
}
function showSidebar(obj) {

	if (obj.src.indexOf('hide') > 0) {
		document.getElementById('sidebar').style.display='none';
		obj.src = 'images/show.gif';
		obj.title = 'Show';
	} else {
		document.getElementById('sidebar').style.display='';
		document.getElementById('sidebar').width = '240px';
		document.getElementById('sidebar').style.width = '240px';
		obj.src = 'images/hide.gif';
		obj.title = 'Hide';
	}
}


if (document.getElementById('accordion5')) {
	var slider5 = new accordion.slider("slider5");
	slider5.init("slider5");
	
}
if (document.getElementById('administration')) {
	var slider6 = new accordion.slider("slider6");
	slider6.init("slider6");
	
}
if (document.getElementById('medicalRepresentative')) {
	var slider7 = new accordion.slider("slider7");
	slider7.init("slider7");
	
}
if (document.getElementById('masters')) {
	var slider8 = new accordion.slider("slider8");
	slider8.init("slider8");
	
}
if (document.getElementById('transactions')) {
	var slider9 = new accordion.slider("slider9");
	slider9.init("slider9");
	
}



