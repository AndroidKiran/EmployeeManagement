package com.rx;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.pojo.CreateUserActionPojo;
import com.pojo.masters.CreateHolidayActionPojo;
import com.pojo.masters.CreateRoleActionPojo;

public class CreateUserAction extends ActionSupport implements ModelDriven<CreateUserActionPojo>,Preparable{

	private static final long serialVersionUID = 1L;

	CreateRoleActionPojo createRolePOJO = new CreateRoleActionPojo();
	CreateUserActionPojo createUserPOJO = new CreateUserActionPojo();
	DaoImpl daoImpl = new DaoImpl();
	
	public List<CreateRoleActionPojo> rolesList;	
	public List<CreateUserActionPojo> userList;
	
	
	/*
	 * Action for Unique Check for create user 
	  */
	public String uniqueCheck()throws Exception {
		
		System.out.println("In uniqueCheck --->>userName = "+createUserPOJO.getUserName());
		
		createUserPOJO.setAJAX(daoImpl.fetchUserNameForUniqueCheck(createUserPOJO.getUserName()));
		System.out.println("createUserPOJO.getAJAX() = "+createUserPOJO.getAJAX());
		
		if(createUserPOJO.getAJAX())
		{
			System.out.println("Ret True in Action");
		}
		
		 
	            PrintWriter outWriter = null;
	            StringBuffer msg= new StringBuffer("");
	            HttpServletResponse httpResponse = ServletActionContext.getResponse();
	            try 
	            {
	                outWriter = httpResponse.getWriter();
	                                        msg.append(createUserPOJO.getAJAX());
	            }
	            catch (IOException e) 
	            {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	            finally{

	                if(outWriter!=null){
	                    httpResponse.setContentType("text/html");
	                    System.out.println("ajax-->"+msg.toString());
	                    outWriter.println(msg.toString());
	                    outWriter.flush();
	                    outWriter.close();
	                }
	            }
	            
		return null;
		
		
	}
	
	
	/*
	 * Action for creating user 
	  */
	public String createUser()throws Exception {
		
		System.out.println("##############################################################################################################################################################################################");
		/*System.out.println("Date of Relieving = "+createUserPOJO.getToDate());
		System.out.println("Date of Relieving = "+createUserPOJO.getToDate1());
		
		if (createUserPOJO.getToDate1().equals(null)||createUserPOJO.getToDate1()== "") {
			createUserPOJO.setToDate1(null);
		}
		if (createUserPOJO.getToDate().equals(null)||createUserPOJO.getToDate()=="") {
			createUserPOJO.setToDate(null);
		}
		if (createUserPOJO.getDob().equals(null)||createUserPOJO.getDob()=="") {
			createUserPOJO.setDob(null);
		}*/
		
		String returnResult = daoImpl.createUser(createUserPOJO);
		
		if(returnResult.equals("ERROR"))
			return "ERROR";
		else
		return "SUCCESS";
		
	}
	
	/*
	 * Action to search user for Administration
	  */
	public String searchUser() throws Exception 
	{
		System.out.println("In searchUser()---->>>User Name = "+createUserPOJO.getUserName());
		
		try {
			
			userList = daoImpl.searchUser(createUserPOJO);
			
			if (userList.size() != 0) {	
			
				createUserPOJO.setErrorMsg(null);
				System.out.println("ErrorMsg = "+createUserPOJO.getErrorMsg());
				return "SUCCESS";
			}
			else {
				createUserPOJO.setErrorMsg("User Not Found...");
				System.out.println("ErrorMsg = "+createUserPOJO.getErrorMsg());
				return "EMPTY";
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			throw e;
		}		
	}
	
	/*
	 * Action to edit user for administration 
	  */
	public String setupUpdateUser() throws Exception{
		
		System.out.println("##################################################setupUpdateUser############################################");
		
		System.out.println("userName = "+createUserPOJO.getUserName());
		userList = daoImpl.searchUser(createUserPOJO);
		
		Iterator<CreateUserActionPojo> dsd= userList.iterator();
		while(dsd.hasNext()){
			CreateUserActionPojo actionPojo=	(CreateUserActionPojo) dsd.next();
			
			System.out.println("userName = "+actionPojo.getUserName());
			System.out.println("First Name = "+actionPojo.getFirstName());
			System.out.println("lastName = "+actionPojo.getLastName());
			System.out.println("MiddleName = "+actionPojo.getMiddleName());
			System.out.println("pwd = "+actionPojo.getPwd());
			System.out.println("pwd Reminder = "+actionPojo.getPwdReminder());
			
		/*System.out.println("check in setupUpdateUser()"+actionPojo.getFromDate());
		
		actionPojo.setFromDate(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getFromDate_db()));
		actionPojo.setToDate(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getToDate_db()));
		actionPojo.setFromDate1(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getFromDate1_db()));
		actionPojo.setToDate1(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getToDate1_db()));
		actionPojo.setDob(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getDob_db()));
		
	
			System.out.println("DOB = "+actionPojo.getDob());
			System.out.println("From Date1 = "+actionPojo.getFromDate1());
			System.out.println("To Date1 = "+actionPojo.getToDate1());
			System.out.println("Date of joining ie From date = "+actionPojo.getFromDate());
			System.out.println("Date of relieving ie toDate = "+actionPojo.getToDate());
			*/
		}
		
		return "SUCCESS";
		
	}
	
	/*
	 * Action for Updating User Details in Database 
	  */
	public String updateUser()throws Exception {
		
		System.out.println("In updateUser method ---->>> seq_no = "+createUserPOJO.getSeq_no());
		
		String returnResult = daoImpl.createUser(createUserPOJO);
		
		if(returnResult.equals("ERROR"))
			return "ERROR";
		else
			return "SUCCESS";
	}
	
	/*
	 * method for populating roles
	 * */
	
	public String execute()throws Exception {
		
		if(rolesList != null)
		{
			return "SUCCESS";
		}
		else
		return "ERROR";
		
	}
	@Override
	public CreateUserActionPojo getModel() {
		// TODO Auto-generated method stub
		return createUserPOJO;
	}
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		rolesList = daoImpl.fetchRoles();
				
	}

}
