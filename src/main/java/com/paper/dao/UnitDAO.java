package com.paper.dao;

import com.paper.entity.Unit;

import java.util.List;

public interface UnitDAO {
	List<Unit> listAllUnit(int recordIndex);
	Unit findById(int id);
	Unit findByUnit(String unit);
	List<Unit> findByWeight(double weight);

}
