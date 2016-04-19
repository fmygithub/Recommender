package com.paper.entity;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import net.sf.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class Main {

	public static String getJson() {

		Group group = new Group();

		List<Links> linkList = new ArrayList<Links>();
		List<Nodes> nodeList = new ArrayList<Nodes>();

		Links link1 = new Links();
		link1.setSource(0);
		link1.setTarget(1);
		link1.setValue(2);
		linkList.add(link1);

		Links link2 = new Links();
		link2.setSource(0);
		link2.setTarget(2);
		link2.setValue(2);
		linkList.add(link2);

		Nodes node1 = new Nodes();
		node1.setCount(20);
		node1.setGroup("2");
		node1.setName("title");
		nodeList.add(node1);

		Nodes node2 = new Nodes();
		node2.setCount(15);
		node2.setGroup("2");
		node2.setName("title1");
		nodeList.add(node2);

		Nodes node3 = new Nodes();
		node3.setCount(15);
		node3.setGroup("2");
		node3.setName("title2");
		nodeList.add(node3);

		group.setLink(linkList);
		group.setNode(nodeList);
		JSONObject json = JSONObject.fromObject(group);
//		return json.toString();
		return prettyFormat(json);
	}


	public static String prettyFormat(Object object) {
		Gson gson = new GsonBuilder().setPrettyPrinting().disableHtmlEscaping()
				.create();
		JsonParser jp = new JsonParser();
		JsonElement je = jp.parse(gson.toJson(object));
		String prettyJsonString = gson.toJson(je);
		String[] lines = prettyJsonString.split("\n");
		StringBuilder stringBuilder = new StringBuilder();
		for (String line : lines) {
			stringBuilder.append(line + "\n");
		}
		return stringBuilder.toString();
	}


	public static void main(String[] args) {
		 System.out.println(getJson());


	}
}
