package com.paper.dao;

import com.paper.entity.Numberofac;

import java.util.List;

public interface NumberofacDAO {
	List<Numberofac> listAll();
	List<Numberofac> findByNumber(int number);
	Numberofac findByComid(int comid);
	

}
