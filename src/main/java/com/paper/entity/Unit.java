package com.paper.entity;

public class Unit {
	public int id;
	public String unit;
	public double uweight;
	public int community;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public double getUWeight() {
		return uweight;
	}
	public void setUWeight(double uweight) {
		this.uweight = uweight;
	}
	public int getCommunity() {
		return community;
	}
	public void setCommunity(int community) {
		this.community = community;
	}
	@Override
	public String toString() {
		return "Unit [id=" + id + ", unit=" + unit + ", uweight=" + uweight
				+ ", community=" + community + "]";
	}
	

}
