package com.paper.entity;

public class Relation {
	public int id;
	public int pid;
	public int rid;
	public String rtitle;
	public int ryear;
	public int cid;
	public String ctitle;
	public int cyear;
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
	public int getRyear() {
		return ryear;
	}
	public void setRyear(int ryear) {
		this.ryear = ryear;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	public int getCyear() {
		return cyear;
	}
	public void setCyear(int cyear) {
		this.cyear = cyear;
	}
	@Override
	public String toString() {
		return "Relation [id=" + id + ", pid=" + pid + ", rid=" + rid
				+ ", rtitle=" + rtitle + ", ryear=" + ryear + ", cid=" + cid
				+ ", ctitle=" + ctitle + ", cyear=" + cyear + "]";
	}
	
	
}
