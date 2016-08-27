package com.rx.masters;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.masters.CityActionPojo;

public class CityAction extends ActionSupport implements ModelDriven<CityActionPojo>{
	
	private static final long serialVersionUID = 1L;
	
	CityActionPojo cityPOJO = new CityActionPojo();

	@Override
	public CityActionPojo getModel() {
		// TODO Auto-generated method stub
		return cityPOJO;
	}

}
