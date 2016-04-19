package com.paper.entity;

import javax.xml.soap.Node;

public class Nodes {
	public double count;
	public String group;
	public String name;
	public Nodes() {}
	public Nodes(String name, String group, double count) {
		this.count = count;
		this.name = name;
		this.group = group;
	}
	public double getCount() {
		return count;
	}
	public void setCount(double count) {
		this.count = count;
	}
	
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "{\"count\":" + count + ", \"group\":" + "\"" + group 
				+ "\"" + ", \"name\":" + "\"" + name + "\""
				+ "}";
	}
	
}
