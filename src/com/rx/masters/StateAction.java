package com.rx.masters;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.masters.StateActionPojo;

public class StateAction extends ActionSupport implements ModelDriven<StateActionPojo>{

	private static final long serialVersionUID = 1L;
	
	StateActionPojo statePOJO = new StateActionPojo();
	

	@Override
	public StateActionPojo getModel() {
		// TODO Auto-generated method stub
		return statePOJO;
	}

}
