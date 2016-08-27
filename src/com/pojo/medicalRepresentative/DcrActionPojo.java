package com.pojo.medicalRepresentative;

import java.io.Serializable;
import java.util.Date;

public class DcrActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;

	public String[]  tourDateArray;
	public String  tourDate;
	
	private Integer[] timeArray ;
	private Integer time ;
	
	private Integer[] descArrayForDoc ;
	private Integer descDoc;
	
	private Integer[] descArrayForChem ;
	private Integer descChem;
	
	private Integer[] workTypeArray ;
	private Integer workType;
	
	private Integer[] workedWithArray ;
	private Integer workedWith;
	
	private Integer[] topicDissArray ;
	private Integer topicDiss;
	
	private String[] nxtVisitArray ;
	private String nxtVisit;
	
	private String[] remarksArray ;
	private String remarks ;
	
	
	
	
	private Date  tourDateDB;
	private Date  nxtVisitDB;
	private String userName;
	private Integer seq_no;
	private Date createdDate;
	private String createdDateStr;
	private String EmpId;
	
	private Integer excelUpload = 0; // Do not change this value, as 1 indicates excel sheet upload
	//private Integer[] seq_no_tourPOJOArray;
	
	
	public String[] getTourDateArray() {
		return tourDateArray;
	}
	public void setTourDateArray(String[] tourDateArray) {
		this.tourDateArray = tourDateArray;
	}
	public Integer[] getTimeArray() {
		return timeArray;
	}
	public void setTimeArray(Integer[] timeArray) {
		this.timeArray = timeArray;
	}
	public String[] getRemarksArray() {
		return remarksArray;
	}
	public void setRemarksArray(String[] remarksArray) {
		this.remarksArray = remarksArray;
	}
		
	public Integer getTime() {
		return time;
	}
	public void setTime(Integer time) {
		this.time = time;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Integer getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTourDate() {
		return tourDate;
	}
	public void setTourDate(String tourDate) {
		this.tourDate = tourDate;
	}
	public Date getTourDateDB() {
		return tourDateDB;
	}
	public void setTourDateDB(Date tourDateDB) {
		this.tourDateDB = tourDateDB;
	}
	/*public TourPlanningActionPojo getTourPlanningPOJO() {
		return tourPlanningPOJO;
	}
	public void setTourPlanningPOJO(TourPlanningActionPojo tourPlanningPOJO) {
		this.tourPlanningPOJO = tourPlanningPOJO;
	}*/
	public String getEmpId() {
		return EmpId;
	}
	public void setEmpId(String empId) {
		EmpId = empId;
	}
	public Integer[] getDescArrayForDoc() {
		return descArrayForDoc;
	}
	public void setDescArrayForDoc(Integer[] descArrayForDoc) {
		this.descArrayForDoc = descArrayForDoc;
	}
	public Integer getDescDoc() {
		return descDoc;
	}
	public void setDescDoc(Integer descDoc) {
		this.descDoc = descDoc;
	}
	public Integer[] getDescArrayForChem() {
		return descArrayForChem;
	}
	public void setDescArrayForChem(Integer[] descArrayForChem) {
		this.descArrayForChem = descArrayForChem;
	}
	public Integer getDescChem() {
		return descChem;
	}
	public void setDescChem(Integer descChem) {
		this.descChem = descChem;
	}
	public Integer[] getWorkTypeArray() {
		return workTypeArray;
	}
	public void setWorkTypeArray(Integer[] workTypeArray) {
		this.workTypeArray = workTypeArray;
	}
	public Integer getWorkType() {
		return workType;
	}
	public void setWorkType(Integer workType) {
		this.workType = workType;
	}
	public Integer[] getWorkedWithArray() {
		return workedWithArray;
	}
	public void setWorkedWithArray(Integer[] workedWithArray) {
		this.workedWithArray = workedWithArray;
	}
	public Integer getWorkedWith() {
		return workedWith;
	}
	public void setWorkedWith(Integer workedWith) {
		this.workedWith = workedWith;
	}
	public Integer[] getTopicDissArray() {
		return topicDissArray;
	}
	public void setTopicDissArray(Integer[] topicDissArray) {
		this.topicDissArray = topicDissArray;
	}
	public Integer getTopicDiss() {
		return topicDiss;
	}
	public void setTopicDiss(Integer topicDiss) {
		this.topicDiss = topicDiss;
	}
	public String[] getNxtVisitArray() {
		return nxtVisitArray;
	}
	public void setNxtVisitArray(String[] nxtVisitArray) {
		this.nxtVisitArray = nxtVisitArray;
	}
	public String getNxtVisit() {
		return nxtVisit;
	}
	public void setNxtVisit(String nxtVisit) {
		this.nxtVisit = nxtVisit;
	}
	public Date getNxtVisitDB() {
		return nxtVisitDB;
	}
	public void setNxtVisitDB(Date nxtVisitDB) {
		this.nxtVisitDB = nxtVisitDB;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getCreatedDateStr() {
		return createdDateStr;
	}
	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}
	public Integer getExcelUpload() {
		return excelUpload;
	}
	public void setExcelUpload(Integer excelUpload) {
		this.excelUpload = excelUpload;
	}
	
	/*public Integer[] getSeq_no_tourPOJOArray() {
		return seq_no_tourPOJOArray;
	}
	public void setSeq_no_tourPOJOArray(Integer[] seq_no_tourPOJOArray) {
		this.seq_no_tourPOJOArray = seq_no_tourPOJOArray;
	}*/
	
	
}
