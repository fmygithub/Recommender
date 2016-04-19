package com.paper.dao;

import com.paper.entity.AuthorofKeyword;
import com.paper.entity.Paper;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by fengmengyang on 2016/3/27.
 * desc:
 */
public class TestAuthorKeyWordDao {
    ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-mybatis.xml");
    @Test
    public void testPaperList() {
        AuthorofKeywordDAO dao = context.getBean("authorofKeywordDAO", AuthorofKeywordDAO.class);
        AuthorofKeyword authorofKeyword = dao.findByNid("");
        System.out.println(authorofKeyword.toString());
    }
}
