package com.pojo.masters;

import java.io.Serializable;

public class BloodGroupActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer bloodGrpId;
	private String bloodGrpName;
	
	public Integer getBloodGrpId() {
		return bloodGrpId;
	}
	public void setBloodGrpId(Integer bloodGrpId) {
		this.bloodGrpId = bloodGrpId;
	}
	public String getBloodGrpName() {
		return bloodGrpName;
	}
	public void setBloodGrpName(String bloodGrpName) {
		this.bloodGrpName = bloodGrpName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
