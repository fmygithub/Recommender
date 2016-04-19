package com.paper.dao;

import com.paper.entity.Author;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public interface AuthorDAO {
	Author findByNid(String nid);
    Author findByName(String name);
    Author findByOtherName(String othername);
    List<Author> findAuthorByWeight(Double weight);
    List<Author> findByCommunity(int community);
	List<Author> findByFuzzyName(String name);
    Author findById(int id);

    //分页获取author
    List<Author> listAuthor(int recordIndex);
    int findAuthorsCount();


    //根据首字母分页显示author
    List<Author> findAuthorsByFirstLetter(Map map);
    int findAuthorsCountByFirstLetter(Map map);
}
