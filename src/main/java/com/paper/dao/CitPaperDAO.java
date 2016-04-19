package com.paper.dao;

import com.paper.entity.CitPaper;

import java.util.List;

public interface CitPaperDAO {
	List<CitPaper> listCitPaper();
	List<CitPaper> findCitByPid(int pid);
	List<CitPaper> findCitByRid(int rid);
	CitPaper findCitByTitle(String rtitle);

}
