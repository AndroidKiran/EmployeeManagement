
/*function validateUserName(form) {
	if (document.getElementById('userName').value != "") {
		alert("Checking uniqueness of User Name");
		document.form.action='/maa/uniqueCheck';
		document.form.submit();
		
		document.getElementById('userName').value = "";
		
		document.getElementById('userName').focus();
		return false;
	} else {
		return true;
	}
}
*/

function validateUserName(pwdObj) {
	if (pwdObj.value == '') {
		return true;
	}
	var ajaxRequest = initiateRequest();
	//alert("Here in validateUserName----1");
	ajaxRequest.onreadystatechange = function () {
		//alert("Here in validateUserName----2");
		if (ajaxRequest.readyState == 4) {
			//alert("Here in validateUserName----3");
			if (ajaxRequest.status == 200) {
				
				//alert("Here in validateUserName----4");
				var response = ajaxRequest.responseText;
				//alert(response);
				if (response)
			{
					//alert("Here in validateUserName----5");
					document.getElementById('userInfo').innerHTML = "<font color='green'>User Name Available.</font>";
				} else {
					//alert("Here in validateUserName----6");
					//document.getElementById('userName').value="";
					document.getElementById('userName').focus();
					document.getElementById('userInfo').innerHTML = "<font color='red'>User Name Not Available.</font>";
				}
			}
		}
	}; 
	ajaxRequest.open("GET", "/maa/uniqueCheck?"+"AJAX=true&userName="+pwdObj.value, true);		
	ajaxRequest.send(null);
}


function validatePwd() {
	if (document.getElementById('pwd').value != document.getElementById('retypePwd').value) {
		alert("Password and Repeat Password values should be same");
		document.getElementById('pwd').value = "";
		document.getElementById('retypePwd').value = "";
		document.getElementById('pwd').focus();
		return false;
	} else {
		return true;
	}
}

/*function bodyonload() {
	document.getElementById('roleId').value = "";
	//document.getElementById('fromDate1').value = "";
	//document.getElementById('toDate1').value = "";
	document.getElementById('firstName').value = "";
	document.getElementById('middleName').value = "";
	document.getElementById('lastName').value = "";
	//document.getElementById('fromDate').value = "";
	//document.getElementById('toDate').value = "";
	document.getElementById('salutation').value = "";
	document.getElementById('pwd').value = "";
	document.getElementById('retypePwd').value = "";
	document.getElementById('pwdReminder').value = "";
	document.getElementById('userName').value = "";
	//document.getElementById('dob').value = "";
}*/
/*function validateUser() {
	
	alert("In validateUser");
	
	//var temp = validateUserForm(form);
	
	if (temp == false) {
		alert("Please Fill mandatory fields");
		return false;
	}
	
	var row = document.getElementById("reason_table").rows.length;
	if (row > 1) {
		for (var i = 0; i < row; i++) {
			for (var j = i + 1; j < row; j++) {
				if (i != j) {
					if (document.getElementsByName('roleId')[i].value == document.getElementsByName('roleId')[j].value) {
						alert("Duplicate selection of Role!!!");
						document.getElementsByName('roleId')[j].focus();
						return false;
					}
				}
			}
		}
		if (document.getElementsByName('roleId')[row - 1].value == "") {
			alert("Please select Role");
			document.getElementsByName('roleId')[row - 1].focus();
			return false;
		}*/
