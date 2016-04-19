package com.paper.entity;

public class Numberofac {
	public int id;
	public int comid;
	public int number;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getComid() {
		return comid;
	}
	public void setComid(int comid) {
		this.comid = comid;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	@Override
	public String toString() {
		return "Numberofac [id=" + id + ", comid=" + comid + ", number="
				+ number + "]";
	}
	

}
