package com.paper.dao;

import com.paper.entity.CitPaperSout;
import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by fengmengyang on 2016/3/28.
 * desc:
 */
public class TestCoauthorDAO {
    private ApplicationContext context;
    private CoauthorDAO dao;

    @Before
    public void setUp() {
        context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-mybatis.xml");
        dao = context.getBean("coauthorDAO", CoauthorDAO.class);
    }

}
