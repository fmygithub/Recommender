package com.paper.entity;

public class Papersim {
	public int id;
	public int pid;
	public int tid;
	public double sim;
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
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public double getSim() {
		return sim;
	}
	public void setSim(double sim) {
		this.sim = sim;
	}
	@Override
	public String toString() {
		return "Papersim [id=" + id + ", pid=" + pid + ", tid=" + tid
				+ ", sim=" + sim + "]";
	}
	

	
	
	

}
