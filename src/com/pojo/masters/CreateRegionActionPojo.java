package com.pojo.masters;

import java.io.Serializable;

public class CreateRegionActionPojo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String regionName;
	private String regionDesc;
	private Integer regId;
	
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	public String getRegionDesc() {
		return regionDesc;
	}
	public void setRegionDesc(String regionDesc) {
		this.regionDesc = regionDesc;
	}
	public Integer getRegId() {
		return regId;
	}
	public void setRegId(Integer regId) {
		this.regId = regId;
	}
	
	

}
