package com.pojo;

import java.io.Serializable;

public class LoginActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String j_username;
	private String j_password;
	private String empId;
	private Integer seq_no;
	private Integer roleId;
	
	private String setLabel = "";
	
	
	public String getJ_username() {
		return j_username;
	}
	public void setJ_username(String j_username) {
		this.j_username = j_username;
	}
	public String getJ_password() {
		return j_password;
	}
	public void setJ_password(String j_password) {
		this.j_password = j_password;
	}
	public String getSetLabel() {
		return setLabel;
	}
	public void setSetLabel(String setLabel) {
		this.setLabel = setLabel;
	}
	public Integer getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}	
}
