package com.dao;

import hibernate.HibernateUtil;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.pojo.ChgPasswordActionPojo;
import com.pojo.CreateUserActionPojo;
import com.pojo.LoginActionPojo;
import com.pojo.PortalAppPojo;
import com.pojo.masters.AddCategoryActionPojo;
import com.pojo.masters.AddChemistActionPojo;
import com.pojo.masters.AddDoctorActionPojo;
import com.pojo.masters.AddMRActionPojo;
import com.pojo.masters.AddProductActionPojo;
import com.pojo.masters.AddReferenceActionPojo;
import com.pojo.masters.AddTerritoryActionPojo;
import com.pojo.masters.BloodGroupActionPojo;
import com.pojo.masters.CityActionPojo;
import com.pojo.masters.CreateHolidayActionPojo;
import com.pojo.masters.CreateRegionActionPojo;
import com.pojo.masters.CreateRoleActionPojo;
import com.pojo.masters.DesignationActionPojo;
import com.pojo.masters.StateActionPojo;
import com.pojo.masters.TimeActionPojo;
import com.pojo.masters.TopicDiscussionActionPojo;
import com.pojo.masters.TourPurposeActionPojo;
import com.pojo.masters.WorkTypeActionPojo;
import com.pojo.medicalRepresentative.DcrActionPojo;
import com.pojo.medicalRepresentative.OrderBookingActionPojo;
import com.pojo.medicalRepresentative.TourPlanningActionPojo;
import com.rx.LoginAction;

public class DaoImpl {
	
	Session session;
	Transaction transaction;	
	
	Date dob;
	Date doj;
	Date dos;
	
