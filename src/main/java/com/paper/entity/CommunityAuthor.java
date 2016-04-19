package com.paper.entity;

public class CommunityAuthor {
	public int id;
	public int community;
	public int year;
	public String keyword1;
	public String keyword2;
	public String keyword3;
	public String keyword4;
	public String keyword5;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCommunity() {
		return community;
	}
	public void setCommunity(int community) {
		this.community = community;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public String getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}
	public String getKeyword3() {
		return keyword3;
	}
	public void setKeyword3(String keyword3) {
		this.keyword3 = keyword3;
	}
	public String getKeyword4() {
		return keyword4;
	}
	public void setKeyword4(String keyword4) {
		this.keyword4 = keyword4;
	}
	public String getKeyword5() {
		return keyword5;
	}
	public void setKeyword5(String keyword5) {
		this.keyword5 = keyword5;
	}
	@Override
	public String toString() {
		return "CommunityAuthor [id=" + id + ", community=" + community
				+ ", year=" + year + ", keyword1=" + keyword1 + ", keyword2="
				+ keyword2 + ", keyword3=" + keyword3 + ", keyword4="
				+ keyword4 + ", keyword5=" + keyword5 + "]";
	}
	

}
