package com.pojo.masters;

import java.io.Serializable;

public class DesignationActionPojo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer dsgId;
	private String dsgName;
	public Integer getDsgId() {
		return dsgId;
	}
	public void setDsgId(Integer dsgId) {
		this.dsgId = dsgId;
	}
	public String getDsgName() {
		return dsgName;
	}
	public void setDsgName(String dsgName) {
		this.dsgName = dsgName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
