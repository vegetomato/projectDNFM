package com.jafa.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {

	private int page;
	private int perPageNum;
	
	private String type; 
	private String keyword;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public int getPageStart() {
		return (this.page-1)*perPageNum;
	}
	
	public String[] getTypeCollection() {
		return type != null ? type.split("") : new String[] {};
	}
}
