package com.rx.masters;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.masters.TimeActionPojo;

public class TimeAction extends ActionSupport implements ModelDriven<TimeActionPojo>{

	private static final long serialVersionUID = 1L;
	
	TimeActionPojo timePOJO = new TimeActionPojo();

	@Override
	public TimeActionPojo getModel() {
		// TODO Auto-generated method stub
		return timePOJO;
	}

}
