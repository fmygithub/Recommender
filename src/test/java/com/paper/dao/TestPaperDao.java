package com.paper.dao;

import com.paper.entity.Paper;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by fengmengyang on 2016/3/27.
 * desc:
 */
public class TestPaperDao {
    ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-mybatis.xml");
    @Test
    public void testPaperList() {
        PaperDAO paperDAO = context.getBean("paperDAO", PaperDAO.class);
        List<Paper> paperList = paperDAO.listPaper(1);
        System.out.println(paperList != null);
    }
}
