package com.paper.dao;

import com.paper.entity.CitPaperSout;
import com.paper.entity.Papersim;
import org.junit.Before;
import org.junit.Test;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Created by fengmengyang on 2016/3/28.
 * desc:
 */
public class TestCitPaperSoutDao {
    private ApplicationContext context;
    private CitPaperSoutDAO dao;

    @Before
    public void setUp() {
        context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-mybatis.xml");
        dao = context.getBean("citPaperSoutDAO", CitPaperSoutDAO.class);
    }

    @Test
    public void testCount() {
        int count = dao.findCitCountByPid(5332628);
        System.out.println(count);
    }

    @Test
    public void testPage() {
        Map<String, Object> map = new HashMap<>();
        map.put("pid", 5332628);
        map.put("startIndex", 0);
        map.put("size", 5);
        List<CitPaperSout> citPaperSouts = dao.findCitByPidPage(map);
        System.out.println(citPaperSouts.get(0).toString());
    }
}
