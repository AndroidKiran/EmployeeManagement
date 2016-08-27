package com.rx.masters;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.masters.BloodGroupActionPojo;

public class BloodGroupAction extends ActionSupport implements ModelDriven<BloodGroupActionPojo>{

	private static final long serialVersionUID = 1L;
	
	BloodGroupActionPojo bloodGrpPOJO = new BloodGroupActionPojo();

	@Override
	public BloodGroupActionPojo getModel() {
		// TODO Auto-generated method stub
		return bloodGrpPOJO;
	}

}
