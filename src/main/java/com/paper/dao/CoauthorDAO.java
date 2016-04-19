package com.paper.dao;

import com.paper.entity.Coauthor;

import java.util.List;

public interface CoauthorDAO {
	List<Coauthor> listCoauthor();
	List<Coauthor> findCoByNid(String nid);
	List<Coauthor> findCoByWeight(double nweight, double cweight);
}
