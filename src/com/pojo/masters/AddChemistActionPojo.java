package com.pojo.masters;

import java.io.Serializable;

public class AddChemistActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer chemist_id ;
	private String  contact_no;
	private String  chemist_name;
	private String  ter_id;
	private String  email_id;
	private Boolean  active;
	private String  address_1;
	private String  address_2;
	private Integer  city_id;
	private Integer  state_id;
	
	
	public Integer getChemist_id() {
		return chemist_id;
	}
	public void setChemist_id(Integer chemist_id) {
		this.chemist_id = chemist_id;
	}
	public String getChemist_name() {
		return chemist_name;
	}
	public void setChemist_name(String chemist_name) {
		this.chemist_name = chemist_name;
	}
	public String getTer_id() {
		return ter_id;
	}
	public void setTer_id(String ter_id) {
		this.ter_id = ter_id;
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
	public Integer getState_id() {
		return state_id;
	}
	public void setState_id(Integer state_id) {
		this.state_id = state_id;
	}
	public Integer getCity_id() {
		return city_id;
	}
	public void setCity_id(Integer city_id) {
		this.city_id = city_id;
	}
	public String getContact_no() {
		return contact_no;
	}
	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}
	
}
