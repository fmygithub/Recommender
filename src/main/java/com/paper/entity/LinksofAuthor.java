package com.paper.entity;

public class LinksofAuthor {
	public int source;
	public int target;
	public int value;
	public int getSource() {
		return source;
	}
	public void setSource(int source) {
		this.source = source;
	}
	public int getTarget() {
		return target;
	}
	public void setTarget(int i) {
		this.target = i;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "{\"source\":" + source  + ", \"target\":" 
	+ target + ", \"value\":"  + value  + "}";
	}
	

}
