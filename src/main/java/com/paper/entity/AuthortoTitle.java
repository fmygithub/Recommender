package com.paper.entity;

public class AuthortoTitle {
	public int id;
	public String nid;
	public int pid;
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
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	@Override
	public String toString() {
		return "AuthortoTitle [id=" + id + ", nid=" + nid + ", pid=" + pid
				+ "]";
	}
	

}
