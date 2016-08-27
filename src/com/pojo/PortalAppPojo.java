package com.pojo;

import java.io.Serializable;

public class PortalAppPojo implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer parentId;
	private String portalApp;
	private Integer appNo;
	
	
	public Integer getAppNo() {
		return appNo;
	}
	public void setAppNo(Integer appNo) {
		this.appNo = appNo;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getPortalApp() {
		return portalApp;
	}
	public void setPortalApp(String portalApp) {
		this.portalApp = portalApp;
	}
	
}
