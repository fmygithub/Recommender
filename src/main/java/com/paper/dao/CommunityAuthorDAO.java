package com.paper.dao;

import com.paper.entity.CommunityAuthor;

import java.util.List;

public interface CommunityAuthorDAO {
	List<CommunityAuthor> findByCommunity(int community);

}
