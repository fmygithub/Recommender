package com.paper.entity;

public class CitPaper {
	public int id;
	public int pid;
	public int rid;
	public String rtitle;
	public String rauthor;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRauthor() {
		return rauthor;
	}
	public void setRauthor(String rauthor) {
		this.rauthor = rauthor;
	}
	@Override
	public String toString() {
		return "citpaper [id=" + id + ", pid=" + pid + ", rid=" + rid
				+ ", rtitle=" + rtitle + ", rauthor=" + rauthor + "]";
	}
	
}
