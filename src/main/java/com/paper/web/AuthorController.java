package com.paper.web;

import com.paper.dao.*;
import com.paper.entity.*;
import com.paper.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by fengmengyang on 2016/3/30.
 * desc:
 */
@Controller
@RequestMapping("/author")
public class AuthorController {
    @Autowired
    private AuthorDAO authorDAO;
    @Autowired
    private AuthorofKeywordDAO authorofKeywordDAO;
    @Autowired
    private CoauthorDAO coauthorDAO;

    @Autowired
    private AuthorService authorService;

    @Autowired
    private AttentionDao attentionDao;

    @RequestMapping("/searchAuthorCit")
    public ModelAndView searchAuthor(@RequestParam("name") String name, HttpServletRequest request) {
        User user = (User)request.getSession().getAttribute("user");
        ModelAndView modelAndView = new ModelAndView("Author/author1");

        List<Paper> paperList = new ArrayList<>();
        AuthorofKeyword ak = new AuthorofKeyword();
        List<Coauthor> coauthorlist = new ArrayList<>();
        Attention attention = null;
        String graph = "";

        int pageCount = 0;
        int pageNow = 1;

        Author author = authorDAO.findByName(name);
        if (author == null) {
            author = authorDAO.findByOtherName(name);
        }
        if (author != null) {
            Map<String, Object> map = authorService.getPaperByAuthor(author, pageNow);
            if (map != null) {
                pageCount = (Integer) map.get("pageCount");
                paperList = (List<Paper>) map.get("paperList");
            }
            ak = authorofKeywordDAO.findByNid(author.getNid());

            coauthorlist = coauthorDAO.findCoByNid(author.getNid());//得到同引作者的信息
            //存放node和link信息
            List<NodesofAuthor> nodeList = new ArrayList<>();
            List<LinksofAuthor> linkList = new ArrayList<>();
            if (coauthorlist != null && coauthorlist.size() > 0) {

                for (int i = 0; i < coauthorlist.size(); i++) {
                    Author a = authorDAO.findByNid(coauthorlist.get(i).getCid());  //TODO 有坑

                    //准备node信息
                    NodesofAuthor node = new NodesofAuthor();
                    if (i == 0) {//设置显示节点的大小，先这样写以后在调整
                        node.setGroup("1");
                    } else {
                        node.setGroup("2");
                    }
                    node.setCount(a.getWeight());
                    node.setName(a.getName());
                    node.setId(a.getNid());
                    node.setImage("..\\/..\\/..\\/resources\\/images\\/no.jpg");
                    nodeList.add(node);


                    //准备link信息
                    LinksofAuthor link = new LinksofAuthor();
                    link.setSource(0);
                    link.setTarget(i);
                    link.setValue(2);
                    linkList.add(link);
                }
                String strNode = "\"nodes\":" + nodeList;
                String strLink = "\"links\":" + linkList;

                graph = "{" + strNode + "," + strLink + "}";
            } else {//只有一个节点
                NodesofAuthor node = new NodesofAuthor();
                node.setCount(author.getWeight());//将String类型强制装换成double
                node.setGroup("1");
                node.setName(author.getName());
                node.setId(author.getNid());
                node.setImage("..\\/upload\\/no.jpg");
                nodeList.add(node);
                String strNode = "\"nodes\":" + nodeList;
                graph = "{" + "\"links\":[]" + "," + strNode + "}";
            }


            //查询该作者是否被用户收藏
            if (user != null) {
                Map<String, Object> attParam = new HashMap<>();
                attParam.put("userId", user.getId());
                attParam.put("aid", author.getId());
                attention = attentionDao.getAttention(attParam);
            }
        }


        modelAndView.addObject("paperList", paperList);
        modelAndView.addObject("pageCount", pageCount);
        modelAndView.addObject("pageNow", pageNow);
        modelAndView.addObject("ak", ak);
        modelAndView.addObject("author", author);
        modelAndView.addObject("graph", graph);

        if (attention != null){
            modelAndView.addObject("isAttention", true);
        } else {
            modelAndView.addObject("isAttention", false);
        }

        return modelAndView;
    }

    @RequestMapping("/allAuthors")
    public ModelAndView getAllAuthor(
            @RequestParam(value = "pageNow", defaultValue = "1") String pageNow,
            @RequestParam(value = "firstLetter", defaultValue = "all") String firstLetter) {

        int size = 10;
        //存放AuthorList
        List<Author> authorList = null;
        //存放总记录数
        int  recordCount = 0;

        //默认不按首字母搜索
        if ("all".equals(firstLetter)) {
            authorList = authorDAO.listAuthor((Integer.parseInt(pageNow)-1) * size);
            recordCount = authorDAO.findAuthorsCount();
        } else {
            Map<String, Object> map = new HashMap<>();
            map.put("startIndex", (Integer.parseInt(pageNow)-1) * size);
            map.put("size", size);
            map.put("firstLettle", firstLetter + "%");
            authorList = authorDAO.findAuthorsByFirstLetter(map);
            recordCount = authorDAO.findAuthorsCountByFirstLetter(map);
        }

        ModelAndView modelAndView = new ModelAndView("/Author/authorList");
        modelAndView.addObject("authorList", authorList);
        modelAndView.addObject("pageNow", pageNow);
        if (recordCount%size == 0) {
            modelAndView.addObject("pageCount", recordCount/size);
        } else {
            modelAndView.addObject("pageCount", recordCount/size + 1);
        }

        //存放首字母
        List<String> allFirstLetter = new LinkedList<>();
        allFirstLetter.add("all");
        char str = 'A';
        for (int i = 0; i< 26; i++) {
            allFirstLetter.add(str + "");
            str = (char)((int)str + 1);
        }
        modelAndView.addObject("allFirstLetter", allFirstLetter);
        modelAndView.addObject("curFirstLetter", firstLetter);

        return modelAndView;
    }

    @RequestMapping("/fuzzySearchAuthor")
    public ModelAndView fuzzySearchAuthor(
            @RequestParam(value = "pageNow", defaultValue = "1") String pageNow,
            @RequestParam(value = "fuzzyName", defaultValue = "") String fuzzyName) {

        int size = 10;
        //存放AuthorList
        List<Author> authorList = null;
        //存放总记录数
        int  recordCount = 0;

        //默认不按首字母搜索
        if ("".equals(fuzzyName)) {
            authorList = authorDAO.listAuthor((Integer.parseInt(pageNow)-1) * size);
            recordCount = authorDAO.findAuthorsCount();
        } else {
            Map<String, Object> map = new HashMap<>();
            map.put("startIndex", (Integer.parseInt(pageNow)-1) * size);
            map.put("size", size);
            map.put("firstLettle", "%" + fuzzyName + "%");
            authorList = authorDAO.findAuthorsByFirstLetter(map);
            recordCount = authorDAO.findAuthorsCountByFirstLetter(map);
        }

        ModelAndView modelAndView = new ModelAndView("/Author/authorList");
        modelAndView.addObject("authorList", authorList);
        modelAndView.addObject("pageNow", pageNow);
        if (recordCount%size == 0) {
            modelAndView.addObject("pageCount", recordCount/size);
        } else {
            modelAndView.addObject("pageCount", recordCount/size + 1);
        }

        //存放首字母
//        List<String> allFirstLetter = new LinkedList<>();
//        allFirstLetter.add("all");
//        char str = 'A';
//        for (int i = 0; i< 26; i++) {
//            allFirstLetter.add(str + "");
//            str = (char)((int)str + 1);
//        }
//        modelAndView.addObject("allFirstLetter", allFirstLetter);

        return modelAndView;
    }
}
