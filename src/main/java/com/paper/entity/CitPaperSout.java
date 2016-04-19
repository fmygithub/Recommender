package com.paper.entity;

public class CitPaperSout {
	public int id;
	public int pid;
	public int cid;
	public String title;
	public String author;
	public String publish;
	public int year;
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
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublish() {
		return publish;
	}
	public void setPublish(String publish) {
		this.publish = publish;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	@Override
	public String toString() {
		return "CitPaperSout [id=" + id + ", pid=" + pid + ", cid=" + cid
				+ ", title=" + title + ", author=" + author + ", publish="
				+ publish + ", year=" + year + "]";
	}
	
	
	
}
