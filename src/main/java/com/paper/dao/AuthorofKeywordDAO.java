package com.paper.dao;

import com.paper.entity.AuthorofKeyword;

import java.util.List;

public interface AuthorofKeywordDAO {
	List<AuthorofKeyword> findByAll();
	AuthorofKeyword findByNid(String nid);
}
