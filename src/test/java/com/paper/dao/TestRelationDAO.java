package com.paper.dao;

import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by fengmengyang on 2016/3/28.
 * desc:
 */
public class TestRelationDAO {
    private ApplicationContext context;
    private RelationDAO dao;

    @Before
    public void setUp() {
        context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-mybatis.xml");
        dao = context.getBean("relationDAO", RelationDAO.class);
    }

}
