package com.pojo.masters;

import java.io.Serializable;

public class CityActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer cityId;
	private String cityName;
	public Integer getCityId() {
		return cityId;
	}
	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