/*		if (document.getElementsByName('fromDate1')[row - 1].value == "") {
			alert("Please enter Role Date of Joining");
			document.getElementsByName('fromDate1')[row - 1].focus();
			return false;
		}
		if (document.getElementsByName('fromDate1')[row - 1].value != "" && document.getElementsByName('toDate1')[row - 1].value != "") {
			rTF = checkFdateTdate(document.getElementsByName('fromDate1')[row - 1].value, document.getElementsByName('toDate1')[row - 1].value);
			if (rTF == false) {
				alert("Role From Date should be less than or equal to Role To Date");
				document.getElementsByName('fromDate1')[row - 1].value = "";
				return false;
			}
		}
	} else {
		if (document.getElementById('fromDate1').value != "" && document.getElementById('roleId').value == "") {
			alert("Please select Role");
			document.getElementById('roleId').focus();
			return false;
		}
		if (document.getElementById('roleId') != "") {
			if (document.getElementById('fromDate1').value == "") {
				alert("Please enter Role From Date");
				document.getElementById('fromDate1').focus();
				return false;
			}
			if (document.getElementById('fromDate1').value != "" && document.getElementById('toDate1').value != "") {
				rTF = checkFdateTdate(document.getElementById('fromDate1').value, document.getElementById('toDate1').value);
				if (rTF == false) {
					alert("Role From Date should be less than or equal to Role To Date");
					document.getElementById('fromDate1').value = "";
					return false;
				}
			}
		}
	}
	if (document.getElementById('fromDate').value == "") {
		alert("Please enter Date of Joining");
		document.getElementById('fromDate').focus();
		return false;
	}
	if (document.getElementById('fromDate').value != "" && document.getElementById('toDate').value != "") {
		rTF = checkFdateTdate(document.getElementById('fromDate').value, document.getElementById('toDate').value);
		if (rTF == false) {
			alert("Date of Joining should be less than or equal to Date of Relieving");
			document.getElementById('fromDate').value = "";
			return false;
		}
	}
	if (document.getElementById('userName').value != "") {
		if (!isNaN(document.getElementById('userName').value)) {
			alert("User Name can not be a numeric value.");
			document.getElementById('userName').value = "";
			document.getElementById('userName').focus();
			return false;
		}
	}*/
	
	/*if (document.getElementById("isActiveValue").checked) {
		document.getElementById('isActive').value = 1;
	} else {
		document.getElementById('isActive').value = 0;
	}
	
	
	
	
	return true;
}*/
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
function addRole() {
	var row = document.getElementById("reason_table").rows.length;
	if (row == 1) {
		if (document.getElementById('roleId').value == "") {
			alert("Please select Role ");
			document.getElementById('roleId').focus();
			return false;
		}
		/*if (document.getElementById('fromDate1').value == "") {
			alert("Please enter Role From Date");
			document.getElementById('fromDate1').focus();
			return false;
		}
		if (document.getElementById('fromDate1').value != "" && document.getElementById('toDate1').value != "") {
			rTF = checkFdateTdate(document.getElementById('fromDate1').value, document.getElementById('toDate1').value);
			if (rTF == false) {
				alert("Role From Date should be less than or equal to Role To Date");
				document.getElementById('fromDate1').value = "";
				return false;
			}
		}*/
	} else {
		if (row > 1) {
			for (var i = 0; i < row; i++) {
				for (var j = i + 1; j < row; j++) {
					if (i != j) {
						if (document.getElementsByName('roleId')[i].value == document.getElementsByName('roleId')[j].value) {
							alert("Duplicate selection of Role!!!");
							document.getElementsByName('roleId')[j].focus();
							return false; 
						}
					}
				}
			}
			if (document.getElementsByName('roleId')[row - 1].value == "") {
				alert("Please select Role");
				document.getElementsByName('roleId')[row - 1].focus();
				return false;
			}
			/*if (document.getElementsByName('fromDate1')[row - 1].value == "") {
				alert("Please enter Role From Date");
				document.getElementsByName('fromDate1')[row - 1].focus();
				return false;
			}
			if (document.getElementsByName('fromDate1')[row - 1].value != "" && document.getElementsByName('toDate1')[row - 1].value != "") {
				rTF = checkFdateTdate(document.getElementsByName('fromDate1')[row - 1].value, document.getElementsByName('toDate1')[row - 1].value);
				if (rTF == false) {
					alert("Role From Date should be less than or equal to Role To Date");
					document.getElementsByName('fromDate1')[row - 1].value = "";
					return false;
				}
			}*/
		}
	}
	var tbl = document.getElementById("reason_table");
	var tbody = tbl.tBodies[0];
	var lastRow = tbl.rows.length;
	var rowObj = document.getElementById("reasonrow").cloneNode(true);
	tbody.appendChild(rowObj);
	document.getElementsByName('roleId')[lastRow].value = "";
	//document.getElementsByName('fromDate1')[lastRow].value = "";
	//document.getElementsByName('toDate1')[lastRow].value = "";
}
function checkFdateTdate(fromDate, toDate) {	//ENTERED DATE FORMAT MM/DD/YYYY

	if (fromDate.substr(6, 4) > toDate.substr(6, 4)) {
		return false;
	} else {
		if (fromDate.substr(6, 4) == toDate.substr(6, 4)) {
			if (fromDate.substr(3, 2) > toDate.substr(3, 2)) {
				return false;
			} else {
				if (fromDate.substr(3, 2) == toDate.substr(3, 2)) {
					if (fromDate.substr(0, 2) > toDate.substr(0, 2)) {
						return false;
					} else {
						return true;
					}
				} else {
					return true;
				}
			}
		} else {
			return true;
		}
	}
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

