package com.rx.masters;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.masters.CreateRoleActionPojo;

public class CreateRoleAction extends ActionSupport implements ModelDriven<CreateRoleActionPojo>{

	private static final long serialVersionUID = 1L;

	public CreateRoleActionPojo createRolePOJO = new CreateRoleActionPojo();
	public DaoImpl daoImpl = new DaoImpl();
	
	
	public String createRole()throws Exception {
		
		String returnResult = daoImpl.createRole(createRolePOJO);
		
		if(returnResult.equals(ERROR))
			return "ERROR";
		else
		return "SUCCESS";
		
	}
	
	@Override
	public CreateRoleActionPojo getModel() {
		// TODO Auto-generated method stub
		return createRolePOJO;
	}

}
