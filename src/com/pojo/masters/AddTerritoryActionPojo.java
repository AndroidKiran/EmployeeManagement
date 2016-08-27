package com.pojo.masters;

import java.io.Serializable;

public class AddTerritoryActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String ter_id;
	private String territory;
	private Integer seq_no;
	private String ErrorMsg;
	
	
	public Integer getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
	public String getTer_id() {
		return ter_id;
	}
	public void setTer_id(String ter_id) {
		this.ter_id = ter_id;
	}
	public String getTerritory() {
		return territory;
	}
	public void setTerritory(String territory) {
		this.territory = territory;
	}
	public String getErrorMsg() {
		return ErrorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		ErrorMsg = errorMsg;
	}
	
	
}
