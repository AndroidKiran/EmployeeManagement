package com.pojo.masters;

import java.io.Serializable;
import java.util.List;

public class AddDoctorActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	//private List<AddTerritoryActionPojo> territoryList;
	//private List<AddCategoryActionPojo> categoryList;
	
	private Integer doc_id;
	private String contact_no;
	private String  doctor_name;
	private String  specialisation;
	private String  designation;
	private String  qualification;
	private String  ter_id;
	private String  cat_id;
	private String  email_id;
	private Boolean  active;
	private String  address_1;
	private String  address_2;
	private Integer  city_id;
	private Integer  state_id;
	private String ErrorMsg;
	//private Integer seq_no;
	

	/*public List<AddCategoryActionPojo> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<AddCategoryActionPojo> categoryList) {
		this.categoryList = categoryList;
	}
	public List<AddTerritoryActionPojo> getTerritoryList() {
		return territoryList;
	}
	public void setTerritoryList(List<AddTerritoryActionPojo> territoryList) {
		this.territoryList = territoryList;
	}
	
	public Integer getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
*/
	public String getContact_no() {
		return contact_no;
	}
	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}
	public String getDoctor_name() {
		return doctor_name;
	}
	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}
	public String getSpecialisation() {
		return specialisation;
	}
	public void setSpecialisation(String specialisation) {
		this.specialisation = specialisation;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getTer_id() {
		return ter_id;
	}
	public void setTer_id(String ter_id) {
		this.ter_id = ter_id;
	}
	public String getCat_id() {
		return cat_id;
	}
	public void setCat_id(String cat_id) {
		this.cat_id = cat_id;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
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
	public Integer getCity_id() {
		return city_id;
	}
	public void setCity_id(Integer city_id) {
		this.city_id = city_id;
	}
	public Integer getState_id() {
		return state_id;
	}
	public void setState_id(Integer state_id) {
		this.state_id = state_id;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Integer getDoc_id() {
		return doc_id;
	}
	public void setDoc_id(Integer doc_id) {
		this.doc_id = doc_id;
	}
	public String getErrorMsg() {
		return ErrorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		ErrorMsg = errorMsg;
	}
	
}

