package com.pojo.masters;

import java.io.Serializable;

public class CreateRoleActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer roleId;
	private String roleName;
	private String roleDesc;
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleDesc() {
		return roleDesc;
	}
	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}
	
	
	
	

}
