package com.paper.entity;

public class Author {
	public int id;
	public String nid;
	public String name;
	public String othername;
	public String unit;
	public String fields;
	public int h_index;
	public int g_index;
	public double weight;
	public int community;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNid() {
		return nid;
	}
	public void setNid(String nid) {
		this.nid = nid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOthername() {
		return othername;
	}
	public void setOthername(String othername) {
		this.othername = othername;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getFields() {
		return fields;
	}
	public void setFields(String fields) {
		this.fields = fields;
	}
	public int getH_index() {
		return h_index;
	}
	public void setH_index(int h_index) {
		this.h_index = h_index;
	}
	public int getG_index() {
		return g_index;
	}
	public void setG_index(int g_index) {
		this.g_index = g_index;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	
	
	public int getCommunity() {
		return community;
	}
	public void setCommunity(int community) {
		this.community = community;
	}
	
	
	@Override
	public String toString() {
		return "Author [id=" + id + ", nid=" + nid + ", name=" + name
				+ ", othername=" + othername + ", unit=" + unit + ", fields="
				+ fields + ", h_index=" + h_index + ", g_index=" + g_index
				+ ", weight=" + weight + ", community=" + community + "]";
	}
	
	
	
}
