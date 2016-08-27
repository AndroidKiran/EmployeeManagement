package com.rx.medicalRepresentative;

import java.util.List;
import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.pojo.LoginActionPojo;
import com.pojo.masters.AddChemistActionPojo;
import com.pojo.masters.AddDoctorActionPojo;
import com.pojo.masters.TimeActionPojo;
import com.pojo.masters.TourPurposeActionPojo;
import com.pojo.medicalRepresentative.DcrActionPojo;
import com.pojo.medicalRepresentative.TourPlanningActionPojo;
import com.rx.LoginAction;

public class TourPlanningAction extends ActionSupport implements ModelDriven<TourPlanningActionPojo>,Preparable{

	private static final long serialVersionUID = 1L;
	
	TourPlanningActionPojo tourPlanningPOJO = new TourPlanningActionPojo();
	
	AddDoctorActionPojo addDoctorPOJO = new AddDoctorActionPojo();
	LoginActionPojo loginActionPOJO = new LoginActionPojo();
	DcrActionPojo DcrPOJO = new DcrActionPojo();
	TourPurposeActionPojo tourPurposePOJO = new TourPurposeActionPojo();
	DaoImpl daoImpl = new DaoImpl();

	public List<AddDoctorActionPojo> docList = null;
	public List<AddDoctorActionPojo> docListCurr = null;
	public List<AddChemistActionPojo> chemistList = null;
	public List<AddChemistActionPojo> chemistListCurr = null;
	public List<TourPlanningActionPojo> tourDetailsList = null;
	public List<TourPlanningActionPojo> tourDetailsListForTP = null;
	public List<TourPurposeActionPojo> tourPurposeList = null;
	public List<TourPlanningActionPojo> TPListforEdit = null;
	public List<TimeActionPojo> timeList = null;
	
	private String returnResult = null;

	public String createUserTourPlan() throws Exception{
		
		returnResult = daoImpl.createUserTourPlan(tourPlanningPOJO);
		
		if (returnResult.equals("SUCCESS")) {
			
			return "SUCCESS";
		}
		else
			return "ERROR";
		
	}
	
	public String execute() throws Exception{
		
		/*
		 * Populating List for current User 
		  */
		String empId = LoginAction.empIdOfCurrentSession;
		
		if(empId.equals(null)){
			return "SESSION_INVALID";
		}
		
		String territoryIdCurrentUser = daoImpl.territoryOfCurrentUser(empId);
		
		System.out.println("In TourPlanningAction Class --> In execute method --> territoryIdCurrentUser --> "+territoryIdCurrentUser);
		
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
		
		System.out.println("00000000000000000000000000000000000000000000000000000000000000000000");
		
		tourPurposeList = daoImpl.fetchTourPurposeDetails();
		timeList = daoImpl.fetchTime();
		
		System.out.println("In TourPlanningAction Class --->> In execute method...");
		
		return "SUCCESS";
	}
	
	public String searchTourPlanMR() throws Exception{
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		tourDetailsListForTP = daoImpl.fetchTourDetailsForTourPlanning();
		System.out.println("Size of tourDetailsListForTP is = "+tourDetailsListForTP.size());
		
		String rsltFrmExecuteMthd = execute();
		
		System.out.println("rsltFrmExecuteMthd ---> "+rsltFrmExecuteMthd);
		
		return "SUCCESS";
	}
	
	public String editTP() throws Exception {
		
		System.out.println("########################################################In TourPlanning Action Class For editing a specific Tour plan where seq_no = "+tourPlanningPOJO.getSeq_no());
		
		TPListforEdit = daoImpl.fetchTPforEdit(tourPlanningPOJO);
		
		tourPurposeList = daoImpl.fetchTourPurposeDetails(); //Populating Tour Purpose List
		timeList = daoImpl.fetchTime(); // Populating Time List
		
		/*
		 * Populating List for current User 
		  */
		String empId = LoginAction.empIdOfCurrentSession;
		String territoryIdCurrentUser = daoImpl.territoryOfCurrentUser(empId);
		
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
		
		return "SUCCESS";
	}
	public String editUserTourPlan() throws Exception{
		
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@seq_no = "+tourPlanningPOJO.getSeq_no());
		
		String returnResult = daoImpl.createUserTourPlan(tourPlanningPOJO);
		
		if (returnResult.equals("SUCCESS")) {
			
			return "SUCCESS";
		}
		else
			return "ERROR";
	}
	
	@Override
	public TourPlanningActionPojo getModel() {
		// TODO Auto-generated method stub
		return tourPlanningPOJO;
	}


	@Override
	public void prepare() throws Exception {

		//docList = daoImpl.fetchDoctor();
		//chemistList = daoImpl.fetchChemist();
		
	}

	

}
