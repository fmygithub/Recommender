package com.paper.dao;

import com.paper.entity.Relation;

import java.util.List;

public interface RelationDAO {
	List<Relation> listRelation();
	List<Relation> listRelationByPid(int pid);

}
