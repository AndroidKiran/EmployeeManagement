package com.rx.masters;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.masters.WorkTypeActionPojo;

public class WorkTypeAction extends ActionSupport implements ModelDriven<WorkTypeActionPojo>{

	private static final long serialVersionUID = 1L;
	WorkTypeActionPojo workTypePOJO = new WorkTypeActionPojo();

	@Override
	public WorkTypeActionPojo getModel() {
		// TODO Auto-generated method stub
		return workTypePOJO;
	}

}
