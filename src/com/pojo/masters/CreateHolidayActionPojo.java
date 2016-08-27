package com.pojo.masters;

import java.io.Serializable;
import java.util.Date;

public class CreateHolidayActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer[] holidayRegionArr; 
	private String[] holidayDescArr;
	private String[] holidayDateArr;
	
	private Integer holidayRegion;
	private String holidayDesc;
	private Date holidayDateDB;
	private String holidayDate;
	private Integer seq_no;
	
	
	public Integer getHolidayRegion() {
		return holidayRegion;
	}
	public void setHolidayRegion(Integer holidayRegion) {
		this.holidayRegion = holidayRegion;
	}
	public String getHolidayDesc() {
		return holidayDesc;
	}
	public void setHolidayDesc(String holidayDesc) {
		this.holidayDesc = holidayDesc;
	}
	public Date getHolidayDateDB() {
		return holidayDateDB;
	}
	public void setHolidayDateDB(Date holidayDateDB) {
		this.holidayDateDB = holidayDateDB;
	}
	public String getHolidayDate() {
		return holidayDate;
	}
	public void setHolidayDate(String holidayDate) {
		this.holidayDate = holidayDate;
	}
	public Integer getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
	public Integer[] getHolidayRegionArr() {
		return holidayRegionArr;
	}
	public void setHolidayRegionArr(Integer[] holidayRegionArr) {
		this.holidayRegionArr = holidayRegionArr;
	}
	public String[] getHolidayDescArr() {
		return holidayDescArr;
	}
	public void setHolidayDescArr(String[] holidayDescArr) {
		this.holidayDescArr = holidayDescArr;
	}
	public String[] getHolidayDateArr() {
		return holidayDateArr;
	}
	public void setHolidayDateArr(String[] holidayDateArr) {
		this.holidayDateArr = holidayDateArr;
	}
	
	

}
