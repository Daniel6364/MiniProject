package com.model2.mvc.common;

import java.util.ArrayList;

public class Search {
	
	///Field
	private int curruntPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	private String searchPrice;
	
	// Add Field for mybatis practice
	private String[] userName;
	private ArrayList<String> userId;
	
	///Constructor
	public Search() {
	}
	
	///Method
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public int getCurrentPage() {
		return curruntPage;
	}
	public void setCurrentPage(int curruntPage) {
		this.curruntPage = curruntPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	@Override
	public String toString() {
		return "Search [curruntPage=" + curruntPage + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword
				+ ", pageSize=" + pageSize + ", searchPrice=" + searchPrice + "]";
	}

	// add for price search
	public String getSearchPrice() {
		return searchPrice;
	}

	public void setSearchPrice(String searchPrice) {
		this.searchPrice = searchPrice;
	}

	// add for mybatis practice
	public String[] getUserName() {
		return userName;
	}

	public void setUserName(String[] userName) {
		this.userName = userName;
	}

	public ArrayList<String> getUserId() {
		return userId;
	}

	public void setUserId(ArrayList<String> userId) {
		this.userId = userId;
	}
	
	
	
	
	
	
	
	
}