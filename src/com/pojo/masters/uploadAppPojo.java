package com.pojo.masters;

import java.io.Serializable;

public class uploadAppPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String nme[];
	private String lstNme[];
	private Integer seq_no;
	public String[] getNme() {
		return nme;
	}
	public void setNme(String[] nme) {
		this.nme = nme;
	}
	public String[] getLstNme() {
		return lstNme;
	}
	public void setLstNme(String[] lstNme) {
		this.lstNme = lstNme;
	}
	public Integer getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
