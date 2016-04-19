package com.paper.entity;

public class Counit {
	public int id;
	public String unit;
	public double uweight;
	public String cunit;
	public double cweight;
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
	public double getUweight() {
		return uweight;
	}
	public void setUweight(double uweight) {
		this.uweight = uweight;
	}
	public String getCunit() {
		return cunit;
	}
	public void setCunit(String cunit) {
		this.cunit = cunit;
	}
	public double getCweight() {
		return cweight;
	}
	public void setCweight(double cweight) {
		this.cweight = cweight;
	}
	@Override
	public String toString() {
		return "Counit [id=" + id + ", unit=" + unit + ", uweight=" + uweight
				+ ", cunit=" + cunit + ", cweight=" + cweight + "]";
	}
	

}
