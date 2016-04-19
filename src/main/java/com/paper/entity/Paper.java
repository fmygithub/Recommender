package com.paper.entity;

public class Paper {
	public int id;
	public int pid;
	public String title;
	public String author;
	public String publish;
	public String summary;//ע�����ݿ��е���abstract��ע��ע��
	public int year;
	public double weight;
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
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

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    @Override
	public String toString() {
		return "Paper [id=" + id + ", pid=" + pid + ", title=" + title
				+ ", author=" + author + ", publish=" + publish
				+ ", summary=" + summary + ", year=" + year + ", weight="
				+ weight + "]";
	}
	
	
	
	
	

}
