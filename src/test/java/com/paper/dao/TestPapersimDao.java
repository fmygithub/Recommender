package com.paper.dao;

import com.paper.entity.AuthortoTitle;
import com.paper.entity.Papersim;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by fengmengyang on 2016/3/28.
 * desc:
 */
public class TestPapersimDao {
    ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-mybatis.xml");
    @Test
    public void test() {
       PapersimDAO dao = context.getBean("papersimDAO", PapersimDAO.class);
        List<Papersim> papersims = dao.finByNid(5332628);
        System.out.println(papersims.get(0).toString());
    }
}
