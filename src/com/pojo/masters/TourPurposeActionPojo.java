package com.pojo.masters;

import java.io.Serializable;

public class TourPurposeActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String tourPurposeName;
	private Integer tourPurposeId;
	/**
	 * @return the tourPurposeName
	 */
	public String getTourPurposeName() {
		return tourPurposeName;
	}
	/**
	 * @param tourPurposeName the tourPurposeName to set
	 */
	public void setTourPurposeName(String tourPurposeName) {
		this.tourPurposeName = tourPurposeName;
	}
	/**
	 * @return the tourPurposeId
	 */
	public Integer getTourPurposeId() {
		return tourPurposeId;
	}
	/**
	 * @param tourPurposeId the tourPurposeId to set
	 */
	public void setTourPurposeId(Integer tourPurposeId) {
		this.tourPurposeId = tourPurposeId;
	}
	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
