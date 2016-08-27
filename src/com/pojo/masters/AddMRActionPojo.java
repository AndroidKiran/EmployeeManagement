package com.pojo.masters;

import java.io.Serializable;
import java.util.Date;


public class AddMRActionPojo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	//private List<AddTerritoryActionPojo> territoryList;
	
	private String mode = ".";
	private Integer excelUpload = 0; //Do not change this value, this is initialize to 0 as to parse date in DaoImpl class.
	private Date dob_db;
	private Date doj_db;
	private String emp_name;
	private String dsg_id;
	private String emp_id;
	private String doj;
	private String dob;
	private Integer blood_grp_id;
	private String contact_no;
	private String email_id;
	private String emg_contact_no;
	private Boolean active;
	private	String address_1;
	private String address_2;
	private Integer city_id;
	private Integer state_Id;
	private String ter_id;
	private	String division_id;	
	private Integer regionId;
	private Integer seq_no;
	

	/*
	 * Getters and Setters 
	  */
	
	public Date getDob_db() {
		return dob_db;
	}
	public void setDob_db(Date dob_db) {
		this.dob_db = dob_db;
	}
	public Date getDoj_db() {
		return doj_db;
	}
	public void setDoj_db(Date doj_db) {
		this.doj_db = doj_db;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDsg_id() {
		return dsg_id;
	}
	public void setDsg_id(String dsg_id) {
		this.dsg_id = dsg_id;
	}
	
	public String getDoj() {
		return doj;
	}
	public void setDoj(String doj) {
		this.doj = doj;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	
	public String getContact_no() {
		return contact_no;
	}
	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}
	public String getEmg_contact_no() {
		return emg_contact_no;
	}
	public void setEmg_contact_no(String emg_contact_no) {
		this.emg_contact_no = emg_contact_no;
	}
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}
	public String getAddress_1() {
		return address_1;
	}
	public void setAddress_1(String address_1) {
		this.address_1 = address_1;
	}
	public String getAddress_2() {
		return address_2;
	}
	public void setAddress_2(String address_2) {
		this.address_2 = address_2;
	}
	public String getTer_id() {
		return ter_id;
	}
	public void setTer_id(String ter_id) {
		this.ter_id = ter_id;
	}
	public String getDivision_id() {
		return division_id;
	}
	public void setDivision_id(String division_id) {
		this.division_id = division_id;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public Integer getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
	public Integer getRegionId() {
		return regionId;
	}
	public void setRegionId(Integer regionId) {
		this.regionId = regionId;
	}
	public Integer getState_Id() {
		return state_Id;
	}
	public void setState_Id(Integer state_Id) {
		this.state_Id = state_Id;
	}
	public Integer getExcelUpload() {
		return excelUpload;
	}
	public void setExcelUpload(Integer excelUpload) {
		this.excelUpload = excelUpload;
	}
	public Integer getCity_id() {
		return city_id;
	}
	public void setCity_id(Integer city_id) {
		this.city_id = city_id;
	}
	public Integer getBlood_grp_id() {
		return blood_grp_id;
	}
	public void setBlood_grp_id(Integer blood_grp_id) {
		this.blood_grp_id = blood_grp_id;
	}

}
