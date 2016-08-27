

/*
function bodyonload() {
	document.getElementById('tourPurposeArray').value = "";
	document.getElementById('tourDateArray').value = "";
	document.getElementById('descArray').value = "";

}*/


function validateTP() {
	var row = document.getElementById("reason_table").rows.length;
	/*if (row > 1) {
		for (var i = 0; i < row; i++) {
			for (var j = i + 1; j < row; j++) {
				if (i != j) {
					if (document.getElementsByName('tourPurposeArray')[i].value == document.getElementsByName('tourPurposeArray')[j].value) {
						alert("Duplicate selection of Role!!!");
						document.getElementsByName('tourPurposeArray')[j].focus();
						return false;
					}
					
				}
			}
		}*/
		if (document.getElementsByName('tourPurposeArray')[row - 1].value == "") {
			alert("Please select Tour Purpose");
			document.getElementsByName('tourPurposeArray')[row - 1].focus();
			return false;
		}
		
		
		if (document.getElementsByName('tourDateArray')[row - 1].value == "") {
			alert("Please enter Tour Date");
			document.getElementsByName('tourDateArray')[row - 1].focus();
			return false;
		}
		/*if (document.getElementsByName('descArray')[row - 1].value == "") {
			alert("Please Select Description for Tour...Ex : Either Doctor Name or Chemist Name etc...");
			document.getElementsByName('descArray')[row - 1].focus();
			return false;
		}*/
		
		/*if (document.getElementsByName('tourDateArray')[row - 1].value != "" && document.getElementsByName('toDate1')[row - 1].value != "") {
			rTF = checkFdateTdate(document.getElementsByName('tourDateArray')[row - 1].value, document.getElementsByName('toDate1')[row - 1].value);
			if (rTF == false) {
				alert("Role From Date should be less than or equal to Role To Date");
				document.getElementsByName('tourDateArray')[row - 1].value = "";
				return false;
			}
			
		}
	} else {
		if (document.getElementById('tourDateArray').value != "" && document.getElementById('tourPurposeArray').value == "0") {
			alert("Please select Role");
			document.getElementById('tourPurposeArray').focus();
			return false;
		}*/
		
		if (document.getElementById('tourPurposeArray') != "") {
			if (document.getElementById('tourDateArray').value == "") {
				alert("Please enter Tour Date");
				document.getElementById('tourDateArray').focus();
				return false;
			}
			
			/*if (document.getElementById('tourDateArray').value != "" && document.getElementById('toDate1').value != "") {
				rTF = checkFdateTdate(document.getElementById('tourDateArray').value, document.getElementById('toDate1').value);
				if (rTF == false) {
					alert("Role From Date should be less than or equal to Role To Date");
					document.getElementById('tourDateArray').value = "";
					return false;
				}
				
			}
		}*/
	}
		
	return true;
}
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

function resetValues(){
	
	document.getElementById('descArrayForChem').removeAttribute("disabled");
	document.getElementById('descArrayForDoc').removeAttribute("disabled");
	
	return true;
	
	
}

function addRole() {
	
	var row = document.getElementById("reason_table").rows.length;
	
	if (row == 1) {
		if (document.getElementById('tourPurposeArray').value == "") {
			alert("Please select Tour Purpose ");
			document.getElementById('tourPurposeArray').focus();
			return false;
		}
		if (document.getElementById('tourDateArray').value == "") {
			alert("Please enter Tour Date");
			document.getElementById('tourDateArray').focus();
			return false;
		}
		/*if (document.getElementById('tourDateArray').value != "") {
			rTF = checkFdateTdate(document.getElementById('tourDateArray').value, document.getElementById('toDate1').value);
			if (rTF == false) {
				alert("Role From Date should be less than or equal to Role To Date");
				document.getElementById('tourDateArray').value = "";
				return false;
			}
		}*/
	} else {
		if (row > 1) {
			/*for (var i = 0; i < row; i++) {
				for (var j = i + 1; j < row; j++) {
					if (i != j) {
						if (document.getElementsByName('tourPurposeArray')[i].value == document.getElementsByName('tourPurposeArray')[j].value) {
							alert("Duplicate selection of Role!!!");
							document.getElementsByName('tourPurposeArray')[j].focus();
							return false; 
						}
					}
				}
			}*/
			
			document.getElementById('selectedItem').innerHTML = "";
			
			if (document.getElementsByName('tourPurposeArray')[row - 1].value == "") {
				alert("Please select Tour Purpose");
				document.getElementsByName('tourPurposeArray')[row - 1].focus();
				return false;
			}
			if (document.getElementsByName('tourDateArray')[row - 1].value == "") {
				alert("Please enter Tour Date");
				document.getElementsByName('tourDateArray')[row - 1].focus();
				return false;
			}
			/*if (document.getElementsByName('tourDateArray')[row - 1].value != "" && document.getElementsByName('toDate1')[row - 1].value != "") {
				rTF = checkFdateTdate(document.getElementsByName('tourDateArray')[row - 1].value, document.getElementsByName('toDate1')[row - 1].value);
				if (rTF == false) {
					alert("Role From Date should be less than or equal to Role To Date");
					document.getElementsByName('tourDateArray')[row - 1].value = "";
					return false;
				}
			}*/
		}
	}
	//bodyonload();
	var tbl = document.getElementById("reason_table");
	var tbody = tbl.tBodies[0];
	var lastRow = tbl.rows.length;
	alert("Last row = "+lastRow);
	var rowObj = document.getElementById("reasonrow").cloneNode(true);
	tbody.appendChild(rowObj);
	document.getElementsByName('tourPurposeArray')[lastRow].value = "";
	document.getElementsByName('tourDateArray')[lastRow].value = "";
	document.getElementsByName('descArrayForDoc')[lastRow].value = "";
	document.getElementsByName('descArrayForDoc')[lastRow].removeAttribute("disabled");
	document.getElementsByName('descArrayForChem')[lastRow].value = "";
	document.getElementsByName('descArrayForChem')[lastRow].removeAttribute("disabled");
}

function trimText1(obj, value) {
	value = value;
	if (value != undefined) {
		while (value.charAt(value.length - 1) == " ") {
			value = value.substring(0, value.length - 1);
		}
		while (value.substring(0, 1) == " ") {
			value = value.substring(1, value.length);
		}
		obj.value = value;
	}
	return value;
}

