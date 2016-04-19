package com.paper.dao;

import com.paper.entity.Paper;

import java.util.List;

public interface PaperDAO {
	List<Paper> listPaper(int recordIndex);
	Paper findPaperByPid(int pid);
	Paper findPaperByTitle(String title);
	int getPaperCount();

	List<Paper> findPaperByFuzzyTitle(String title);
}
