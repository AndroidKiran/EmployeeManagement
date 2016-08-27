package com.rx;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.ChgPasswordActionPojo;
import com.pojo.LoginActionPojo;

public class ChgPasswordAction extends ActionSupport implements ModelDriven<ChgPasswordActionPojo>{

	private static final long serialVersionUID = 1L;
	public ChgPasswordActionPojo chgPasswordPOJO = new ChgPasswordActionPojo();
	public DaoImpl daoImpl = new DaoImpl();
	public LoginActionPojo loginActionPOJO = new LoginActionPojo();

	public String chgPassword() throws Exception{
		
		System.out.println("In chgPassword() method ::::::::::::::++++++++++++++++++++++++++++++++++:::::::::::::::::::::::::::");
		System.out.println("in change pass password  :: "+chgPasswordPOJO.getPwd());
		System.out.println("j_username ==== "+loginActionPOJO.getJ_username());
		
		daoImpl.chgPassword(chgPasswordPOJO);
		
		return "SUCCESS";
		
	}

	@Override
	public ChgPasswordActionPojo getModel() {
		// TODO Auto-generated method stub
		return chgPasswordPOJO;
	}
}
