package com.paper.entity;

import java.util.List;

public class Group {
	public List<Links> link;
	public List<Nodes> node;

	public List<Links> getLink() {
		return link;
	}

	public void setLink(List<Links> link) {
		this.link = link;
	}

	public List<Nodes> getNode() {
		return node;
	}

	public void setNode(List<Nodes> node) {
		this.node = node;
	}

}