	Date fromDate1_db;
	Date toDate1_db;
	Date fromDate_db;
	Date toDate_db;

	
	public void submitCategory(AddCategoryActionPojo addCategoryPOJO) {
		try{	
			
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			s.saveOrUpdate(addCategoryPOJO);
			System.out.println("Category NAme = ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"+addCategoryPOJO.getCat_name());
			transaction.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
	}
	
	public void submitProduct(AddProductActionPojo addProductPOJO,File fileUpload, String fileUploadContentType,String fileUploadFileName) {
		
		
		
		try{	
			
			if(addProductPOJO.getExcelUpload() == 0)
			{
				DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				dos = (Date)formatter.parse(addProductPOJO.getDos());			
				addProductPOJO.setDos_db(dos);
				
				System.out.println("In submit_Product Method--------->>>>>>>> In try block------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				
				
				File uploadedFile=fileUpload;
				System.out.println("Aftyer File uploadedFile=fileUpload; "+uploadedFile);
				
				if(uploadedFile != null)
				{
					System.out.println("In Else PArt");
					
					addProductPOJO.setPhoto(getPhotoBytes(uploadedFile));
					System.out.println(""+getPhotoBytes(uploadedFile));
					
					System.out.println("addProductActionPojo.setPhoto(getPhotoBytes(uploadedFile));");
		
					addProductPOJO.setPhoto_name(fileUploadFileName);
					System.out.println("THE BYE OF THE PHOTOS IS:::::::::"+getPhotoBytes(uploadedFile) );
				}
				else {
					addProductPOJO.setPhoto(null);
					addProductPOJO.setPhoto_name(null);
				}
			}		
			
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			s.saveOrUpdate(addProductPOJO);
			transaction.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	
	public byte[] getPhotoBytes(File photoFile){
		byte[] byteArr=null;
		FileInputStream fileInputStream=null;
		try {
			byteArr= new byte[(int) photoFile.length()];
			
			if (byteArr != null){
			fileInputStream=new FileInputStream(photoFile);
			fileInputStream.read(byteArr);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("Exception in getPhotoBytes:::::"+e);
		}finally{
			try {
				fileInputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Exception while closing fileInputStream::::::"+e);
			}
		}
		return byteArr;
	}
	
	/*
	 * Action to Save or Update Chemist 
	  */
	
	public void submitChemist(AddChemistActionPojo addChemistPojo) {
		try{	
			
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			s.saveOrUpdate(addChemistPojo);
			transaction.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
	}
	public void submitDoctor(AddDoctorActionPojo addDoctorPojo) {
		try{	
			
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			s.saveOrUpdate(addDoctorPojo);
			transaction.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
	}
	public void submitReference(AddReferenceActionPojo addReferencePOJO) {
		try{	
			
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			s.saveOrUpdate(addReferencePOJO);
			transaction.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
	}
		
	
	public void submitTerritory(AddTerritoryActionPojo addTerritoryPOJO) {
		try{			
			Session s=HibernateUtil.getsession();
			transaction=s.beginTransaction();
			transaction.begin();
			s.saveOrUpdate(addTerritoryPOJO);
			transaction.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	
	/*
	 * Action to Fetch MAX. Seq No From DB to generate EmpId for MR 
	  */
	
	@SuppressWarnings("unchecked")
	public Integer fetchMaxSeqNoFromDB() {
		
		List<AddMRActionPojo> maxList = null;
		Integer maxSeqNo = null;
		
		try
    	{
			System.out.println("--> Before query in fetchMaxSeqNoFromDB Method <--");
			
			String query = "from AddMRActionPojo where seq_no = (select max(seq_no) from AddMRActionPojo)";
    		System.out.println("query"+query); 
    		
    		Session session=HibernateUtil.getsession();
    		maxList= session.createQuery(query).list();
    		
    		System.out.println("maxList size --> "+maxList.size());
    		
    		if (maxList.size() == 0) {
				
    			maxSeqNo = 1;
			}
    		else {
    			Iterator<AddMRActionPojo> dsd= maxList.iterator();
    			while(dsd.hasNext())
    			{
    					AddMRActionPojo actionPojo=	(AddMRActionPojo) dsd.next();
    					maxSeqNo = actionPojo.getSeq_no();
    					System.out.println("In DAO Class --> fetchMaxSeqNoFromDB Method --> maxSeqNo --> "+maxSeqNo);
    					maxSeqNo = maxSeqNo + 1;
    					System.out.println("In DAO Class --> fetchMaxSeqNoFromDB Method -->New maxSeqNo --> "+maxSeqNo);
    			}
			}
			//Criteria criteria = session.createCriteria(AddMRActionPojo.class).setProjection(Projections.max("seq_no"));
			//maxSeqNo = (Integer)criteria.uniqueResult();
    	}
    	catch(HibernateException he)
    	{
    		he.printStackTrace();
    	}
		return maxSeqNo;
	}
	
	/*
	 * Action to fetch Region Name for empId 
	  */
	@SuppressWarnings("unchecked")
	public List<CreateRegionActionPojo> searchRegionForEmpId(Integer regionId) {
		List<CreateRegionActionPojo> regionListForEmpId = null;
		
		try
    	{
    		
    		String query = "from CreateRegionActionPojo where regId ="+regionId;
    		System.out.println("query"+query); 
    		
    		Session session=HibernateUtil.getsession();
    		regionListForEmpId= session.createQuery(query).list();

    		System.out.println("Size of regionListForEmpId is::::::::::::::::::::::::::::::::::::::"+regionListForEmpId.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
		return regionListForEmpId;
	}
	/*
	 * Action to fetch Region Name for empId 
	 */
	@SuppressWarnings("unchecked")
	public List<StateActionPojo> fetchStateForEmpId(Integer state_Id) {
		
		List<StateActionPojo> stateListForEmpId = null;
		
		try
		{
			
			String query = "from StateActionPojo where stateId ="+state_Id;
			System.out.println("query"+query); 
			
			Session session=HibernateUtil.getsession();
			stateListForEmpId= session.createQuery(query).list();
			
			System.out.println("Size of stateListForEmpId is::::::::::::::::::::::::::::::::::::::"+stateListForEmpId.size());
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return stateListForEmpId;
	}

	
	/*
	 * Action to save New MR details 
	  */
		
	public String submitMR(AddMRActionPojo addMRPojo)
	{
		
		try{
			if (addMRPojo.getExcelUpload() == 0){
				
				System.out.println("In parse date");
				
				DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				dob = (Date)formatter.parse(addMRPojo.getDob());
				doj = (Date)formatter.parse(addMRPojo.getDoj());
				
				addMRPojo.setDob_db(dob);
				addMRPojo.setDoj_db(doj);
			}
			
			System.out.println("After parse dAte");
		
			Session s=HibernateUtil.getsession();
			transaction=s.beginTransaction();
			
			transaction.begin();
			
			s.saveOrUpdate(addMRPojo);
			transaction.commit();
			
			return "Record Inserted Successfully!!!";
		}
		catch(HibernateException he){
			
			he.printStackTrace();
			
			if(transaction!=null && transaction.isActive())
            {
                try
                {
                     transaction.rollback();
                }
                catch (Exception e1)
                {
                     System.out.println("Exception in submitMR ---> Rollback  :" + e1);
                }
            }
			System.out.println("Exception in submitMR :"+he);		
			
			return null;
			
		} catch (ParseException e) {
			
			e.printStackTrace();
			
			if(transaction!=null && transaction.isActive())
            {
                try
                {
                     transaction.rollback();
                }
                catch (Exception e1)
                {
                     System.out.println("Exception in submitMR ---> Rollback  :" + e1);
                }
            }
			System.out.println("Exception in submitMR :"+e);		
			
			return null;
		}		
	}
	/*
	 * Action to Update MR details 
	 */
	
	public String updateMR(AddMRActionPojo addMRPojo) {

		try{
			if (addMRPojo.getExcelUpload() == 0){
				
				System.out.println("In parse date");
				
				DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				dob = (Date)formatter.parse(addMRPojo.getDob());
				doj = (Date)formatter.parse(addMRPojo.getDoj());
				
				addMRPojo.setDob_db(dob);
				addMRPojo.setDoj_db(doj);
			}
			
			System.out.println("After parse dAte");
			
			Session s=HibernateUtil.getsession();
			transaction=s.beginTransaction();
			
			transaction.begin();
			
			s.update(addMRPojo);
			transaction.commit();
			
			return " Updated Successfully!!!";
		}
		catch(HibernateException he){
			
			he.printStackTrace();
			
			if(transaction!=null && transaction.isActive())
			{
				try
				{
					transaction.rollback();
				}
				catch (Exception e1)
				{
					System.out.println("Exception in submitMR ---> Rollback  :" + e1);
				}
			}
			System.out.println("Exception in submitMR :"+he);		
			
			return " Not Updated Successfully !!!";
			
		} catch (ParseException e) {
			
			e.printStackTrace();
			
			if(transaction!=null && transaction.isActive())
			{
				try
				{
					transaction.rollback();
				}
				catch (Exception e1)
				{
					System.out.println("Exception in submitMR ---> Rollback  :" + e1);
				}
			}
			System.out.println("Exception in submitMR :"+e);		
			
			return " Not Updated Successfully !!!";
		}		
	}
	
	
	@SuppressWarnings("unchecked")
	public List<AddReferenceActionPojo> fetchReference()throws HibernateException{
		
		List<AddReferenceActionPojo> referenceList = null;
    	
    	try
    	{
    		String query="from AddReferenceActionPojo" ;
    		Session session=HibernateUtil.getsession();
    		referenceList= session.createQuery(query).list();
    		
    	}
    	catch(HibernateException he)
    	{
    		he.printStackTrace();
    	}
    	return referenceList;
	}
	@SuppressWarnings("unchecked")
	public List<AddCategoryActionPojo> fetchCategory()throws HibernateException{
		
		List<AddCategoryActionPojo> categoryList = null;
		
		try
		{
			String query="from AddCategoryActionPojo" ;
			Session session=HibernateUtil.getsession();
			categoryList= session.createQuery(query).list();
			
		}
		catch(HibernateException he)
		{
			he.printStackTrace();
		}
		return categoryList;
	}

    @SuppressWarnings("unchecked")
	public List<AddTerritoryActionPojo> fetchTerritory()throws HibernateException
    {
    	List<AddTerritoryActionPojo> territoryList = null;
    	
    	try
    	{
    		System.out.println("------------------------------------------------In DAO in fetchTerritory method---------------------------------------------------------");
    		
    		String query="from AddTerritoryActionPojo" ;
    		Session session=HibernateUtil.getsession();
    		territoryList= session.createQuery(query).list();
    		
    		System.out.println("------------------------------------------------In DAO in fetchTerritory method after database execution---------------------------------------------------------");
    	}
    	catch(HibernateException he)
    	{
    		he.printStackTrace();
    	}
    	return territoryList;
    }
    
    // Search From Db
    
    @SuppressWarnings("unchecked")
	public List<AddMRActionPojo> searchMR(AddMRActionPojo addMRPojo) 
    {
    	List<AddMRActionPojo> mrList = null;										
    	
    	try
    	{
    		String query = "from AddMRActionPojo where dsg_id like nvl('%"+addMRPojo.getDsg_id()+"%',dsg_id) and LOWER(emp_name) like nvl(LOWER('%"+addMRPojo.getEmp_name()+"%'),emp_name) and LOWER(emp_id) like nvl(LOWER('%"+addMRPojo.getEmp_id()+"%'),emp_id) and active = nvl("+addMRPojo.getActive()+",active) order by emp_id desc";
    		System.out.println("query"+query); 
    		
    		Session session=HibernateUtil.getsession();
    		mrList= session.createQuery(query).list();
    		 
    		System.out.println("Size of mrList is::::::::::::::::::::::::::::::::::::::"+mrList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	    	
    	return mrList;
		
	}

	@SuppressWarnings("unchecked")
	public List<AddMRActionPojo>editMR(AddMRActionPojo addMRPojo)
	{
		List<AddMRActionPojo> mrEditList = null;
		
		try
    	{
			String temp = addMRPojo.getEmp_id();
			System.out.println("temp = "+temp);
			
			
			
    		String query = "from AddMRActionPojo where emp_id='"+temp+"'";
    		
    		System.out.println("query:::::::::::::::::::::::::::::::::::::::::::::::::::::::::"+query);
    		
    		Session session=HibernateUtil.getsession();
    		mrEditList= session.createQuery(query).list();
    		 
    		System.out.println("Size of mrEditList is::::::::::::::::::::::::::::::::::::::"+mrEditList.size());
    		if (mrEditList.isEmpty()) {
				System.out.println(":::::::::::::::::::::::::::::::The List Is Empty:::::::::::::::::::::::::::::::::::::::::::::::::");
				return mrEditList;
			}
    		
    		else{
	    		Iterator<AddMRActionPojo> iterator = mrEditList.iterator();
	    		while (iterator.hasNext()) {
	    			System.out.println(iterator.next());
	    		}
    		}
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
		return mrEditList;		
	}

	
	
	/*
	 * Action to create User 
	  */
	
	public String createUser(CreateUserActionPojo createUserPOJO) {

		try{	
			
			System.out.println("In DAO--->> In createUser method --->>>In try block");
			
			/*DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			
			if (createUserPOJO.getToDate1()!=null || createUserPOJO.getToDate1()!="") {
				toDate1_db =  (Date)formatter.parse(createUserPOJO.getToDate1());
				createUserPOJO.setToDate1_db(toDate1_db);
			}*/
			/*if (createUserPOJO.getToDate()!=null || createUserPOJO.getToDate()!="") {
				toDate_db =  (Date)formatter.parse(createUserPOJO.getToDate());
				createUserPOJO.setToDate_db(toDate_db);
			}*/
			/*if (createUserPOJO.getDob()!=null || createUserPOJO.getDob()=="") {
				dob = (Date)formatter.parse(createUserPOJO.getDob());
				createUserPOJO.setDob_db(dob);
			}
			
			fromDate1_db = (Date)formatter.parse(createUserPOJO.getFromDate1());
			
			fromDate_db = (Date)formatter.parse(createUserPOJO.getFromDate());		
			
			createUserPOJO.setFromDate1_db(fromDate1_db);
			
			createUserPOJO.setFromDate_db(fromDate_db);		
			
			System.out.println("After conversion of string type to date type ");
			*/
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			s.saveOrUpdate(createUserPOJO);
			System.out.println("In DAO--->> In createUser method --->>>In try block --->>>After saveOrUpdate");
			transaction.commit();
			System.out.println("In DAO--->> In createUser method --->>>In try block --->>>After saveOrUpdate--->> After transaction.commit");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "ERROR";
		}
		
		
		return "SUCCESS";
	}
	
	
	public String createRole(CreateRoleActionPojo createRolePOJO) {
		
		try{	
			
			System.out.println("In DAO--->> In createRole method --->>>In try block");
			
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			s.saveOrUpdate(createRolePOJO);
			System.out.println("In DAO--->> In createRole method --->>>In try block --->>>After saveOrUpdate");
			transaction.commit();
			System.out.println("In DAO--->> In createRole method --->>>In try block --->>>After saveOrUpdate--->> After transaction.commit");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "ERROR";
		}
		
		
		return "SUCCESS";
		
	}
	
	//Fetch Portal Apps from Database
	@SuppressWarnings("unchecked")
	public List<PortalAppPojo> getAllModules(PortalAppPojo portalAppPOJO)
	{
		
		ArrayList<PortalAppPojo> getAllModulesList = null;
		
		try
    	{
			Integer temp = portalAppPOJO.getParentId();
			System.out.println("temp = "+temp);
			System.out.println("################ In DAO---->>> In getAllModules() Method---->> In begining of Try block#############");
    		String query = "from PortalAppPojo where parentId=1";
    		
    		System.out.println("query:::::::::::::::::::::::::::::::::::::::::::::::::::::::::"+query);
    		
    		Session session=HibernateUtil.getsession();
    		getAllModulesList= (ArrayList<PortalAppPojo>) session.createQuery(query).list();
    		 
    		System.out.println("Size of getAllModulesList is::::::::::::::::::::::::::::::::::::::"+getAllModulesList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}

	  return getAllModulesList;
	 }
	
	// Update or Change Password
	public void chgPassword(ChgPasswordActionPojo chgPasswordPOJO) {
		
		try{	
			
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			s.update(chgPasswordPOJO);
			transaction.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<LoginActionPojo> securityCheck(LoginActionPojo loginActionPOJO) {

			List<LoginActionPojo> pwdCheckList = null;
			
			try
	    	{
				String temp = loginActionPOJO.getJ_username().trim();
				System.out.println("temp = "+temp);
				
				
				
	    		String query = "from LoginActionPojo where userName='"+temp+"'";
	    		
	    		System.out.println("query:::::::::::::::::::::::::::::::::::::::::::::::::::::::::"+query);
	    		
	    		Session session=HibernateUtil.getsession();
	    		pwdCheckList= session.createQuery(query).list();
	    		 
	    		System.out.println("Size of pwdCheckList is::::::::::::::::::::::::::::::::::::::"+pwdCheckList.size());
	    		
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    	}

		return pwdCheckList;
	}


	@SuppressWarnings("unchecked")
	public List<CreateRoleActionPojo> fetchRoles() {

		List<CreateRoleActionPojo> rolesList = null;
		try
		{
			String query="from CreateRoleActionPojo" ;
			Session session=HibernateUtil.getsession();
			rolesList= session.createQuery(query).list();
			
		}
		catch(HibernateException he)
		{
			he.printStackTrace();
			return null;
		}
		return rolesList;
	}

	/*
	 * Saving tour plan in database.
	   */
	
	public String createUserTourPlan(TourPlanningActionPojo tourPlanningPOJO) {
		
		try{	
			
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			
			int j = tourPlanningPOJO.getTourPurposeArray().length;
			for(int i = 0 ;i < j ; i++ ){
				
				TourPlanningActionPojo TPnewPOJO = new TourPlanningActionPojo();

				TPnewPOJO.setDescDoc(tourPlanningPOJO.getDescArrayForDoc()[i]);
				TPnewPOJO.setDescChem(tourPlanningPOJO.getDescArrayForChem()[i]);
				TPnewPOJO.setTourPurpose(tourPlanningPOJO.getTourPurposeArray()[i]);
				TPnewPOJO.setTime(tourPlanningPOJO.getTimeArray()[i]);
				
				TPnewPOJO.setUserName(LoginAction.user);
				TPnewPOJO.setEmpId(LoginAction.empIdOfCurrentSession);
				TPnewPOJO.setIsCompleted(false);
				
				DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				TPnewPOJO.setTourDateDB((Date)formatter.parse(tourPlanningPOJO.getTourDateArray()[i]));
				
				TPnewPOJO.setSeq_no(tourPlanningPOJO.getSeq_no());
				
				System.out.println("In DDDDDDAAAAAAAOOOOOOO IIIIMMMMMPPPPPLLLLLLL @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@seq_no = "+tourPlanningPOJO.getSeq_no());
				
				s.saveOrUpdate(TPnewPOJO);
				System.out.println("In DAO--->> In createUserTourPlan method --->>>In try block --->>>After saveOrUpdate");
				//transaction.commit();
				//System.out.println("In DAO--->> In createUserTourPlan method --->>>In try block --->>>After saveOrUpdate--->> After transaction.commit");
			}
			transaction.commit();
			System.out.println("In DAO--->> In createUserTourPlan method --->>>In try block --->>>After saveOrUpdate--->> After transaction.commit");
		
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "ERROR";
		}
		return "SUCCESS";
	}

	public String createRegion(CreateRegionActionPojo createRegionPOJO) {
		
		try{	
			
			System.out.println("In DAO--->> In createRegion method --->>>In try block");
			
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			s.saveOrUpdate(createRegionPOJO);
			System.out.println("In DAO--->> In createRegion method --->>>In try block --->>>After saveOrUpdate");
			transaction.commit();
			System.out.println("In DAO--->> In createRegion method --->>>In try block --->>>After saveOrUpdate--->> After transaction.commit");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "ERROR";
		}
		
		return "SUCCESS";
	}

	/*
	 *  Fetching region from database for createHoliday.jsp
	   */
	
	@SuppressWarnings("unchecked")
	public List<CreateRegionActionPojo> fetchRegion() {
		
		List<CreateRegionActionPojo> regionList = null;
		
		try
		{
			String query="from CreateRegionActionPojo" ;
			Session session=HibernateUtil.getsession();
			regionList= session.createQuery(query).list();
			
		}
		catch(HibernateException he)
		{
			he.printStackTrace();
			return null;
		}
		
		return regionList;
	}

	
	/*
	 *  Saving Holiday in database
	   */
	
	public String createHoliday(CreateHolidayActionPojo createHolidayPOJO) {
		
		try{
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			
			int j = createHolidayPOJO.getHolidayDateArr().length;
			
			for(int i = 0 ; i < j ; i++){
				
				CreateHolidayActionPojo createPOJO = new CreateHolidayActionPojo();
				
				createPOJO.setHolidayDate(createHolidayPOJO.getHolidayDateArr()[i]);
				createPOJO.setHolidayDesc(createHolidayPOJO.getHolidayDescArr()[i]);
				
				DateFormat format=new SimpleDateFormat("dd/MM/yyyy");
				Date holiDate=format.parse(createPOJO.getHolidayDate());
				createPOJO.setHolidayDateDB(holiDate);
				
				createPOJO.setHolidayRegion(createHolidayPOJO.getHolidayRegionArr()[i]);
				
				s.saveOrUpdate(createPOJO);
				
			}
			transaction.commit();
			
		}catch (Exception e) {
			
			e.printStackTrace();
			return "ERROR";
		
		}
		return "SUCCESS";
	}

	/*
	 * Search Holiday from Database 
	  */
	
	@SuppressWarnings("unchecked")
	public List<CreateHolidayActionPojo> searchHoliday(CreateHolidayActionPojo createHolidayPOJO) {
		
		List<CreateHolidayActionPojo> holidayList = null;
		
		try
    	{
    		System.out.println("------------------------------------------------In DAO in searchHoliday method before query---------------------------------------------------------");
    		
    		
    		String query = "from CreateHolidayActionPojo";
    		System.out.println("query"+query); 
    		System.out.println("------------------------------------------------In DAO in searchHoliday method after query---->>>>---------------------------------------------------------");
    		
    		Session session=HibernateUtil.getsession();
    		holidayList= session.createQuery(query).list();
    		System.out.println("------------------------------------------------In DAO in searchHoliday method after execution of query---->>>>---------------------------------------------------------");
    		 
    		System.out.println("Size of holidayList is::::::::::::##############:::::::::::::::#################:::::::::::"+holidayList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		return null;
    	}
		
		return holidayList;
	}

	@SuppressWarnings("unchecked")
	public List<CreateHolidayActionPojo> editHoliday(
			CreateHolidayActionPojo createHolidayPOJO) {
		
		List<CreateHolidayActionPojo> editHolidayList = null;
		try
    	{
    		System.out.println("------------------------------------------------In DAO in editHolidayList method before query---------------------------------------------------------");
    		
    		Integer temp = createHolidayPOJO.getSeq_no();
    		
    		System.out.println("temp = "+temp);
    		
    		String query = "from CreateHolidayActionPojo where seq_no="+temp;
    		System.out.println("query"+query); 
    		System.out.println("------------------------------------------------In DAO in editHolidayList method after query---->>>>---------------------------------------------------------");
    		
    		Session session=HibernateUtil.getsession();
    		editHolidayList= session.createQuery(query).list();
    		System.out.println("------------------------------------------------In DAO in editHolidayList method after execution of query---->>>>---------------------------------------------------------");
    		 
    		System.out.println("Size of editHolidayList is::::::::::::##############:::::::::::::::#################:::::::::::"+editHolidayList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		return null;
    	}
		
		return editHolidayList;
	}

	/*
	 * Deleting holiday from table in DB 
	  */
	
	public String deleteHoliday(CreateHolidayActionPojo createHolidayPOJO) {
		
		try{	
			/*
			DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			Date holidayDateDB = (Date)formatter.parse(createHolidayPOJO.getHolidayDate());
			createHolidayPOJO.setHolidayDateDB(holidayDateDB);
			*/
			System.out.println("In DAO--->> In deleteHoliday method --->>>In try block");
			
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			s.delete(createHolidayPOJO);
			System.out.println("In DAO--->> In deleteHoliday method --->>>In try block --->>>After saveOrUpdate");
			transaction.commit();
			System.out.println("In DAO--->> In deleteHoliday method --->>>In try block --->>>After saveOrUpdate--->> After transaction.commit");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "ERROR";
			
		}
		return "SUCCESS";
	}

	/*
	 * Search user from DB for Administration 
	  */

	@SuppressWarnings("unchecked")
	public List<CreateUserActionPojo> searchUser(
			CreateUserActionPojo createUserPOJO) throws Exception {
		
		List<CreateUserActionPojo> userList = null;
		
		try
    	{
    		System.out.println("------------------------------------------------In DAO in searchUser method before query---------------------------------------------------------");
    		String temp = createUserPOJO.getUserName().trim();
			System.out.println("temp = "+temp);
    		
    		String query = "from CreateUserActionPojo where lower(userName)= TRIM(LOWER('"+temp+"'))";
    		System.out.println("query"+query); 
    		System.out.println("------------------------------------------------In DAO in searchUser method after query---->>>>---------------------------------------------------------");
    		
    		Session session=HibernateUtil.getsession();
    		userList= session.createQuery(query).list();
    		System.out.println("------------------------------------------------In DAO in searchUser method after execution of query---->>>>---------------------------------------------------------");
    		 
    		System.out.println("Size of userList is::::::::::::##############:::::::::::::::#################:::::::::::"+userList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		throw new Exception();
    	}
		
		if (userList.size()==0) {
			
			System.out.println("In DAO ################################# userList.size is 0 than return null");
			
			return userList;
		}
		else
			return userList;
	}

	/*
	 *  Fetch role name from database for security check while logging to view 
	 *  role based JSP 
	  */

	@SuppressWarnings("unchecked")
	public String fetchRoleName(Integer roleId_temp) throws Exception {
		
		String roleName = null;
		List<CreateRoleActionPojo> rolesList = null;
		try
    	{
    		String query = "from CreateRoleActionPojo where roleId="+roleId_temp;
    		System.out.println("query"+query); 
    		
    		Session session=HibernateUtil.getsession();
    		rolesList= session.createQuery(query).list();
    		
    		System.out.println("roleName is::::::::::::##############:::::::::::::::#################:::::::::::"+roleName);
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		throw new Exception();
    	}
		
		if (rolesList.size()==0) {
			
			System.out.println("In DAO ################################# roleName is empty than return null");
			
			return null;
		}
		else{
			Iterator<CreateRoleActionPojo> dsd= rolesList.iterator();
			while(dsd.hasNext())
			{
				CreateRoleActionPojo actionPojo=	(CreateRoleActionPojo) dsd.next();
				roleName = actionPojo.getRoleName();
				System.out.println("roleName is::::::::::::##############:::::::::::::::#################:::::::::::"+roleName);
			}
			System.out.println("roleName is::::::::::::##############:::::::::::::::#################:::::::::::"+roleName);
			
			return roleName;
		}
			
	}

	/*
	 * User Name Unique Check 
	  */

	@SuppressWarnings("unchecked")
	public Boolean fetchUserNameForUniqueCheck(String userName) throws Exception {
		
		List<CreateUserActionPojo> userNameList = null;
		try
    	{
    		String query = "from CreateUserActionPojo where userName='"+userName+"'";
    		System.out.println("query"+query); 
    		
    		Session session=HibernateUtil.getsession();
    		userNameList= session.createQuery(query).list();
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		throw new Exception();
    	}
		System.out.println("Return size-->"+userNameList.size());
		if (userNameList.size()==0) {
			
			System.out.println("Return True");
			
			return true;
		}
		else{
			
			System.out.println("Return False");
			
			return false;
		}
	}

	/*
	 * Action to fetch Doctor List for tour planning and DCR page 
	  */
	@SuppressWarnings("unchecked")
	public List<AddDoctorActionPojo> fetchDoctor() {
		
		List<AddDoctorActionPojo> docList = null;
		
		try
    	{
    		System.out.println("------------------------------------------------In DAO in fetchDoctor method before query---------------------------------------------------------");
    		
    		
    		String query = "from AddDoctorActionPojo";
    		System.out.println("query"+query); 
    		System.out.println("------------------------------------------------In DAO in fetchDoctor method after query---->>>>---------------------------------------------------------");
    		
    		Session session=HibernateUtil.getsession();
    		docList= session.createQuery(query).list();
    		System.out.println("------------------------------------------------In DAO in fetchDoctor method after execution of query---->>>>---------------------------------------------------------");
    		 
    		System.out.println("Size of docList is::::::::::::##############:::::::::::::::#################:::::::::::"+docList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		return null;
    	}
		
		return docList;
	}

	/*
	 * Action to fetch Chemist List for tour planning  & DCR page & Order Booking Page
	  */
	
	@SuppressWarnings("unchecked")
	public List<AddChemistActionPojo> fetchChemist() {

		List<AddChemistActionPojo> chemistList = null;
		
		try
    	{
    		System.out.println("------------------------------------------------In DAO in fetchChemist method before query---------------------------------------------------------");
    		
    		
    		String query = "from AddChemistActionPojo";
    		System.out.println("query"+query); 
    		System.out.println("------------------------------------------------In DAO in fetchChemist method after query---->>>>---------------------------------------------------------");
    		
    		Session session=HibernateUtil.getsession();
    		chemistList= session.createQuery(query).list();
    		System.out.println("------------------------------------------------In DAO in fetchChemist method after execution of query---->>>>---------------------------------------------------------");
    		 
    		System.out.println("Size of chemistList is::::::::::::##############:::::::::::::::#################:::::::::::"+chemistList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		return null;
    	}
		
		return chemistList;
	}
	
	
	/*
	 *  Action for Fetching tour details for Tour Planning page 
	  */
	
	@SuppressWarnings("unchecked")
	public List<TourPlanningActionPojo> fetchTourDetailsForTourPlanning() throws Exception {
		
		List<TourPlanningActionPojo> tourDetailsListForTP = null;
		TourPlanningActionPojo tourPlanningPOJO = new TourPlanningActionPojo();
		tourPlanningPOJO.setUserName(LoginAction.user);
		
		String temp = tourPlanningPOJO.getUserName();
		
		try
    	{
			System.out.println("temp = "+temp);
    		
    		String query = "from TourPlanningActionPojo where userName='"+temp+"'";
    		System.out.println("query"+query); 
    		
    		Session session=HibernateUtil.getsession();
    		
    		System.out.println("Session session=HibernateUtil.getsession();");
    		
    		tourDetailsListForTP= session.createQuery(query).list();
    		System.out.println("tourDetailsList= session.createQuery(query).list();");
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		System.out.println("Exception while fetching tour plan details");
    		
    		throw new Exception();
    	}
		
		if (tourDetailsListForTP.size()==0) {
			
			System.out.println("Returning null...................................");
			
			return tourDetailsListForTP;
		}
		else{
			Iterator<TourPlanningActionPojo> dsd= tourDetailsListForTP.iterator();
			while(dsd.hasNext())
			{
					TourPlanningActionPojo actionPojo=	(TourPlanningActionPojo) dsd.next();
					
					String dateInString = new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getTourDateDB());
					actionPojo.setTourDate(dateInString);
					
					System.out.println("tourDate is::::::::::::##############:::::::::::::::#################:::::::::::"+actionPojo.getTourDate());
			}
			return tourDetailsListForTP;
		}
	}

	/*
	 *  Action for Fetching tour details for DCR page 
	  */
	
	@SuppressWarnings("unchecked")
	public List<TourPlanningActionPojo> fetchTourDetails() throws Exception {
		
		List<TourPlanningActionPojo> tourDetailsList = null;
		TourPlanningActionPojo tourPlanningPOJO = new TourPlanningActionPojo();
		tourPlanningPOJO.setUserName(LoginAction.user);
		
		String temp = tourPlanningPOJO.getUserName();
		
		try
    	{
			System.out.println("temp = "+temp);
    		
    		String query = "from TourPlanningActionPojo where isCompleted=false and userName='"+temp+"'";
    		System.out.println("query"+query); 
    		
    		Session session=HibernateUtil.getsession();
    		
    		System.out.println("Session session=HibernateUtil.getsession();");
    		
    		tourDetailsList= session.createQuery(query).list();
    		System.out.println("tourDetailsList= session.createQuery(query).list();");
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		System.out.println("Exception while fetching tour plan details");
    		
    		throw new Exception();
    	}
		
		if (tourDetailsList.size()==0) {
			
			System.out.println("Returning null...................................");
			
			return tourDetailsList;
		}
		else{
			
			Iterator<TourPlanningActionPojo> dsd= tourDetailsList.iterator();
			while(dsd.hasNext())
			{
					TourPlanningActionPojo actionPojo=	(TourPlanningActionPojo) dsd.next();
					
					String dateInString = new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getTourDateDB());
					actionPojo.setTourDate(dateInString);
					System.out.println("tourDate is::::::::::::##############:::::::::::::::#################:::::::::::"+actionPojo.getTourDate());
			}
			
			return tourDetailsList;
		
		}
	}
	
	/*
	 * Action to save DCR into database
	  */

	public String submitDCR(DcrActionPojo dcrPOJO) throws Exception {
		
		try{	
			
			System.out.println("<<------>> In Try <<------>>");
			
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			
			if(dcrPOJO.getExcelUpload() == 0){
				int j = dcrPOJO.getTourDateArray().length;
				System.out.println("In submitDCR -->> J -->> "+j);
				for(int i = 0 ;i < j ; i++ ){
					
					System.out.println("<<------>> In For <<------>>");
					
					DcrActionPojo dcrNewPOJO = new DcrActionPojo();
					//TourPlanningActionPojo TPnewPOJO = new TourPlanningActionPojo();
					
					dcrNewPOJO.setRemarks(dcrPOJO.getRemarksArray()[i]);
					dcrNewPOJO.setTime(dcrPOJO.getTimeArray()[i]);
					dcrNewPOJO.setDescDoc(dcrPOJO.getDescArrayForDoc()[i]);
					dcrNewPOJO.setDescChem(dcrPOJO.getDescArrayForChem()[i]);
					dcrNewPOJO.setWorkType(dcrPOJO.getWorkTypeArray()[i]);
					dcrNewPOJO.setWorkedWith(dcrPOJO.getWorkedWithArray()[i]);
					dcrNewPOJO.setTopicDiss(dcrPOJO.getTopicDissArray()[i]);
					
					DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
					dcrNewPOJO.setTourDateDB((Date)formatter.parse(dcrPOJO.getTourDateArray()[i]));
					dcrNewPOJO.setNxtVisitDB((Date)formatter.parse(dcrPOJO.getNxtVisitArray()[i]));
					
					dcrNewPOJO.setCreatedDate(new java.util.Date());
					dcrNewPOJO.setUserName(LoginAction.user);
					dcrNewPOJO.setEmpId(LoginAction.empIdOfCurrentSession);
					
					s.saveOrUpdate(dcrNewPOJO);
					
					System.out.println("After s.saveOrUpdate(dcrNewPOJO); ");
				}
			}
			else {
				dcrPOJO.setCreatedDate(new java.util.Date());
				s.saveOrUpdate(dcrPOJO);
			}
			transaction.commit();
			System.out.println("<-- After transaction.commit() --> ");
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			throw new Exception();
			
		}
		
		return "Sucessfully Submitted";
	}
	
	/*
	 * Action to fetch Chemist for Order booking page 
	  */

	@SuppressWarnings("unchecked")
	public List<AddProductActionPojo> fetchProductList() {

		List<AddProductActionPojo> productList = null;
		
		try
    	{
    		System.out.println("------------------------------------------------In DAO in fetchProductList method before query---------------------------------------------------------");
    		
    		
    		String query = "from AddProductActionPojo";
    		System.out.println("query"+query); 
    		System.out.println("------------------------------------------------In DAO in fetchProductList method after query---->>>>---------------------------------------------------------");
    		
    		Session session=HibernateUtil.getsession();
    		productList= session.createQuery(query).list();
    		System.out.println("------------------------------------------------In DAO in fetchProductList method after execution of query---->>>>---------------------------------------------------------");
    		 
    		System.out.println("Size of productList is::::::::::::##############:::::::::::::::#################:::::::::::"+productList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		return null;
    	}
		
		return productList;
	}
	
	/*
	 * Action to Book Order in DB 
	  */

	public String bookOrder(OrderBookingActionPojo orderBookingPOJO) {
		
		try{	
			
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			
			int j = orderBookingPOJO.getProductIdArr().length;
			for(int i = 0 ;i < j ; i++ ){
				
				OrderBookingActionPojo OrderNewPOJO = new OrderBookingActionPojo();
				
				OrderNewPOJO.setProductId(orderBookingPOJO.getProductIdArr()[i]);
				OrderNewPOJO.setQty(orderBookingPOJO.getQtyArr()[i]);
				OrderNewPOJO.setChemId(orderBookingPOJO.getChemIdArr()[i]);
				
				OrderNewPOJO.setUserName(LoginAction.user);
				OrderNewPOJO.setEmpId(LoginAction.empIdOfCurrentSession);
				OrderNewPOJO.setCreatedDate(new java.util.Date());
				
				DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				OrderNewPOJO.setOrderDateDB((Date)formatter.parse(orderBookingPOJO.getOrderDateArr()[i]));
				OrderNewPOJO.setDeliveryDateDB((Date)formatter.parse(orderBookingPOJO.getDeliveryDateArr()[i]));
				
				OrderNewPOJO.setSeq_no(orderBookingPOJO.getSeq_no());
				
				s.save(OrderNewPOJO);
				System.out.println("In DAO--->> In createUserTourPlan method --->>>In try block --->>>After saveOrUpdate");
			}
			transaction.commit();
		
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "ERROR";
		}
		return "SUCCESS";
	}
	
	/*
	 * Action to Search Booked-Order for order booking page 
	  */
	@SuppressWarnings("unchecked")
	public List<OrderBookingActionPojo> searchBookedOrder(OrderBookingActionPojo orderBookingPOJO,String empId) throws Exception {
		 List<OrderBookingActionPojo> bookedOrderSearchList = null;
		
		 try
	    	{
			 System.out.println("Ashish Pandey");
				 orderBookingPOJO.setChemId(orderBookingPOJO.getChemIdArr()[0]);
				 orderBookingPOJO.setProductId(orderBookingPOJO.getProductIdArr()[0]);
				 
				 String query = "from OrderBookingActionPojo where empId ='"+empId+"'";
		    		System.out.println("query --> "+query); 
		    		
		    		Session session=HibernateUtil.getsession();
		    		bookedOrderSearchList= session.createQuery(query).list();
		    		System.out.println("------------------------------------------------In DAO in searchDoctor method after execution of query---->>>>---------------------------------------------------------");
		    		 
		    		System.out.println("Size of bookedOrderSearchList is::::::::::::::::::::::::::::::::::::::"+bookedOrderSearchList.size());
	    	}
	    	catch(Exception e)
	    	{
	    		e.printStackTrace();
	    		throw e;
	    	}
			
			if (bookedOrderSearchList.size() == 0) {
				 orderBookingPOJO.setErrorMsg("No Data Found...");
				 return null;
			}
			else {
				
				Iterator<OrderBookingActionPojo> dsd= bookedOrderSearchList.iterator();
				while(dsd.hasNext())
				{
						OrderBookingActionPojo actionPojo=	(OrderBookingActionPojo) dsd.next();
						
						String dateInString = new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getOrderDateDB());
						actionPojo.setOrderDate(dateInString);
						
						actionPojo.setDeliveryDate(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getDeliveryDateDB()));
						actionPojo.setCreatedDateStr(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getCreatedDate()));
				}
				
				return bookedOrderSearchList;
			}
	}

	/*
	 * Action to fetch master list ofTour Purpose 
	  */
	
	@SuppressWarnings("unchecked")
	public List<TourPurposeActionPojo> fetchTourPurposeDetails() {
		
		List<TourPurposeActionPojo> tourPurposeList = null;
		
		try
    	{
    		
    		String query = "from TourPurposeActionPojo";
    		System.out.println("query"+query); 
    		
    		Session session=HibernateUtil.getsession();
    		tourPurposeList= session.createQuery(query).list();
    		System.out.println("Size of tourPurposeList is::::::::::::##############:::::::::::::::#################:::::::::::"+tourPurposeList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		return null;
    	}
		
		return tourPurposeList;
	}

	/*
	 * Fetch TourPlan for edit 
	  */
	
	@SuppressWarnings("unchecked")
	public List<TourPlanningActionPojo> fetchTPforEdit(
			TourPlanningActionPojo tourPlanningPOJO) throws Exception {
		
		List<TourPlanningActionPojo> TPListforEdit = null;
		
		try
    	{
			Integer temp = tourPlanningPOJO.getSeq_no();
			String tempUser = LoginAction.user;
			System.out.println("temp = "+temp);
    		
    		String query = "from TourPlanningActionPojo where seq_no="+temp+"and userName='"+tempUser+"'";
    		System.out.println("query"+query); 
    		
    		Session session=HibernateUtil.getsession();
    		
    		System.out.println("Session session=HibernateUtil.getsession();");
    		
    		TPListforEdit= session.createQuery(query).list();
    		System.out.println("TPListforEdit= session.createQuery(query).list();");
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		System.out.println("Exception while fetching tour plan details");
    		
    		throw new Exception();
    	}
		
		if (TPListforEdit.size()==0) {
			
			System.out.println("Returning null...................................");
			
			return TPListforEdit;
		}
		else{
			
			Iterator<TourPlanningActionPojo> dsd= TPListforEdit.iterator();
			while(dsd.hasNext())
			{
					TourPlanningActionPojo actionPojo=	(TourPlanningActionPojo) dsd.next();
					
					String dateInString = new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getTourDateDB());
					actionPojo.setTourDate(dateInString);
					System.out.println("tourDate is::::::::::::##############:::::::::::::::#################:::::::::::"+actionPojo.getTourDate());
			}
			
		}
		
		return TPListforEdit;
	}

	/*
	 * Search Product Fom DB 
	  */

	@SuppressWarnings("unchecked")
	public List<AddProductActionPojo> searchProduct(
			AddProductActionPojo addProductPOJO) {
		List<AddProductActionPojo> productList = null;
		
		try
    	{
    		System.out.println("------------------------------------------------In DAO in searchProduct method before query---------------------------------------------------------");
    		
    		String query = "from AddProductActionPojo where product_id like nvl('%"+addProductPOJO.getProduct_id()+"%',product_id) and product_name like nvl('%"+addProductPOJO.getProduct_name()+"%',product_name) order by seq_no desc";
    		System.out.println("query"+query); 
    		
    		Session session=HibernateUtil.getsession();
    		productList= session.createQuery(query).list();
    		System.out.println("------------------------------------------------In DAO in searchProduct method after execution of query---->>>>---------------------------------------------------------");
    		 
    		System.out.println("Size of productList is::::::::::::::::::::::::::::::::::::::"+productList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		throw e;
    	}
		
		if(productList.size()==0){
			
			addProductPOJO.setErrorMsg("Product Not Found...");
			
			return null;
		}
		else {
			
			Iterator<AddProductActionPojo> dsd= productList.iterator();
			while(dsd.hasNext())
			{
				AddProductActionPojo actionPojo=	(AddProductActionPojo) dsd.next();
					if(actionPojo.getDos_db() != null)
					{
						String dateInString = new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getDos_db());
						actionPojo.setDos(dateInString);
						System.out.println("Date Of Starting --->> "+actionPojo.getDos());
					}
			}
			
			return productList;
		}
		
	}

	/*
	 * Action For View And Edit of Product 
	  */
		
	@SuppressWarnings("unchecked")
	public List<AddProductActionPojo> searchForViewOrEdit(
			AddProductActionPojo addProductPOJO) {
		
		List<AddProductActionPojo> productListViewEdit = null;
		
		try
    	{
			Integer temp = addProductPOJO.getSeq_no();
			System.out.println("temp = "+temp);
			
			
			
    		String query = "from AddProductActionPojo where seq_no="+temp;
    		
    		System.out.println("query:::::::::::::::::::::::::::::::::::::::::::::::::::::::::"+query);
    		
    		Session session=HibernateUtil.getsession();
    		productListViewEdit= session.createQuery(query).list();
    		 
    		System.out.println("Size of mrEditList is::::::::::::::::::::::::::::::::::::::"+productListViewEdit.size());
    		if (productListViewEdit.size() == 0) {
				System.out.println(":::::::::::::::::::::::::::::::The List Is Empty:::::::::::::::::::::::::::::::::::::::::::::::::");
			}
    		
    		else{
	    		Iterator<AddProductActionPojo> iterator = productListViewEdit.iterator();
	    		while (iterator.hasNext()) {
	    			
	    			AddProductActionPojo actionPojo =(AddProductActionPojo) iterator.next();
	    			if(actionPojo.getDos_db() != null){
	    				String dateInString = new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getDos_db());
						actionPojo.setDos(dateInString);
						System.out.println("Date Of Starting --->> "+actionPojo.getDos());
	    			}
	    		}
    		}
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
		
		return productListViewEdit;
	}

	/*
	 * Action To search Chemist 
	  */
	
	@SuppressWarnings("unchecked")
	public List<AddChemistActionPojo> searchChemist(
			AddChemistActionPojo addChemistPojo) {
		
		List<AddChemistActionPojo> chemList = null;
		
		try
    	{
    		System.out.println("------------------------------------------------In DAO in searchProduct method before query---------------------------------------------------------");
    		String temp = addChemistPojo.getTer_id();
    		System.out.println("ter_id = "+temp);
    		String query = "from AddChemistActionPojo where chemist_name like nvl(LOWER('%"+addChemistPojo.getChemist_name()+"%'),chemist_name) and ter_id like nvl(LOWER('%"+addChemistPojo.getTer_id()+"%'),ter_id) and active = nvl("+addChemistPojo.getActive()+",active) order by chemist_name desc";
    		System.out.println("query --> "+query); 
    		
    		Session session=HibernateUtil.getsession();
    		chemList= session.createQuery(query).list();
    		System.out.println("------------------------------------------------In DAO in searchProduct method after execution of query---->>>>---------------------------------------------------------");
    		 
    		System.out.println("Size of chemList is::::::::::::::::::::::::::::::::::::::"+chemList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		throw e;
    	}
		
		
		
		return chemList;
	}
	

	@SuppressWarnings("unchecked")
	public List<AddChemistActionPojo> searchChemistFinal(AddChemistActionPojo addChemistPOJO) {
			
		List<AddChemistActionPojo> chemList = null;
		
    	try
    	{
    		System.out.println("------------------------------------------------In DAO in searchChemistFinal method before query---------------------------------------------------------");
    		
    		String query = "from AddChemistActionPojo where LOWER(chemist_name) like nvl(LOWER('%"+addChemistPOJO.getChemist_name()+"%'),chemist_name) and ter_id like nvl('%"+addChemistPOJO.getTer_id()+"%',ter_id) and active = nvl("+addChemistPOJO.getActive()+",active) order by chemist_name desc";
    		System.out.println("query <><><><><><><><><> "+query); 
    		
    		Session session=HibernateUtil.getsession();
    		chemList= session.createQuery(query).list();
    		 
    		System.out.println("Size of chemList is::::::::::::::::::::::::::::::::::::::"+chemList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	    	
			return chemList;
	}

	/*
	 * Action for View And Edit Chemist 
	  */
	
	@SuppressWarnings("unchecked")
	public List<AddChemistActionPojo> viewAndEditChemist(
			AddChemistActionPojo addChemistPojo) {
		List<AddChemistActionPojo> chemListForViewAndEdit = null;
		
		try
    	{
			Integer temp = addChemistPojo.getChemist_id();
			System.out.println("temp ----->>> = "+temp);
			
			
			
    		String query = "from AddChemistActionPojo where chemist_id="+temp;
    		
    		System.out.println("query:::::::::::::::::::::::::::::::::::::::::::::::::::::::::"+query);
    		
    		Session session=HibernateUtil.getsession();
    		chemListForViewAndEdit= session.createQuery(query).list();
    		 
    		System.out.println("Size of chemListForViewAndEdit is::::::::::::::::::::::::::::::::::::::"+chemListForViewAndEdit.size());
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
		
		
		return chemListForViewAndEdit;
	}

	@SuppressWarnings("unchecked")
	public List<AddDoctorActionPojo> viewOrEditDoctor(AddDoctorActionPojo addDoctorPOJO) {
		
		List<AddDoctorActionPojo> docListForViewAndEdit = null;
		
		try
    	{
			Integer temp = addDoctorPOJO.getDoc_id();
			System.out.println("temp ----->>> = "+temp);
			
			
			
    		String query = "from AddDoctorActionPojo where doc_id="+temp;
    		
    		System.out.println("query:::::::::::::::::::::::::::::::::::::::::::::::::::::::::"+query);
    		
    		Session session=HibernateUtil.getsession();
    		docListForViewAndEdit= session.createQuery(query).list();
    		 
    		System.out.println("Size of docListForViewAndEdit is::::::::::::::::::::::::::::::::::::::"+docListForViewAndEdit.size());
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
		
		return docListForViewAndEdit;
		
	}

	/*
	 * Action to search Doctor from DB 
	  */
	
	@SuppressWarnings("unchecked")
	public List<AddDoctorActionPojo> searchDoctor(
			AddDoctorActionPojo addDoctorPOJO) {
		
		List<AddDoctorActionPojo> docList = null;
		
		try
    	{
    		String query = "from AddDoctorActionPojo where LOWER(doctor_name) like nvl(LOWER('%"+addDoctorPOJO.getDoctor_name()+"%'),doctor_name) and ter_id like nvl('%"+addDoctorPOJO.getTer_id()+"%',ter_id) and active = nvl("+addDoctorPOJO.getActive()+",active) order by doctor_name desc";
    		System.out.println("query --> "+query); 
    		
    		Session session=HibernateUtil.getsession();
    		docList= session.createQuery(query).list();
    		System.out.println("------------------------------------------------In DAO in searchDoctor method after execution of query---->>>>---------------------------------------------------------");
    		 
    		System.out.println("Size of docList is::::::::::::::::::::::::::::::::::::::"+docList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		throw e;
    	}
		
		if (docList.size() == 0) {
			 addDoctorPOJO.setErrorMsg("No Data Found...");
			 return null;
		}
		else {
			return docList;
		}
		
	}
	
	/*
	 * Action to search Territory 
	  */

	@SuppressWarnings("unchecked")
	public List<AddTerritoryActionPojo> searchTerritory(
			AddTerritoryActionPojo addTerritoryPOJO) {
		List<AddTerritoryActionPojo> territoryListAll = null;
		
		try
    	{																																
    		String query = "from AddTerritoryActionPojo where LOWER(territory) like nvl(LOWER('%"+addTerritoryPOJO.getTerritory()+"%'),territory) and LOWER(ter_id) like nvl(LOWER('%"+addTerritoryPOJO.getTer_id()+"%'),ter_id) order by territory desc";
    		System.out.println("query --> "+query); 
    		
    		Session session=HibernateUtil.getsession();
    		territoryListAll= session.createQuery(query).list();
    		 
    		System.out.println("Size of territoryListAll is::::::::::::::::::::::::::::::::::::::"+territoryListAll.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		throw e;
    	}
		
		if (territoryListAll.size() == 0) {
			addTerritoryPOJO.setErrorMsg("No Data Found...");
			 return null;
		}
		else {
			return territoryListAll;
		}
		
	}

	
	/*
	 * Action to search Territory for Edit 
	  */
	
	@SuppressWarnings("unchecked")
	public List<AddTerritoryActionPojo> searchForEditTerritory(
			AddTerritoryActionPojo addTerritoryPOJO) {
		
		List<AddTerritoryActionPojo> territoryListEdit = null;
		
		try
    	{
			Integer temp = addTerritoryPOJO.getSeq_no();
			System.out.println("temp ----->>> = "+temp);
			
			
			
    		String query = "from AddTerritoryActionPojo where seq_no="+temp;
    		
    		System.out.println("query:::::::::::::::::::::::::::::::::::::::::::::::::::::::::"+query);
    		
    		Session session=HibernateUtil.getsession();
    		territoryListEdit= session.createQuery(query).list();
    		 
    		System.out.println("Size of territoryListEdit is::::::::::::::::::::::::::::::::::::::"+territoryListEdit.size());
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
		
		return territoryListEdit;
	}
	@SuppressWarnings("unchecked")
	public List<AddTerritoryActionPojo> searchValueOfTerr(List<String> terrValues) {
		
		List<AddTerritoryActionPojo> terrrList = null;
		List<AddTerritoryActionPojo> territoryListValueInEdit = new ArrayList<AddTerritoryActionPojo>();
		
		try
    	{
    		for (String e : terrValues)  		
		      {  
		         System.out.println("terrValues : "+e);  
		         
		         String query = "from AddTerritoryActionPojo where ter_id='"+e.trim()+"'";
	    		System.out.println("query --> "+query); 
	    		Session session=HibernateUtil.getsession();
	    		terrrList= session.createQuery(query).list();
	    		
	    		System.out.println("docListCurr --> "+terrrList.size());
	    		
	    		
	    		territoryListValueInEdit.addAll(terrrList);
	    		
	    		System.out.println("Size of terrListCurr ---> "+territoryListValueInEdit.size());
		      } 
    		
    		 
    		System.out.println("Size of territoryListValueInEdit is::::::::::::::::::::::::::::::::::::::"+terrrList.size());
    	}
    	catch(Exception e)
    	{
    		System.out.println("Exception While converting multiple territory to single territory"+e);
			e.printStackTrace();
			throw e;
    	}
		return territoryListValueInEdit;
	}
	
	/*
	 * Action to delete territory 
	  */

	public String deleteTerritory(AddTerritoryActionPojo addTerritoryPOJO) {
		
		try{	
			
			Session s=HibernateUtil.getsession();			
			transaction=s.beginTransaction();			
			transaction.begin();
			s.delete(addTerritoryPOJO);
			
			System.out.println("Deleted Successfuly....");
			
			transaction.commit();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return "ERROR";
			
		}
		return "SUCCESS";
	}
	
	/*
	 * Action to fetch territory of Current User 
	  */

	@SuppressWarnings("unchecked")
	public String territoryOfCurrentUser(String empId) {

		List<AddMRActionPojo> ListofMr = null;
		String territoryIdCurrentUser = null;
		
		try
    	{	
			
    		String query = "from AddMRActionPojo where  emp_Id ='"+empId+"'";
    		System.out.println("query --> "+query); 
    		
    		Session session=HibernateUtil.getsession();
    		ListofMr= session.createQuery(query).list();
    		 
    		System.out.println("Size of ListofMr is::::::::::::::::::::::::::::::::::::::"+ListofMr.size());
    		
    		if(ListofMr.size()!=0)
    		{
	    		Iterator<AddMRActionPojo> dsd= ListofMr.iterator();
				while(dsd.hasNext())
				{
					AddMRActionPojo actionPojo=	(AddMRActionPojo) dsd.next();
					territoryIdCurrentUser = actionPojo.getTer_id();
					System.out.println("territoryForCurrentUser is --> "+territoryIdCurrentUser);
				}
    		}
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		throw e;
    	}
		
		return territoryIdCurrentUser;
	}

	/*
	 * Action to fetch doctor territory-wise 
	  */
	
	@SuppressWarnings({ "unchecked" })
	public List<AddDoctorActionPojo> doctorTerritoryWise(String territoryIdCurrentUser) {
		
		List<AddDoctorActionPojo> docListCurrFetch = null;
		List<AddDoctorActionPojo> docListCurr = new ArrayList<AddDoctorActionPojo>();
		
		try{
			String tempTer_id = territoryIdCurrentUser;
			
			System.out.println("tempTer_id ---> "+tempTer_id.length());
			
			String delimiter = ","; 						//To classify string from the DB
			String[] temp = tempTer_id.split(delimiter);				//split method is used to split the string value with a string regex (here it is delimiter) coming from DB as in DB if multiple select value is stored then In DB it is stored as one string separated by a comma(,).
			for(int i =0 ; i < temp.length ; i++){			//for loop to check only
				System.out.println("temp["+i+"] ---> "+temp[i]);
				
				
				String query = "from AddDoctorActionPojo where ter_id='"+temp[i].trim()+"'";
	    		System.out.println("query"+query); 
	    		Session session=HibernateUtil.getsession();
	    		docListCurrFetch= session.createQuery(query).list();
	    		
	    		System.out.println("docListCurr --> "+docListCurrFetch.size());
	    		
	    		
	    		docListCurr.addAll(docListCurrFetch);
	    		
	    		System.out.println("Size of tempList ---> "+docListCurr.size());
	    		
			}
			
		}catch(Exception e){
			System.out.println("Exception While converting multiple territory to single territory"+e);
			e.printStackTrace();
			throw e;
		}
		return docListCurr;
	}

	/*
	 * Action to fetch Chemist Territory-wise 
	  */
	
	@SuppressWarnings("unchecked")
	public List<AddChemistActionPojo> chemistTerritoryWise(
			String territoryIdCurrentUser) {
		
		List<AddChemistActionPojo> chemistListCurrFetch = null;
		
		List<AddChemistActionPojo> chemistListCurr = new ArrayList<AddChemistActionPojo>();
		
		try{
			String tempTer_id = territoryIdCurrentUser;
			String delimiter = ","; 						//To classify string from the DB
			String[] temp = tempTer_id.split(delimiter);				//split method is used to split the string value with a string regex (here it is delimiter) coming from DB as in DB if multiple select value is stored then In DB it is stored as one string separated by a comma(,).
			for(int i =0 ; i < temp.length ; i++){			//for loop to check only
				System.out.println("temp["+i+"] ---> "+temp[i]);
				
				
				String query = "from AddChemistActionPojo where ter_id='"+temp[i].trim()+"'";
	    		System.out.println("query"+query); 
	    		Session session=HibernateUtil.getsession();
	    		chemistListCurrFetch= session.createQuery(query).list();
	    		
	    		System.out.println("docListCurr --> "+chemistListCurrFetch.size());
	    		
	    		
	    		chemistListCurr.addAll(chemistListCurrFetch);
	    		
	    		System.out.println("Size of tempList ---> "+chemistListCurr.size());
	    		
			}
			
		}catch(Exception e){
			System.out.println("Exception While converting multiple territory to single territory"+e);
			e.printStackTrace();
			throw e;
		}
		
		return chemistListCurr;
	}
	
	/*
	 * Action To fetch list of Time from DB for TourPlanning
	  */

	@SuppressWarnings("unchecked")
	public List<TimeActionPojo> fetchTime() {
		List<TimeActionPojo> timeList = null;
		try
    	{
    		
    		String query = "from TimeActionPojo";
    		System.out.println("query"+query); 
    		Session session=HibernateUtil.getsession();
    		timeList= session.createQuery(query).list();

    		System.out.println("Size of timeList is -->"+timeList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		return timeList;
    	}
		return timeList;
	}
	
	/*
	 * Action to fetch Designation for Employee page(addMR.jsp) 
	  */

	@SuppressWarnings("unchecked")
	public List<DesignationActionPojo> fetchDesignation() {
		List<DesignationActionPojo> dsgnList = null;
		
		try
    	{
    		
    		String query = "from DesignationActionPojo";
    		System.out.println("query"+query); 
    		Session session=HibernateUtil.getsession();
    		dsgnList= session.createQuery(query).list();

    		System.out.println("Size of dsgnList is -->"+dsgnList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		return dsgnList;
    	}
		return dsgnList;
	}
	
	/*
	 * Action To fetch Blood Group for addMR.jsp 
	  */

	@SuppressWarnings("unchecked")
	public List<BloodGroupActionPojo> fetchBloodGroup() {
		
		List<BloodGroupActionPojo> bloodGrpList = null;
		
		try
    	{
    		
    		String query = "from BloodGroupActionPojo";
    		System.out.println("query"+query); 
    		Session session=HibernateUtil.getsession();
    		bloodGrpList= session.createQuery(query).list();

    		System.out.println("Size of bloodGrpList is -->"+bloodGrpList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		return bloodGrpList;
    	}
		return bloodGrpList;
	}
	
	/*
	 * Action to fetch States 
	  */

	@SuppressWarnings("unchecked")
	public List<StateActionPojo> fetchState() {
		List<StateActionPojo> stateList = null;
		try
    	{
    		
    		String query = "from StateActionPojo";
    		System.out.println("query"+query); 
    		Session session=HibernateUtil.getsession();
    		stateList= session.createQuery(query).list();

    		System.out.println("Size of stateList is -->"+stateList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		return stateList;
    	}
		return stateList;
	}
	
	/*
	 * Action to fetch Cities 
	  */

	@SuppressWarnings("unchecked")
	public List<CityActionPojo> fetchCity() {
		List<CityActionPojo> cityList = null;
		try
    	{
    		
    		String query = "from CityActionPojo";
    		System.out.println("query"+query); 
    		Session session=HibernateUtil.getsession();
    		cityList= session.createQuery(query).list();

    		System.out.println("Size of cityList is -->"+cityList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		return cityList;
    	}
		return cityList;
	}

	/*
	 * Fetch Work type from Database 
	  */
	
	@SuppressWarnings("unchecked")
	public List<WorkTypeActionPojo> fetchWorkType() {
		
		List<WorkTypeActionPojo> workTypeList = null;
		
		try
    	{
    		
    		String query = "from WorkTypeActionPojo";
    		System.out.println("query"+query); 
    		Session session=HibernateUtil.getsession();
    		workTypeList= session.createQuery(query).list();

    		System.out.println("Size of workTypeList is -->"+workTypeList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		throw e;
    	}
		return workTypeList;
	}
	
	/*
	 * Action to fetch topics of discussion for DCR page 
	  */

	@SuppressWarnings("unchecked")
	public List<TopicDiscussionActionPojo> fetchDiscussionTopic() {
		
		List<TopicDiscussionActionPojo> topicDiscussionList = null;
		
		try
    	{
    		
    		String query = "from TopicDiscussionActionPojo";
    		System.out.println("query"+query); 
    		Session session=HibernateUtil.getsession();
    		topicDiscussionList= session.createQuery(query).list();

    		System.out.println("Size of topicDiscussionList is -->"+topicDiscussionList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		return topicDiscussionList;
    	}
		return topicDiscussionList;
	}
	
	/*
	 * Action to search DCR from Database userwise. 
	  */

	@SuppressWarnings("unchecked")
	public List<DcrActionPojo> searchDCR(String empId) throws Exception {
		List<DcrActionPojo> dcrList = null;
		
		try
    	{
			System.out.println("empId in searchDCR = "+empId);
    		
    		String query = "from DcrActionPojo where empId='"+empId+"'";
    		System.out.println("query"+query); 
    		
    		Session session=HibernateUtil.getsession();
    		
    		System.out.println("Session session=HibernateUtil.getsession();");
    		
    		dcrList= session.createQuery(query).list();
    		System.out.println("dcrList= session.createQuery(query).list();");
    		
    		System.out.println("dcrList.size() --> "+dcrList.size());
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    		
    		System.out.println("Exception while fetching DCR List details --> "+e);
    		
    		throw new Exception();
    	}
		
		if (dcrList.size()==0) {
			
			System.out.println("Returning null...................................");
			
			return dcrList;
		}
		else{
			
			System.out.println("In Else part");
			
			Iterator<DcrActionPojo> dsd= dcrList.iterator();
			while(dsd.hasNext())
			{
					DcrActionPojo actionPojo=	(DcrActionPojo) dsd.next();
					
					String dateInString = new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getTourDateDB());
					actionPojo.setTourDate(dateInString);
					
					actionPojo.setCreatedDateStr(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getCreatedDate()));
					
					if(actionPojo.getNxtVisitDB() != null){
						actionPojo.setNxtVisit(new SimpleDateFormat("dd/MM/yyyy").format(actionPojo.getNxtVisitDB()));
					}
					
					System.out.println("tourDate is::::::::::::##############:::::::::::::::#################:::::::::::"+actionPojo.getTourDate());
			}
			
			return dcrList;
		
		}
	}

	/*
	 * Action to fetch user for tour plan for admin 
	  */
	
	@SuppressWarnings("unchecked")
	public List<CreateUserActionPojo> fetchUser() {

		List<CreateUserActionPojo> userList = null;
		
		try{
			String query = "from CreateUserActionPojo";
			System.out.println("query --> "+query);
			
			Session session = HibernateUtil.getsession();
			
			userList = session.createQuery(query).list();
			
			System.out.println("Size of userList --> "+userList.size());
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Exception while fetching userList --> "+e);
			
			return userList;
		}
		
		return userList;
	}

	/*
	 * Action to fetch created tour plan of user by Admin 
	  */
	
	@SuppressWarnings("unchecked")
	public List<TourPlanningActionPojo> tourPlanForAdmin(TourPlanningActionPojo tourPlanningPOJO) {
		
		List<TourPlanningActionPojo> tourPlanListForAdmin = null;
		
		try {
			
			System.out.println("IIIIIIIIIIIIIIIIIIIIII");
			
			String tempEmpId = tourPlanningPOJO.getEmpId();
			String tempTourDate = tourPlanningPOJO.getTourDate();
			String query = "from TourPlanningActionPojo where tourDateDB = nvl(to_date('"+tempTourDate+"','dd/mm/yyyy'),tourDateDB) AND LOWER(empId) = (nvl(LOWER('"+tempEmpId+"',empId)))"; 
			System.out.println("query --> "+query);
			
			Session session = HibernateUtil.getsession();
			tourPlanListForAdmin = session.createQuery(query).list();
			
			System.out.println("Size of tourPlanListForAdmin --> "+tourPlanListForAdmin.size());
			
		} catch (Exception e) {

			e.printStackTrace();
			System.out.println("Exception while fetching tour plan --> "+e);
			
			return null;
		}
		
		Iterator<TourPlanningActionPojo> itr = tourPlanListForAdmin.iterator();
		while (itr.hasNext()) {
			TourPlanningActionPojo actionPOJO = (TourPlanningActionPojo) itr
					.next();
			
			System.out.println("In DAO --> In Iterator --> "+actionPOJO.getTourPurpose());
			
			if(tourPlanListForAdmin.size() != 0){
				String dateInString = new SimpleDateFormat("dd/MM/yyyy").format(actionPOJO.getTourDateDB());
				actionPOJO.setTourDate(dateInString);
			}
		}
		return tourPlanListForAdmin;		
	}

	/*
	 * Action to fetch created tour plan of user by Admin 
	  */
	
	@SuppressWarnings("unchecked")
	public List<DcrActionPojo> dcrForAdmin(DcrActionPojo dcrPOJO) {

		List<DcrActionPojo> dcrListAdmin = null;
		
		try {
			
			String tempEmpId = dcrPOJO.getEmpId();
			String tempTourDate = dcrPOJO.getTourDate();
			String query = "from DcrActionPojo where tourDateDB = nvl(to_date('"+tempTourDate+"','dd/mm/yyyy'),tourDateDB) AND LOWER(empId) = (nvl(LOWER('"+tempEmpId+"',empId)))"; 
			System.out.println("query --> "+query);
			
			Session session = HibernateUtil.getsession();
			dcrListAdmin = session.createQuery(query).list();
			
			System.out.println("Size of dcrListAdmin --> "+dcrListAdmin.size());
			
		} catch (Exception e) {

			e.printStackTrace();
			System.out.println("Exception while fetching DCR --> "+e);
			
			return null;
		}
		
		Iterator<DcrActionPojo> itr = dcrListAdmin.iterator();
		while (itr.hasNext()) {
			DcrActionPojo actionPOJO = (DcrActionPojo) itr
					.next();
			
			System.out.println("In DAO --> In Iterator --> "+actionPOJO.getTopicDiss());
			
			if(dcrListAdmin.size() != 0){
				String dateInString = new SimpleDateFormat("dd/MM/yyyy").format(actionPOJO.getTourDateDB());
				System.out.println("dateInString --> "+dateInString);
				actionPOJO.setTourDate(dateInString);
				actionPOJO.setCreatedDateStr(new SimpleDateFormat("dd/MM/yyyy").format(actionPOJO.getCreatedDate()));
				if(actionPOJO.getNxtVisitDB() != null){
					actionPOJO.setNxtVisit(new SimpleDateFormat("dd/MM/yyyy").format(actionPOJO.getNxtVisitDB()));
					System.out.println("nextVisit Date --> "+actionPOJO.getNxtVisit());
				}
			}
		}
		System.out.println("returning dcrListAdmin");
		return dcrListAdmin;
	}

}//End of DaoImpl class
