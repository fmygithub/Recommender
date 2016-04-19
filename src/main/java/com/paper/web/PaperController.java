package com.paper.web;

import com.paper.dao.*;
import com.paper.entity.*;
import com.paper.service.PaperSimilarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by fengmengyang on 2016/3/27.
 * desc:
 */
@Controller
@RequestMapping("/paper")
public class PaperController {
    @Autowired
    private PaperDAO paperDAO;

    @Autowired
    private UnitDAO unitDAO;

    @Autowired
    private AuthorDAO authorDAO;

    @Autowired
    private AuthortoTitleDAO authortoTitleDAO;


    @Autowired
    private PaperSimilarService paperSimilarService;

    @Autowired
    private CitPaperSoutDAO citPaperSoutDAO;

    @Autowired
    private FavoritesDao favoritesDao;


    //分页显示paper
    @RequestMapping("/papers/{pageNow}")
    public ModelAndView  getAllPapersPage(@PathVariable int pageNow) {
        int size = 12;
        //分页获取paper
        List<Paper> listAll = paperDAO.listPaper((pageNow - 1) * size);
        //获取所有paper数量
        int count = paperDAO.getPaperCount();
        //按权重获取前10个作者
        List<Author> authors = authorDAO.listAuthor(0);
        //按权重存放前10个unit
        List<Unit> units = unitDAO.listAllUnit(0);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("system/paperlist");
        modelAndView.addObject("pageCount", count / size);
        modelAndView.addObject("pageNow", pageNow);
        modelAndView.addObject("paperList", listAll);
        modelAndView.addObject("authorList", authors);
        modelAndView.addObject("unitList", units);
        return modelAndView;
    }

    //通过title查询
    @RequestMapping("/searchCit")
    public ModelAndView searchRelation(HttpServletRequest request,
                                       @RequestParam("title") String title,
                                       @RequestParam(value = "pageNow", defaultValue = "1") int pageNow) {
        List<Author> authorList = new ArrayList<>(); //存放文献作者
        List<Paper> similarPaperList = new ArrayList<>(); //存放相关文献
        List<Double> weightList = new ArrayList<>(); //存放相关文献权重
        User user = (User)request.getSession().getAttribute("user");
        String graph = "";
        int pageCount = 0; //存放相关文献分页数
        int size = 5;//每页显示记录数
        Paper paper = paperDAO.findPaperByTitle(title);
        List<CitPaperSout> citPaperSouts = new ArrayList<>();
        Favorites favorites = null;
        if (paper != null) {
            //获取文献作者信息
            List<AuthortoTitle> authortoTitles = authortoTitleDAO.findByPid(paper.getPid());
            for (AuthortoTitle at : authortoTitles) {
                Author author = authorDAO.findByNid(at.getNid());
                authorList.add(author);
            }

            //根据pid查找相似文献
            Map map = paperSimilarService.getSimilarPaperList(paper.getPid());
            similarPaperList = (List<Paper>)map.get("similarPaperList");
            weightList = (List)map.get("weightList");
            //
            List<Nodes> nodesList = new ArrayList<>();
            List<Links> linkList = new ArrayList<>();
            //添加本文献到node列表
            nodesList.add(new Nodes("This Paper", "1", 20.00));
            //添加相似文献到node列表
            for (int i = 0; i < similarPaperList.size(); i++) {
                nodesList.add(new Nodes(i + "", "2", weightList.get(i)));
                linkList.add(new Links(0, i+1, 2));
            }

            String strnode = "\"nodes\":" + nodesList;
            String strlink = "\"links\":" + linkList;
            graph = "{" + strlink + "," + strnode + "}";


            //经过排序的文献列表，哥我真不知道是干嘛使得，不就是排了个序吗？
            pageCount = citPaperSoutDAO.findCitCountByPid(paper.getPid());
            Map<String, Object> citPaperSoutParam = new HashMap<>();
            citPaperSoutParam.put("pid", paper.getPid());
            citPaperSoutParam.put("size", size);
            citPaperSoutParam.put("startIndex", (pageNow-1)*size);
            citPaperSouts = citPaperSoutDAO.findCitByPidPage(citPaperSoutParam);

            //查询该文章是否被用户收藏
            if (user != null) {
                Map<String, Object> favParam = new HashMap<>();
                favParam.put("userId", user.getId());
                favParam.put("pid", paper.getPid());
                favorites = favoritesDao.getFavorite(favParam);
            }
        }
        ModelAndView modelAndView = new ModelAndView("Paper/paper");
        modelAndView.addObject("cur_paper", paper); //当前选中的paper信息
        modelAndView.addObject("authors", authorList); //paper作者
        modelAndView.addObject("citPapers", citPaperSouts); //相似文献
        if (pageCount % 5 == 0) {
            modelAndView.addObject("pageCount", pageCount/5); //总页数
        } else {
            modelAndView.addObject("pageCount", pageCount/5 + 1); //总页数
        }
        modelAndView.addObject("pageNow", pageNow); //当前页
        modelAndView.addObject("similarPapers", similarPaperList); //相关文献
        modelAndView.addObject("graph", graph);
        if (favorites != null) {
            modelAndView.addObject("isCollect", true);
        } else {
            modelAndView.addObject("isCollect", false);
        }
        return modelAndView;
    }


}
