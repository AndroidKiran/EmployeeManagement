package com.rx;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Query;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.pojo.LoginActionPojo;

@SuppressWarnings("unused")
public class LoginAction extends ActionSupport implements ModelDriven<LoginActionPojo>,Preparable,SessionAware{

	private static final long serialVersionUID = 1L;
	
	public LoginActionPojo loginActionPOJO = new LoginActionPojo();
	
	public DaoImpl daoImpl = new DaoImpl();
	
	
	public List<LoginActionPojo> securityCheckList = null;
	@SuppressWarnings("unused")
	private transient Map session=null;
	public String mode = null;
	public static String user = null;
	public static String empIdOfCurrentSession = null;
	
	@SuppressWarnings("unchecked")
	public String securityCheck() throws Exception
	{
		
		//String userName;
		
		String tempUserName = loginActionPOJO.getJ_username();
		String tempPassword = loginActionPOJO.getJ_password();
		user = loginActionPOJO.getJ_username();
		
		System.out.println("user = loginActionPOJO.getJ_username(); = "+user);
		
		System.out.println("String tempUserName = loginActionPOJO.getJ_username(); = "+tempUserName);
		System.out.println("String tempPassword = loginActionPOJO.getJ_password(); = "+tempPassword);
		
		securityCheckList = daoImpl.securityCheck(loginActionPOJO);
		
		session.put("UserName", loginActionPOJO.getJ_username());
		
		
		if(securityCheckList.size() != 0)
		{
			if(tempUserName.equals("rx.superuser"))
			{
				Iterator<LoginActionPojo> dsd= securityCheckList.iterator();
				while(dsd.hasNext())
				{
					LoginActionPojo actionPojo=	(LoginActionPojo) dsd.next();
					
					System.out.println("check 4 rx:::: "+actionPojo.getJ_password());
					System.out.println("check user 4 rx ::::: "+actionPojo.getJ_username());
					
					empIdOfCurrentSession = actionPojo.getEmpId();
					
					if((actionPojo.getJ_username().equals(tempUserName)) && actionPojo.getJ_password().equals(tempPassword))
					{	
						/*
						System.out.println(" In if((actionPojo.getJ_username().equals(tempUserName)) && actionPojo.getJ_password().equals(tempPassword)){ check :::: "+actionPojo.getJ_password()+"temp user password-->> : "+tempPassword);
						System.out.println(" In if((actionPojo.getJ_username().equals(tempUserName)) && actionPojo.getJ_password().equals(tempPassword)){ check user ::::: "+actionPojo.getJ_username()+"temp user name-->> : "+tempUserName);
						*/
						System.out.println("In rx.superuser  --->> mode ::::::::::::::: "+mode);
						mode = "SUPERUSER";
						System.out.println("In rx.superuser  --->> before mode = 'SUPERUSER' ::::::::::::::: "+mode);
						
					} // End of if
					else 
					{
							System.out.println("In Login Action 4 rx--->> in securityCheck() method --->> in else part <<<<----");
						
							mode = "ERROR";
							System.out.println("mode = "+mode);
					} // End of else	
				} // End of while
			} // End of 2nd if
		
			else
			{
				Iterator<LoginActionPojo> dsd= securityCheckList.iterator();
				while(dsd.hasNext()){
					LoginActionPojo actionPojo=	(LoginActionPojo) dsd.next();
					
					empIdOfCurrentSession = actionPojo.getEmpId();
					
					if((actionPojo.getJ_username().equals(tempUserName)) && actionPojo.getJ_password().equals(tempPassword))
					{		
						Integer roleId_temp =  actionPojo.getRoleId();
						System.out.println("roleId_temp = "+roleId_temp);
						String roleName = daoImpl.fetchRoleName(roleId_temp);
						
						System.out.println(" --------------->>>>>>>>>> roleName = "+roleName);
						
						
						if(roleName.equalsIgnoreCase("mr")||roleName.equalsIgnoreCase("Medical Representative")){
							
							System.out.println("setting mode = MR for MR login");
							
							mode = "MR";
						}
						else if (roleName.equalsIgnoreCase("tbm")) {
							mode = "TBM";
						}
						else if (roleName.equalsIgnoreCase("abm")) {
							mode = "ABM";
						}
						else if (roleName.equalsIgnoreCase("rbm")) {
							mode = "RBM";
						}
						else if (roleName.equalsIgnoreCase("zbm")) {
							mode = "ZBM";
						}
						else if (roleName.equalsIgnoreCase("NSM")) {
							mode = "NSM";
						}
						else if (roleName.equalsIgnoreCase("Admin")) {
							
							mode = "ADMIN";
						}		
						else {
							mode = "input";
						}
						
					} // End of if
					else 
					{
							System.out.println("In Login Action --->> in checkUserNameAndPassword() method --->> in else part <<<<----");
						
							mode = "ERROR";
							System.out.println("mode = "+mode);
					} //End of else	
				} // End of while
			} // End of else	
		} // End of 1st if
		else
		{
			mode = "ERROR";
		}
			
		if(mode == "ERROR")
		{
			loginActionPOJO.setSetLabel("Not a valid user...");
			return "ERROR";
		} // End of if
		else if (mode == "SUPERUSER") {
			
			System.out.println("SUPERUSER SUPERUSER SUPERUSER SUPERUSER SUPERUSER "+mode);
			
			return "SUPERUSER";
		} // End of else if block
		else {
			
			return mode;
		} // End of else block
	
	} // End of securityCheck method
	
	
	// Method for invoking inbox begins from here
	public String invokeInbox()throws Exception {
		
		return "SUCCESS";	
	}
	
	// Method for Sign out begins from here
	public String logOut()throws Exception {
		
		if (session instanceof org.apache.struts2.dispatcher.SessionMap) {
		    try {
		        ((org.apache.struts2.dispatcher.SessionMap) session).invalidate();
		    } catch (IllegalStateException e) {
		        //logger.error(msg, e);
		    }
		}
		
		return "SUCCESS";	
	}
	
	
	
	@Override
	public LoginActionPojo getModel() {
		// TODO Auto-generated method stub
		return loginActionPOJO;
	}


	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
		
		
	}


	@Override
	public void setSession(Map session) {
		// TODO Auto-generated method stub
		this.session=session;
		
	}

}
