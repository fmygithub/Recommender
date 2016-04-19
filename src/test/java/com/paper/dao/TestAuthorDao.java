package com.paper.dao;

import com.paper.entity.Author;
import com.paper.entity.AuthortoTitle;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by fengmengyang on 2016/3/28.
 * desc:
 */
public class TestAuthorDao {
    ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-mybatis.xml");
    @Test
    public void testPaperList() {
       AuthorDAO dao = context.getBean("authorDAO", AuthorDAO.class);
        Map<String, Object> map = new HashMap<>();
        map.put("startIndex", (Integer.parseInt("1")-1) * 10);
        map.put("size", 10);
        map.put("firstLettle", "G%");
        List<Author> authors = dao.findAuthorsByFirstLetter(map);
        System.out.println(authors.size());
    }
}
