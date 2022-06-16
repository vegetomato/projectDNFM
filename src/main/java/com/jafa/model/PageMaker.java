package com.jafa.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageMaker {
	
	private Criteria criteria;
	private int startPage;
	private int endPage;
	private int tempEndPage;
	private int totalCount;
	
	private int displayPageNum = 10;
	
	private boolean next;
	private boolean prev;

	public PageMaker(Criteria criteria, int totalCount) {
		this.criteria = criteria;
		this.totalCount = totalCount;
		endPage = (int) Math.ceil(criteria.getPage()/(double)displayPageNum)*displayPageNum;
		startPage = endPage - displayPageNum + 1;
		
		tempEndPage = (int) Math.ceil(totalCount/(double)criteria.getPerPageNum());
		if(endPage>tempEndPage) endPage=tempEndPage;
		
		prev = startPage == 1 ? false : true;
		next = endPage >= tempEndPage ? false : true;
	}
	
}
