package com.pojo.adminTransaction;

import java.io.Serializable;
import java.util.Date;

public class AdminTransactionPojo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String empId;
	private String tourDate;
	private Date tourDateDB;
	private String toDate;
	private Date toDateDB;
	
	private String ErrorMsg;
	
	
	/*
	 * Getters And Setters 
	  */
	
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public Date getToDateDB() {
		return toDateDB;
	}
	public void setToDateDB(Date toDateDB) {
		this.toDateDB = toDateDB;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getErrorMsg() {
		return ErrorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		ErrorMsg = errorMsg;
	}
	public Date getTourDateDB() {
		return tourDateDB;
	}
	public void setTourDateDB(Date tourDateDB) {
		this.tourDateDB = tourDateDB;
	}
	public String getTourDate() {
		return tourDate;
	}
	public void setTourDate(String tourDate) {
		this.tourDate = tourDate;
	}
	
	
}
