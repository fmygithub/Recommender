package com.paper.entity;

public class NodesofAuthor {
	public double count;
	public String group;
	public String name;
	public String image;
	public String id;
    public NodesofAuthor() {}
	public NodesofAuthor(double count, String group, String name, String image) {
		this.count = count;
		this.group = group;
		this.name = name;
		this.image = image;
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
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "{\"id\":" + "\""+ id +"\"" + ", \"name\":" + "\"" + name + "\"" + ", \"group\":"
	+ group + ", \"image\":" + "\"" + image + "\"" + ", \"count\":" + count + "}";
		
	}
	
	
	
}
