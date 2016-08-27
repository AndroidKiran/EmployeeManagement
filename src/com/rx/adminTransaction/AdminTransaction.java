package com.rx.adminTransaction;

import java.util.Iterator;
import java.util.List;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pojo.CreateUserActionPojo;
import com.pojo.adminTransaction.AdminTransactionPojo;
import com.pojo.masters.AddChemistActionPojo;
import com.pojo.masters.AddDoctorActionPojo;
import com.pojo.masters.DesignationActionPojo;
import com.pojo.masters.TimeActionPojo;
import com.pojo.masters.TopicDiscussionActionPojo;
import com.pojo.masters.TourPurposeActionPojo;
import com.pojo.masters.WorkTypeActionPojo;
import com.pojo.medicalRepresentative.DcrActionPojo;
import com.pojo.medicalRepresentative.TourPlanningActionPojo;

public class AdminTransaction extends ActionSupport implements ModelDriven<AdminTransactionPojo>{

	private static final long serialVersionUID = 1L;
	
	DaoImpl daoImpl = new DaoImpl();
	AdminTransactionPojo adminTranPOJO = new AdminTransactionPojo();
	TourPlanningActionPojo tourPlanningPOJO = new TourPlanningActionPojo();
	DcrActionPojo DcrPOJO = new DcrActionPojo();
	
	public List<CreateUserActionPojo> userList = null;
	public List<TourPlanningActionPojo> tourPlanListForAdmin = null;
	public List<AddDoctorActionPojo> docListAdmin = null;
	public List<AddChemistActionPojo> chemListAdmin = null;
	public List<TimeActionPojo> timeListAdmin = null;
	public List<TourPurposeActionPojo> tourPurposeAdmin = null;
	public List<DcrActionPojo> dcrListAdmin = null;
	
	public List<DesignationActionPojo> workedWithList = null;
	public List<WorkTypeActionPojo> workTypeList = null;
	public List<TopicDiscussionActionPojo> topicDiscussionList = null;
/*
 * Action to populate user for tour plan for Admin 
  */
	public String popUserForSearchTPForAdmin() throws Exception{
		
		userList = daoImpl.fetchUser();
		
		Iterator<CreateUserActionPojo> dsd = userList.iterator();
		while (dsd.hasNext()) {
			CreateUserActionPojo actionPOJO = (CreateUserActionPojo) dsd
					.next();
			System.out.println("user name = "+actionPOJO.getUserName()+" empId = "+actionPOJO.getEmpId()+" roleId = "+actionPOJO.getRoleId());
		}
		return "SUCCESS";
	}
/*
 * Action to search planned tour by user for Admin 
  */
	public String searchTPaDMIN()throws Exception {
		
		System.out.println("Empid --> "+adminTranPOJO.getEmpId());
		System.out.println("tourDate = "+adminTranPOJO.getTourDate());
		
		String tempTourDate = adminTranPOJO.getTourDate();
		System.out.println("tempTourDate --> "+tempTourDate);
		
		tourPlanningPOJO.setTourDate(tempTourDate);
		tourPlanningPOJO.setEmpId(adminTranPOJO.getEmpId());
		
		tourPlanListForAdmin = daoImpl.tourPlanForAdmin(tourPlanningPOJO);
		
		if(tourPlanListForAdmin.size() == 0)
			adminTranPOJO.setErrorMsg("No Tour Plan Found...");
		
		
		
		docListAdmin = daoImpl.fetchDoctor();
		chemListAdmin = daoImpl.fetchChemist();
		tourPurposeAdmin = daoImpl.fetchTourPurposeDetails();
		timeListAdmin = daoImpl.fetchTime();
		userList = daoImpl.fetchUser();
		
		return "SUCCESS";
	}
	
/*
 * Action to search filled DCR by ADMIN for all users 
  */
	
	public String searchDCRAdmin() throws Exception {
		
		System.out.println("Empid --> "+adminTranPOJO.getEmpId());
		System.out.println("tourDate = "+adminTranPOJO.getTourDate());
		
		String tempTourDate = adminTranPOJO.getTourDate();
		System.out.println("tempTourDate --> "+tempTourDate);
		
		DcrPOJO.setTourDate(tempTourDate);
		DcrPOJO.setEmpId(adminTranPOJO.getEmpId());
		
		dcrListAdmin = daoImpl.dcrForAdmin(DcrPOJO);
		
		if(dcrListAdmin.size() == 0)
			adminTranPOJO.setErrorMsg("No DCR Found...");
		
		docListAdmin = daoImpl.fetchDoctor();
		chemListAdmin = daoImpl.fetchChemist();
		//tourPurposeAdmin = daoImpl.fetchTourPurposeDetails();
		timeListAdmin = daoImpl.fetchTime();
		userList = daoImpl.fetchUser();
		workedWithList = daoImpl.fetchDesignation();
		workTypeList = daoImpl.fetchWorkType();
		topicDiscussionList = daoImpl.fetchDiscussionTopic();
		
		return "SUCCESS";
		
	}
	@Override
	public AdminTransactionPojo getModel() {
		// TODO Auto-generated method stub
		return adminTranPOJO;
	}

}
