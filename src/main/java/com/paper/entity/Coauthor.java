package com.paper.entity;

public class Coauthor {
	public int id;
	public String nid;
	public String cid;
	public double nweight;
	public double cweight;
	public double getNweight() {
		return nweight;
	}
	public void setNweight(double nweight) {
		this.nweight = nweight;
	}
	public double getCweight() {
		return cweight;
	}
	public void setCweight(double cweight) {
		this.cweight = cweight;
	}
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
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	@Override
	public String toString() {
		return "Coauthor [id=" + id + ", nid=" + nid + ", cid=" + cid
				+ ", nweight=" + nweight + ", cweight=" + cweight + "]";
	}
	
	
	
}
