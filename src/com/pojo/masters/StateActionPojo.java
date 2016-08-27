package com.pojo.masters;

import java.io.Serializable;

public class StateActionPojo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer stateId;
	private String stateName;
	public Integer getStateId() {
		return stateId;
	}
	public void setStateId(Integer stateId) {
		this.stateId = stateId;
	}
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
