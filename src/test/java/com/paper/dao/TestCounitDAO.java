package com.paper.dao;

import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by fengmengyang on 2016/3/28.
 * desc:
 */
public class TestCounitDAO {
    private ApplicationContext context;
    private CounitDAO dao;

    @Before
    public void setUp() {
        context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-mybatis.xml");
        dao = context.getBean("counitDAO", CounitDAO.class);
    }

}
