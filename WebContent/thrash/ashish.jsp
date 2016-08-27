
<script>
 	moduleNames['0'] =  'Administration';
 	baseUrls['0'] =  'maa';
</script>
	<dt style="background-image: none" onclick="prepareApplicationBar('1','Administration','/maa')">Administration</dt>
													

function prepareApplicationBar(parentId, appName, baseURL) {
	document.getElementById("BASEURL").value = baseURL.substring(baseURL.lastIndexOf("/") + 1, baseURL.length);
	var url = "../common/homepage!getAllModules.action?parentId=" + parentId+"&rnd="+Math.random();
	var callback = {success:function (oResponse) {
		document.getElementById("accordion3").style.display = "block";
		document.getElementById("accordion4").style.display = "none";
		document.getElementById("accordion4head").innerHTML = "<img src='../images/actionBack.gif' style='margin-right:6px'/>"+appName;
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
	var url = "../common/homepage!getAllModules.action?parentId=" + parentIdn + "&baseURL=" + baseURL+"&rnd="+Math.random();
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
				if (modules[i].IsFavourite == 'true') {
					img = document.createElement('img');
					img.setAttribute('src','../html/common/image/ficon1.gif');
					img.setAttribute('title','Remove from Favourites');
					img.className = 'pointer';
					img.setAttribute('id','favimg'+modules[i].ModuleId);
					YAHOO.util.Event.addListener(img.id, "click", removeFromFavourites);
				} else {
					img = document.createElement('img');
					img.setAttribute('src','../html/common/image/ficon2.gif');
					img.setAttribute('title','Add to Favourites');
					img.className = 'pointer';
					img.setAttribute('id','favimg'+modules[i].ModuleId);
					YAHOO.util.Event.addListener(img.id, "click", addToFavourites);
				}
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