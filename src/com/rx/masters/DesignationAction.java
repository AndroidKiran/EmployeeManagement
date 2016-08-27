package com.rx.masters;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.masters.DesignationActionPojo;

public class DesignationAction extends ActionSupport implements ModelDriven<DesignationActionPojo>{

	private static final long serialVersionUID = 1L;
	
	DesignationActionPojo designationPOJO = new DesignationActionPojo();

	@Override
	public DesignationActionPojo getModel() {
		// TODO Auto-generated method stub
		return designationPOJO;
	}

}
