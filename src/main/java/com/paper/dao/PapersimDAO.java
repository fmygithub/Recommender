package com.paper.dao;

import com.paper.entity.Papersim;

import java.util.List;

public interface PapersimDAO {
	List<Papersim> listAll();
	List<Papersim> finByNid(int nid);
	

}
