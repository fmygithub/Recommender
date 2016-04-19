package com.paper.web;

import com.paper.dao.AttentionDao;
import com.paper.dao.FavoritesDao;
import com.paper.dao.PaperDAO;
import com.paper.entity.Favorites;
import com.paper.entity.Paper;
import com.paper.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by fengmengyang on 2016/4/8.
 * desc:
 */
@Controller
public class PersonCenterController {
    @Autowired
    private FavoritesDao favoritesDao;
    @Autowired
    private PaperDAO paperDAO;
    @Autowired
    private AttentionDao attentionDao;

    @RequestMapping("/personCenter")
    public ModelAndView personCenter(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("personCenter");
        User user = (User)request.getSession().getAttribute("user");

        List<Favorites> favoritesList = null;
        List<Paper> papers = new ArrayList<>();
        int collectCount = 0;
        int attentionCount = 0;
        if (user != null) {
            Map<String, Object> favoriteParam = new HashMap<>();
            favoriteParam.put("userId", user.getId());
            favoriteParam.put("startIndex", 0);
            favoritesList = favoritesDao.getAllFavoritesPage(favoriteParam);
            collectCount = favoritesDao.getCountFavorites(user.getId());

            //关注总量
            attentionCount = attentionDao.getAttentionCount(user.getId());
        }

        if (favoritesList != null) {
            for (Favorites f : favoritesList) {
                Paper paper = paperDAO.findPaperByPid(f.getPid());
                papers.add(paper);
            }
        }



        modelAndView.addObject("favoritesList", favoritesList);
        modelAndView.addObject("paperList", papers);
        modelAndView.addObject("collectCount", collectCount);
        modelAndView.addObject("attentionCount", attentionCount);
        modelAndView.addObject("pageNow", 0);
        modelAndView.addObject("pageCount", (collectCount%10 == 0) ? (collectCount/10) : (collectCount/10 + 1));

        return modelAndView;
    }
}
