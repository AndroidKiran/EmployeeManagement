package com.pojo.medicalRepresentative;

import java.io.Serializable;
import java.util.Date;


public class TourPlanningActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String[] tourDateArray ;
	private String[] timeArray ;
	private String[] tourPurposeArray ;
	private String[] descArrayForDoc ;
	private String[] descArrayForChem ;
	
	
	private String tourPurpose ;
	private String time ;
	private Date tourDateDB;
	private String tourDate;
	private String descDoc;
	private String descChem;
	private Integer seq_no;
	private String userName;
	private String empId;
	private Boolean isCompleted;
	private Date createdDate;
	private Date updatedDate;
	private Date toDate;		//for search of TP for Admin.
	
	private String dispResult = null;
	private String dateFromDB;
	
	
	
	
	public String[] getTourPurposeArray() {
		return tourPurposeArray;
	}
	public void setTourPurposeArray(String[] tourPurposeArray) {
		this.tourPurposeArray = tourPurposeArray;
	}
	
	public String[] getDescArrayForDoc() {
		return descArrayForDoc;
	}
	public void setDescArrayForDoc(String[] descArrayForDoc) {
		this.descArrayForDoc = descArrayForDoc;
	}
	public String[] getDescArrayForChem() {
		return descArrayForChem;
	}
	public void setDescArrayForChem(String[] descArrayForChem) {
		this.descArrayForChem = descArrayForChem;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String[] getTourDateArray() {
		return tourDateArray;
	}
	public void setTourDateArray(String[] tourDateArray) {
		this.tourDateArray = tourDateArray;
	}
	
	
	public String getDispResult() {
		return dispResult;
	}
	public String getTourPurpose() {
		return tourPurpose;
	}
	public void setTourPurpose(String tourPurpose) {
		this.tourPurpose = tourPurpose;
	}
	public Date getTourDateDB() {
		return tourDateDB;
	}
	public void setTourDateDB(Date tourDateDB2) {
		this.tourDateDB = tourDateDB2;
	}
	public String getTourDate() {
		return tourDate;
	}
	public void setTourDate(String tourDate) {
		this.tourDate = tourDate;
	}
	
	public String getDescDoc() {
		return descDoc;
	}
	public void setDescDoc(String descDoc) {
		this.descDoc = descDoc;
	}
	public String getDescChem() {
		return descChem;
	}
	public void setDescChem(String descChem) {
		this.descChem = descChem;
	}
	public Integer getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public Boolean getIsCompleted() {
		return isCompleted;
	}
	public void setIsCompleted(Boolean isCompleted) {
		this.isCompleted = isCompleted;
	}
	public void setDispResult(String dispResult) {
		this.dispResult = dispResult;
	}
	public String getDateFromDB() {
		return dateFromDB;
	}
	public void setDateFromDB(String dateFromDB) {
		this.dateFromDB = dateFromDB;
	}
	public String[] getTimeArray() {
		return timeArray;
	}
	public void setTimeArray(String[] timeArray) {
		this.timeArray = timeArray;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
}
