package com.paper.web;

import com.paper.dao.FavoritesDao;
import com.paper.dao.PaperDAO;
import com.paper.dao.UserDao;
import com.paper.entity.Favorites;
import com.paper.entity.Paper;
import com.paper.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by fengmengyang on 2016/4/7.
 * desc:
 */
@Controller
@RequestMapping("/favorites")
public class FavoritesController {
    @Autowired
    private FavoritesDao favoritesDao;

    @Autowired
    private PaperDAO paperDAO;

    @RequestMapping("/addFavorites/{pid}")
    public @ResponseBody Object addFavorites(@PathVariable("pid") String pid, HttpServletRequest request) {
        User user = (User)request.getSession().getAttribute("user");
        Favorites favorites = new Favorites();
        favorites.setPid(Integer.parseInt(pid));
        favorites.setUserId(user.getId());
        Map<String,String> result = new HashMap<>();
        try {
            favoritesDao.addFavorite(favorites);
            result.put("msg", "success");
        } catch (Exception e) {
            result.put("msg", "fail");
        }
        return result;
    }

    @RequestMapping("/delFavorites/{pid}")
    public @ResponseBody Object cancelFavorites(@PathVariable("pid") String pid, HttpServletRequest request) {
        User user = (User)request.getSession().getAttribute("user");
        Favorites favorites = new Favorites();
        favorites.setPid(Integer.parseInt(pid));
        favorites.setUserId(user.getId());
        Map<String,String> result = new HashMap<>();
        try {
            favoritesDao.delFavorite(favorites);
            result.put("msg", "success");
        } catch (Exception e) {
            result.put("msg", "fail");
        }
        return result;
    }

    @RequestMapping("/getAllFavorites")
    public ModelAndView getAllFavorites(HttpServletRequest request,
                                        @RequestParam(value = "pageNow", defaultValue = "1") String pageNow) {
        User user = (User)request.getSession().getAttribute("user");
        List<Favorites> favoritesList = null;
        List<Paper> papers = new ArrayList<>();
        int collectCount = 0;
        int size = 10;
        if (user != null) {
            Map<String, Object> favoriteParam = new HashMap<>();
            favoriteParam.put("userId", user.getId());
            favoriteParam.put("startIndex", (Integer.parseInt(pageNow) - 1) * size);
            favoritesList = favoritesDao.getAllFavoritesPage(favoriteParam);
            collectCount = favoritesDao.getCountFavorites(user.getId());
        }

        if (favoritesList != null) {
            for (Favorites f : favoritesList) {
                Paper paper = paperDAO.findPaperByPid(f.getPid());
                papers.add(paper);
            }
        }

        ModelAndView modelAndView = new ModelAndView("/personCenter/favorites");

//        modelAndView.addObject("favoritesList", favoritesList);
        modelAndView.addObject("paperList", papers);
        modelAndView.addObject("collectCount", collectCount);
        modelAndView.addObject("pageNow", pageNow);
        modelAndView.addObject("pageCount", (collectCount%size == 0) ? (collectCount/size) : (collectCount/size + 1));

        return modelAndView;
    }
}
