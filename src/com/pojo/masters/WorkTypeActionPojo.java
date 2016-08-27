package com.pojo.masters;

import java.io.Serializable;

public class WorkTypeActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer workTypeId;
	private String workTypeName;
	public Integer getWorkTypeId() {
		return workTypeId;
	}
	public void setWorkTypeId(Integer workTypeId) {
		this.workTypeId = workTypeId;
	}
	public String getWorkTypeName() {
		return workTypeName;
	}
	public void setWorkTypeName(String workTypeName) {
		this.workTypeName = workTypeName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
