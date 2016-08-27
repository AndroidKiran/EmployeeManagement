package com.pojo.masters;

import java.io.Serializable;

public class AddCategoryActionPojo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String cat_id;
	private String cat_name;
	private Integer seq_no;
	
	
	
	public Integer getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
	public String getCat_id() {
		return cat_id;
	}
	public void setCat_id(String cat_id) {
		this.cat_id = cat_id;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	
}
