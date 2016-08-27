package com.rx.adminTransaction;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellValue;
import org.apache.poi.ss.usermodel.DateUtil;

import com.dao.DaoImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.pojo.masters.AddChemistActionPojo;
import com.pojo.masters.AddDoctorActionPojo;
import com.pojo.masters.AddMRActionPojo;
import com.pojo.masters.AddProductActionPojo;
import com.pojo.masters.AddTerritoryActionPojo;
import com.pojo.medicalRepresentative.DcrActionPojo;


public class ReadExcelFile extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	DaoImpl daoImpl = new DaoImpl();
	
	
    private File upload;//The actual file
    private String empId;
    

/*
 * Action for Excel Import Starts from here 
  */

    public String showUploader()throws Exception {
		
    	return "SUCCESS";
	}
    
    
    /*
     * Action For DCR import Starts from here 
      */
    
    public String importDCR() throws Exception {
		
    	/* parse the excel file */
		List<DcrActionPojo> dcrListUpload = parseExcelForDCR();
		if (dcrListUpload == null) {
			return "INPUT";
		}

		return "SUCCESS";
	}
    
 // Parsing Excel for DCR
    @SuppressWarnings("deprecation")
	private List<DcrActionPojo> parseExcelForDCR() {
    	List<DcrActionPojo> dcrListUpload = null;
		try {
			InputStream inStream = new FileInputStream(upload);

			HSSFWorkbook wb = new HSSFWorkbook(inStream);
			HSSFSheet sheet = wb.getSheetAt(0);
			//Assigning row in Excel
			
			short tourDateDB = 0;
			short time = 1;
			short descDoc = 2;
			short descChem = 3;
			short remarks = 4;
			
			// start from line 1, 0- contains the header
			int i = 1;


			dcrListUpload = new ArrayList<DcrActionPojo>();
			while (true) {
				HSSFRow row = sheet.getRow(i);
				if (row == null) {
					break;
				}
				
				HSSFCell temp = row.getCell(tourDateDB);
				
				System.out.println("temp --> "+temp);
				
				String tempTourDateDB = getStringCellValue(temp);
				String tempTime = getStringCellValue(row.getCell(time));
				String tempDescDoc = getStringCellValue(row.getCell(descDoc)).trim();
				String tempDescChem = getStringCellValue(row.getCell(descChem)).trim();
				String tempRemarks = getStringCellValue(row.getCell(remarks)).trim();
								
				//System.out.println("tempTourDateDB --> "+tempTourDateDB);
				
				try {
					DcrActionPojo dcrPOJO = new DcrActionPojo();
					
					DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
					dcrPOJO.setTourDateDB(formatter.parse(tempTourDateDB));
					dcrPOJO.setTime(Integer.parseInt(tempTime));
					
					System.out.println("tempDescDoc -->"+tempDescDoc);
					
					if(tempDescDoc.equals(null) || tempDescDoc.equals(""))
					{
						System.out.println("In if --> null");
					}
					else {
						dcrPOJO.setDescDoc(Integer.parseInt(tempDescDoc));
					}
					
					if(tempDescChem.equals(null) || tempDescChem.equals(""))
					{
						System.out.println("In if --> null");
					}
					else {
						dcrPOJO.setDescChem(Integer.parseInt(tempDescChem));
					}
					
					dcrPOJO.setRemarks(tempRemarks);
					dcrPOJO.setEmpId(this.empId);
					
					System.out.println("After setting pojo");
					
					Integer x = 1;	
					dcrPOJO.setExcelUpload(x);		//This is used to by-passing date parsing and photo parsing 
					
				
					System.out.println("Date in Excel --> "+tempTourDateDB);
					System.out.println("dcrPOJO date --> "+dcrPOJO.getTourDateDB());
					daoImpl.submitDCR(dcrPOJO);
					
					System.out.println("row --> "+row);
					
					
					dcrListUpload.add(dcrPOJO);
					i++;
					
				} catch (ParseException pe) {
					
					pe.printStackTrace();
					
					System.out.println("Exception while parsing --> "+pe);
				}
			}
		} catch (FileNotFoundException e) {
			//addActionError(e.getMessage());
			return null;
		} catch (IOException e) {
			//addActionError(e.getMessage());
			return null;
		}catch (Exception e) {
			
			e.printStackTrace();
			
			System.out.println("Exception caused while submitting dcr on ReadExcelFile class --> In parseExcelForDCR Method --> "+e);
		}
		return dcrListUpload;
	}//End of Import of DCR
    
    
    
    /*
     * Action for Product Import Starts from here
      */ 
    public String importProduct()throws Exception{
		
    	/* parse the excel file */
		List<AddProductActionPojo> productListUpload = parseExcelForProduct();
		if (productListUpload == null) {
			return "INPUT";
		}

		return "SUCCESS";
		
	}
    
    // Parsing Excel for Product
    @SuppressWarnings("deprecation")
	private List<AddProductActionPojo> parseExcelForProduct() {
    	List<AddProductActionPojo> productListUpload = null;
		try {
			InputStream inStream = new FileInputStream(upload);

			HSSFWorkbook wb = new HSSFWorkbook(inStream);
			HSSFSheet sheet = wb.getSheetAt(0);
			//Assigning row in Excel
			
			
			short product_id = 0;
			short product_name = 1;
			short ingrediants = 2;
			short dosage_form = 3;
			short indications = 4;
			// start from line 1, 0- contains the header
			int i = 1;


			productListUpload = new ArrayList<AddProductActionPojo>();
			while (true) {
				HSSFRow row = sheet.getRow(i);
				if (row == null) {
					break;
				}
				
				String tempProductId = getStringCellValue(row.getCell(product_id)).trim();
				String tempProductName = getStringCellValue(row.getCell(product_name)).trim();
				String tempIngrediants = getStringCellValue(row.getCell(ingrediants)).trim();
				String tempDosageForm = getStringCellValue(row.getCell(dosage_form)).trim();
				String tempIndications = getStringCellValue(row.getCell(indications)).trim();

				AddProductActionPojo productPOJO = new AddProductActionPojo();
				
				productPOJO.setProduct_id(tempProductId);
				productPOJO.setProduct_name(tempProductName);
				productPOJO.setIngrediants(tempIngrediants);
				productPOJO.setIndications(tempIndications);
				productPOJO.setDosage_form(tempDosageForm);
							

				Integer x = 1;
				productPOJO.setExcelUpload(x);		//This is used to by-passing date parsing and photo parsing 
				
				daoImpl.submitProduct(productPOJO, upload, tempIndications, tempIndications); // Here in the arguments only productPOJO is necessary but to match the parameters of same method in DaoImpl class it is written.
				
				System.out.println("row --> "+row);
				
				
				productListUpload.add(productPOJO);
				i++;
				
			}
		} catch (FileNotFoundException e) {
			//addActionError(e.getMessage());
			return null;
		} catch (IOException e) {
			//addActionError(e.getMessage());
			return null;
		}
		return productListUpload;
	}//End of Import of Product
    
    /*
     * Action for Chemist Import Starts from here
     */ 
    public String importChemist()throws Exception{
    	
    	/* parse the excel file */
    	List<AddChemistActionPojo> chemistListUpload = parseExcelForChemist();
    	if (chemistListUpload == null) {
    		return "INPUT";
    	}
    	
    	return "SUCCESS";
    }
    
    // Parsing Excel for Chemist
    @SuppressWarnings("deprecation")
    private List<AddChemistActionPojo> parseExcelForChemist() {
    	List<AddChemistActionPojo> chemistListUpload = null;
    	try {
    		InputStream inStream = new FileInputStream(upload);
    		
    		HSSFWorkbook wb = new HSSFWorkbook(inStream);
    		HSSFSheet sheet = wb.getSheetAt(0);
    		//Assigning row in Excel
    		
    		short chemist_name = 0;
    		short ter_id = 1;
    		short contact_no = 2;
    		short address_1 = 3;
    		short address_2 = 4;
    		short active = 5;
    		// start from line 1, 0- contains the header
    		int i = 1;
    		
    		
    		chemistListUpload = new ArrayList<AddChemistActionPojo>();
    		while (true) {
    			HSSFRow row = sheet.getRow(i);
    			if (row == null) {
    				break;
    			}
    			
    			String tempEmpNme = getStringCellValue(row.getCell(chemist_name)).trim();
    			String tempTerId = getStringCellValue(row.getCell(ter_id)).trim();
    			String tempContactNo = getStringCellValue(row.getCell(contact_no)).trim();
    			String tempAddress_1 = getStringCellValue(row.getCell(address_1)).trim();
    			String tempAddress_2 = getStringCellValue(row.getCell(address_2)).trim();
    			String tempActive = getStringCellValue(row.getCell(active)).trim();
    			
    			AddChemistActionPojo chemistPOJO = new AddChemistActionPojo();
    			chemistPOJO.setTer_id(tempTerId);
    			chemistPOJO.setChemist_name(tempEmpNme);
    			chemistPOJO.setContact_no(tempContactNo);
    			chemistPOJO.setAddress_1(tempAddress_1);
    			chemistPOJO.setAddress_2(tempAddress_2);
    			
    			if(tempActive.equals("true")){
    				chemistPOJO.setActive(true);
    			}
    			else{
    				chemistPOJO.setActive(false);
    			}
    			
    			daoImpl.submitChemist(chemistPOJO);
    			
    			System.out.println("row --> "+row);
    			
    			
    			chemistListUpload.add(chemistPOJO);
    			i++;
    		}
    	} catch (FileNotFoundException e) {
    		//addActionError(e.getMessage());
    		return null;
    	} catch (IOException e) {
    		//addActionError(e.getMessage());
    		return null;
    	}
    	return chemistListUpload;
    }//End of Import of Chemist
    
    
    
    /*
     * Action for MR Import Starts from here
     */ 
    public String importMR()throws Exception{
    	
    	/* parse the excel file */
    	List<AddMRActionPojo> MRListUpload = parseExcelForMR();
    	if (MRListUpload == null) {
    		return "INPUT";
    	}
    	
    	return "SUCCESS";
    }
    
    // Parsing Excel for MR
    @SuppressWarnings("deprecation")
    private List<AddMRActionPojo> parseExcelForMR() {
    	List<AddMRActionPojo> MRListUpload = null;
    	try {
    		InputStream inStream = new FileInputStream(upload);
    		
    		HSSFWorkbook wb = new HSSFWorkbook(inStream);
    		HSSFSheet sheet = wb.getSheetAt(0);
    		//Assigning row in Excel
    		short emp_name = 0;
    		short emp_id = 1;
    		short dsg_id = 2;
    		short ter_id = 3;
    		short contact_no = 4;
    		short address_1 = 5;
    		short address_2 = 6;
    		short active = 7;
    		// start from line 1, 0- contains the header
    		int i = 1;
    		
    		
    		MRListUpload = new ArrayList<AddMRActionPojo>();
    		while (true) {
    			HSSFRow row = sheet.getRow(i);
    			if (row == null) {
    				break;
    			}
    			
    			String tempEmpNme = getStringCellValue(row.getCell(emp_name)).trim();
    			String tempEmpId = getStringCellValue(row.getCell(emp_id)).trim();
    			String tempDsgId = getStringCellValue(row.getCell(dsg_id)).trim();
    			String tempTerId = getStringCellValue(row.getCell(ter_id)).trim();
    			String tempContactNo = getStringCellValue(row.getCell(contact_no)).trim();
    			String tempAddress_1 = getStringCellValue(row.getCell(address_1)).trim();
    			String tempAddress_2 = getStringCellValue(row.getCell(address_2)).trim();
    			String tempActive = getStringCellValue(row.getCell(active)).trim();
    			
    			AddMRActionPojo mrPOJO = new AddMRActionPojo();
    			mrPOJO.setTer_id(tempTerId);
    			mrPOJO.setDsg_id(tempDsgId);
    			mrPOJO.setEmp_name(tempEmpNme);
    			mrPOJO.setEmp_id(tempEmpId);
    			mrPOJO.setContact_no(tempContactNo);
    			mrPOJO.setAddress_1(tempAddress_1);
    			mrPOJO.setAddress_2(tempAddress_2);
    			
    			if(tempActive.equals("true")){
    				mrPOJO.setActive(true);
    			}
    			else{
    				mrPOJO.setActive(false);
    			}
    			
    			int x = 1;
    			mrPOJO.setExcelUpload(x); // Setting 1 if Excel is to be uploaded. If this is not done than in DAOIMPL class date parse exception will come.
    			daoImpl.submitMR(mrPOJO);
    			
    			System.out.println("row --> "+row);
    			
    			
    			MRListUpload.add(mrPOJO);
    			i++;
    		}
    	} catch (FileNotFoundException e) {
    		//addActionError(e.getMessage());
    		return null;
    	} catch (IOException e) {
    		//addActionError(e.getMessage());
    		return null;
    	}
    	return MRListUpload;
    }//End of Import of MR
    
    
    /*
     * Action for Doctor Import Starts from here
     */ 
    
    public String importDoctor()throws Exception{
		
    	/* parse the excel file */
		List<AddDoctorActionPojo> doctorListUpload = parseExcelForDoctor();
		if (doctorListUpload == null) {
			return "INPUT";
		}

		return "SUCCESS";
	}
    
    // Parsing Excel for Doctor
    @SuppressWarnings("deprecation")
	private List<AddDoctorActionPojo> parseExcelForDoctor() {
    	List<AddDoctorActionPojo> doctorListUpload = null;
		try {
			InputStream inStream = new FileInputStream(upload);

			HSSFWorkbook wb = new HSSFWorkbook(inStream);
			HSSFSheet sheet = wb.getSheetAt(0);
			
			//Assigning row in Excel
			short doctor_name = 0;
			short specialisation =1;
			short qualification = 2;
			short ter_id = 3;
			short cat_id = 4;
			short address_1 = 5;
			short address_2 = 6;
			short active = 7;
			// start from line 1, 0- contains the header
			int i = 1;


			doctorListUpload = new ArrayList<AddDoctorActionPojo>();
			while (true) {
				HSSFRow row = sheet.getRow(i);
				if (row == null) {
					break;
				}
				
				String tempDocNme = getStringCellValue(row.getCell(doctor_name)).trim();
				String tempSpecialisation = getStringCellValue(row.getCell(specialisation)).trim();
				String tempQualification = getStringCellValue(row.getCell(qualification)).trim();
				String tempTerId = getStringCellValue(row.getCell(ter_id)).trim();
				String tempCat_id = getStringCellValue(row.getCell(cat_id)).trim();
				String tempAddress_1 = getStringCellValue(row.getCell(address_1)).trim();
				String tempAddress_2 = getStringCellValue(row.getCell(address_2)).trim();
				String tempActive = getStringCellValue(row.getCell(active)).trim();


				// check for unique login
			//	if(userService.findByLogin(loginId) != null){
				//	failedMap.put(i, "Login already exists. Choose different login");
					//i++; continue;
				//}

				AddDoctorActionPojo docPOJO = new AddDoctorActionPojo();
				docPOJO.setTer_id(tempTerId);
				docPOJO.setDoctor_name(tempDocNme);
				docPOJO.setSpecialisation(tempSpecialisation);
				docPOJO.setQualification(tempQualification);
				docPOJO.setCat_id(tempCat_id);
				docPOJO.setAddress_1(tempAddress_1);
				docPOJO.setAddress_2(tempAddress_2);
							
				if(tempActive.equals("true")){
					docPOJO.setActive(true);
				}
				else{
					docPOJO.setActive(false);
				}

				
				//System.out.println("In ReadExcelFile Class --> ter_id --> "+tempTerId);
				//System.out.println("In ReadExcelFile Class --> ter_id --> "+docPOJO.getTer_id());
				
				daoImpl.submitDoctor(docPOJO);
				
				doctorListUpload.add(docPOJO);
				i++;
			}
		} catch (FileNotFoundException e) {
			//addActionError(e.getMessage());
			return null;
		} catch (IOException e) {
			//addActionError(e.getMessage());
			return null;
		}
		return doctorListUpload;
	}//End of Import of Doctor
    

	public String submitTerritoryExcel() {
		/* parse the excel file */
		List<AddTerritoryActionPojo> territoryListUpload = parseExcel();
		if (territoryListUpload == null) {
			return "INPUT";
		}

		return "SUCCESS";
	}

	@SuppressWarnings("deprecation")
	private List<AddTerritoryActionPojo> parseExcel() {
		List<AddTerritoryActionPojo> territoryListUpload = null;
		try {
			InputStream inStream = new FileInputStream(upload);

			HSSFWorkbook wb = new HSSFWorkbook(inStream);
			HSSFSheet sheet = wb.getSheetAt(0);
			short ter_id = 0;
			short territory = 1 ;
			// start from line 1, 0- contains the header
			int i = 1;


			territoryListUpload = new ArrayList<AddTerritoryActionPojo>();
			while (true) {
				HSSFRow row = sheet.getRow(i);
				if (row == null) {
					break;
				}

				String tempTerId = getStringCellValue(row.getCell(ter_id)).trim();
				String tempTerritory = getStringCellValue(row.getCell(territory)).trim();


				// check for unique login
			//	if(userService.findByLogin(loginId) != null){
				//	failedMap.put(i, "Login already exists. Choose different login");
					//i++; continue;
				//}

				AddTerritoryActionPojo terPOJO = new AddTerritoryActionPojo();
				terPOJO.setTer_id(tempTerId);
				terPOJO.setTerritory(tempTerritory);

				
				daoImpl.submitTerritory(terPOJO);
				
				territoryListUpload.add(terPOJO);
				i++;
			}
		} catch (FileNotFoundException e) {
			//addActionError(e.getMessage());
			return null;
		} catch (IOException e) {
			//addActionError(e.getMessage());
			return null;
		}
		return territoryListUpload;
	}



	private String getStringCellValue(HSSFCell cell) {
		String value = "";
		if (cell == null) {
			return value;
		}
		

		
		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_NUMERIC:
			//value = new Double(cell.getNumericCellValue()).toString();
			if (DateUtil.isCellDateFormatted(cell))
			{
			    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			    value = sdf.format(cell.getDateCellValue()).toString();
			    System.out.println("Value --> "+value);

			    //return value;
			}else
				value = new Integer((int) cell.getNumericCellValue()).toString();
			break;
		case HSSFCell.CELL_TYPE_STRING:
			value = cell.getStringCellValue();
			break;
		case HSSFCell.CELL_TYPE_BLANK:
			value = "";
			break;
		case HSSFCell.CELL_TYPE_BOOLEAN:
			if (cell.getBooleanCellValue()) {
				value = "true";
			} else {
				value = "false";
			}
			break;
		case HSSFCell.CELL_TYPE_ERROR:
			value = "";
			break;
		case HSSFCell.CELL_TYPE_FORMULA:
			value = "";
			break;
		default:
			break;
		}

		return value;
	}

    public File getUpload() {
	    return upload;
    }

    public void setUpload(File upload) {
		this.upload = upload;
	}


	public String getEmpId() {
		return empId;
	}


	public void setEmpId(String empId) {
		this.empId = empId;
	}

}
