package com.pojo;

import java.io.Serializable;

public class ChgPasswordActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String oldPwd;
	private String pwd;
	private String pwdReminder;
	private String j_username;
	private String j_password;
	public String getJ_password() {
		return j_password;
	}
	public void setJ_password(String j_password) {
		this.j_password = j_password;
	}
	private Integer seq_no;
	
	
	
	public Integer getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
	public String getJ_username() {
		return j_username;
	}
	public void setJ_username(String j_username) {
		this.j_username = j_username;
	}
	public String getOldPwd() {
		return oldPwd;
	}
	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
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
	

}
