package com.rx.medicalRepresentative;

import java.util.List;

import org.apache.struts2.interceptor.validation.SkipValidation;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.pojo.masters.AddChemistActionPojo;
import com.pojo.masters.AddDoctorActionPojo;
import com.pojo.masters.DesignationActionPojo;
import com.pojo.masters.TimeActionPojo;
import com.pojo.masters.TopicDiscussionActionPojo;
import com.pojo.masters.WorkTypeActionPojo;
import com.pojo.medicalRepresentative.DcrActionPojo;
import com.pojo.medicalRepresentative.TourPlanningActionPojo;
import com.rx.LoginAction;

public class DcrAction extends ActionSupport implements ModelDriven<DcrActionPojo>, Preparable{

	private static final long serialVersionUID = 1L;
	
	DcrActionPojo DcrPOJO = new DcrActionPojo();
	TourPlanningActionPojo tourPlanningPOJO = new TourPlanningActionPojo();
	DaoImpl daoImpl = new DaoImpl();
	
	public List<AddDoctorActionPojo> docListCurr = null;
	public List<AddChemistActionPojo> chemistListCurr = null;
	public List<TimeActionPojo> timeList = null;
	public List<DesignationActionPojo> workedWithList = null;
	public List<WorkTypeActionPojo> workTypeList = null;
	public List<TopicDiscussionActionPojo> topicDiscussionList = null;
	
	public List<DcrActionPojo> dcrListAfterSearch = null;
	String empId;
	String territoryIdCurrentUser;
	
	
	//public static Boolean comp;   //Uncomment it
	
	
	
	public String createDCR()throws Exception {
		
		DcrPOJO.setUserName(LoginAction.user);
		//comp = DcrPOJO.getIsCompleted();  //Uncomment it
		//tourPlanningPOJO.setIsCompleted(comp); //Uncomment it
		//System.out.println("tourPlanningPOJO.setIsCompleted(DcrPOJO.getIsCompleted()) = "+tourPlanningPOJO.getIsCompleted());
		
		String returnResult = daoImpl.submitDCR(DcrPOJO);
		
		if (returnResult!=null) {
			return "SUCCESS";
		} 
		
		else {
			return "ERROR";
		}
		
	}
	
	public String reopenDCR()throws Exception {

		empId = LoginAction.empIdOfCurrentSession;
		territoryIdCurrentUser = daoImpl.territoryOfCurrentUser(empId);
		
		docListCurr = daoImpl.doctorTerritoryWise(territoryIdCurrentUser);
		chemistListCurr = daoImpl.chemistTerritoryWise(territoryIdCurrentUser);
		timeList = daoImpl.fetchTime();
		workedWithList = daoImpl.fetchDesignation();
		workTypeList = daoImpl.fetchWorkType();
		topicDiscussionList = daoImpl.fetchDiscussionTopic();
		
		System.out.println("In Re-open DCR method...");
		
		return "SUCCESS";
	}
	
	/*
	 * Action to populate drop-down in dcr page 
	  */
	@SkipValidation
	public String openDCR()throws Exception {
		
		
		empId = LoginAction.empIdOfCurrentSession;
		territoryIdCurrentUser = daoImpl.territoryOfCurrentUser(empId);
		
		if((territoryIdCurrentUser != null))
		{
			System.out.println("1231231231231231232123215444541541542445425425425423424254");
			
			docListCurr = daoImpl.doctorTerritoryWise(territoryIdCurrentUser);
			chemistListCurr = daoImpl.chemistTerritoryWise(territoryIdCurrentUser);
		}
		
		/*
		 * Fetching whole doc list & chem list if user do not have empId, as it may be admin or superuser
		  */
		
		else{
			docListCurr = daoImpl.fetchDoctor();
			chemistListCurr = daoImpl.fetchChemist();
		}
		
		
		timeList = daoImpl.fetchTime();
		workedWithList = daoImpl.fetchDesignation();
		workTypeList = daoImpl.fetchWorkType();
		topicDiscussionList = daoImpl.fetchDiscussionTopic();
		
		System.out.println("In openDCR ----> Returning Success");
		
		return "SUCCESS";
	}

	/*
	 * Action to search Entered DCR user-wise 
	  */
	
	public String searchDCR()throws Exception {
		
		empId = LoginAction.empIdOfCurrentSession;
		territoryIdCurrentUser = daoImpl.territoryOfCurrentUser(empId);
		
		if((territoryIdCurrentUser != null))
		{
			System.out.println("1231231231231231232123215444541541542445425425425423424254");
			
			docListCurr = daoImpl.doctorTerritoryWise(territoryIdCurrentUser);
			chemistListCurr = daoImpl.chemistTerritoryWise(territoryIdCurrentUser);
		}
		
		/*
		 * Fetching whole doc list & chem list if user do not have empId, as it may be admin or superuser
		  */
		
		else{
			docListCurr = daoImpl.fetchDoctor();
			chemistListCurr = daoImpl.fetchChemist();
		}
		
		timeList = daoImpl.fetchTime();
		workedWithList = daoImpl.fetchDesignation();
		workTypeList = daoImpl.fetchWorkType();
		topicDiscussionList = daoImpl.fetchDiscussionTopic();
		
		dcrListAfterSearch = daoImpl.searchDCR(empId);
		
		return "SUCCESS";
	}

	@Override
	public DcrActionPojo getModel() {
		// TODO Auto-generated method stub
		return DcrPOJO;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
		/*Action to populate  drop-down field  in DCR page*/
	}

}
