package com.pojo;

import java.io.Serializable;
import java.util.Date;

public class CreateUserActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer seq_no;
	private String firstName;
	private String middleName;
	private String lastName;
	private String empId;
	private String fromDate1;
	private String toDate1;
	private String fromDate;
	private String toDate;
	private String salutation;
	private String dob;
	
	private Date dob_db;
	private String userName;
	private String pwd;
	private String pwdReminder;
	private Boolean isActiveValue;
	private Integer roleId;
	private Date fromDate1_db;
	private Date toDate1_db;
	private Date fromDate_db;
	private Date toDate_db;
	private Boolean AJAX;
	
	
	private String errorMsg = null;
	
	/*For signature upload nothing has been done. In database also column is not created*/
	
	
	
	public String getDob() {
		return dob;
	}
	public String getUserName() {
		return userName;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public Date getDob_db() {
		return dob_db;
	}
	public void setDob_db(Date dob_db) {
		this.dob_db = dob_db;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getSalutation() {
		return salutation;
	}
	public void setSalutation(String salutation) {
		this.salutation = salutation;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwdReminder() {
		return pwdReminder;
	}
	public void setPwdReminder(String pwdReminder) {
		this.pwdReminder = pwdReminder;
	}
	
	
	public String getFromDate1() {
		return fromDate1;
	}
	public void setFromDate1(String fromDate1) {
		this.fromDate1 = fromDate1;
	}
	public String getToDate1() {
		return toDate1;
	}
	public void setToDate1(String toDate1) {
		this.toDate1 = toDate1;
	}
	
	public Boolean getIsActiveValue() {
		return isActiveValue;
	}
	public void setIsActiveValue(Boolean isActiveValue) {
		this.isActiveValue = isActiveValue;
	}
	public Integer getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public Date getFromDate1_db() {
		return fromDate1_db;
	}
	public void setFromDate1_db(Date fromDate1_db) {
		this.fromDate1_db = fromDate1_db;
	}
	public Date getToDate1_db() {
		return toDate1_db;
	}
	public void setToDate1_db(Date toDate1_db) {
		this.toDate1_db = toDate1_db;
	}
	public Date getFromDate_db() {
		return fromDate_db;
	}
	public void setFromDate_db(Date fromDate_db) {
		this.fromDate_db = fromDate_db;
	}
	public Date getToDate_db() {
		return toDate_db;
	}
	public void setToDate_db(Date toDate_db) {
		this.toDate_db = toDate_db;
	}
	public Boolean getAJAX() {
		return AJAX;
	}
	public void setAJAX(Boolean aJAX) {
		AJAX = aJAX;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	
	
	

}
