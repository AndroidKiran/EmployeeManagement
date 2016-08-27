package com.pojo.masters;

import java.io.Serializable;

public class TimeActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer timeId;
	private String time;
	
	public Integer getTimeId() {
		return timeId;
	}
	public void setTimeId(Integer timeId) {
		this.timeId = timeId;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
