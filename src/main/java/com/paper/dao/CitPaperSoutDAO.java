package com.paper.dao;

import com.paper.entity.CitPaperSout;

import java.util.List;
import java.util.Map;

public interface CitPaperSoutDAO {
	List<CitPaperSout> listCitPaperSout();
	int findCitCountByPid(int pid);
	List<CitPaperSout> findCitByPidPage(Map map);
	List<CitPaperSout> findCitByCid(int cid);
	CitPaperSout findCitByTitle(String title);

}
