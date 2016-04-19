package com.paper.dao;

import com.paper.entity.AuthortoTitle;

import java.util.List;

public interface AuthortoTitleDAO {
	List<AuthortoTitle> listOfAll();
	List<AuthortoTitle> findByNid(String nid);
	List<AuthortoTitle> findByPid(int pid);

}
