package com.rx.masters;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.masters.CreateRegionActionPojo;

public class CreateRegionAction extends ActionSupport implements ModelDriven<CreateRegionActionPojo>{

	private static final long serialVersionUID = 1L;
	
	CreateRegionActionPojo createRegionPOJO = new CreateRegionActionPojo();
	DaoImpl daoImpl = new DaoImpl();
	
	public String createRegion() throws Exception {
		
		String returnResult = daoImpl.createRegion(createRegionPOJO);
		
		if (returnResult.equals("SUCCESS")) {
			
			return "SUCCESS";
		}
		else
			return "ERROR";
		
	}

	@Override
	public CreateRegionActionPojo getModel() {
		// TODO Auto-generated method stub
		return createRegionPOJO;
	}

}
