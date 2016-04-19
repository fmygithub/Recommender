package com.paper.dao;

import com.paper.entity.AuthortoTitle;
import com.paper.entity.Paper;
import javafx.application.Application;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by fengmengyang on 2016/3/28.
 * desc:
 */
public class TestAuthorToTitleDao {
    ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-mybatis.xml");
    @Test
    public void testPaperList() {
       AuthortoTitleDAO dao = context.getBean("authortoTitleDAO", AuthortoTitleDAO.class);
        List<AuthortoTitle> authortoTitles = dao.findByPid(5332628);
        System.out.println(authortoTitles.get(0).toString());
    }
}
