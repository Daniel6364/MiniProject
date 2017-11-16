package com.model2.mvc.common;

import java.util.ArrayList;

public class Search {
	
	///Field
	private int curruntPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	private String searchPrice;
	
	// for the ProductMapper10
	private String[] prodName;
	private ArrayList<String> prodNo;
	
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

	public String getSearchPrice() {
		return searchPrice;
	}

	public void setSearchPrice(String searchPrice) {
		this.searchPrice = searchPrice;
	}

	// for the ProductMapper10
	public String[] getProdName() {
		return prodName;
	}

	public void setProdName(String[] prodName) {
		this.prodName = prodName;
	}

	public ArrayList<String> getProdNo() {
		return prodNo;
	}

	public void setProdNo(ArrayList<String> prodNo) {
		this.prodNo = prodNo;
	}


	
	
	
}