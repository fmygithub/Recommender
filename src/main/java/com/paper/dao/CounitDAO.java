package com.paper.dao;

import com.paper.entity.Counit;

import java.util.List;

public interface CounitDAO {
	List<Counit> listAll();
	List<Counit> findByUnit(String unit);
	List<Counit> findByWeight(double uweight, double cweight);

}
