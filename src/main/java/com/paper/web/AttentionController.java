package com.paper.web;

import com.paper.dao.AttentionDao;
import com.paper.dao.AuthorDAO;
import com.paper.dao.FavoritesDao;
import com.paper.entity.*;
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
@RequestMapping("/attention")
public class AttentionController {
    @Autowired
    private AttentionDao attentionDao;
    @Autowired
    private AuthorDAO authorDAO;

    @RequestMapping("/addAttention/{aid}")
    public @ResponseBody Object addAttention(@PathVariable("aid") String aid, HttpServletRequest request) {
        User user = (User)request.getSession().getAttribute("user");
        Attention attention = new Attention();
        attention.setUserId(user.getId());
        attention.setAid(Integer.parseInt(aid));
        Map<String, String> result = new HashMap<>();
        try {
            attentionDao.addAttention(attention);
            result.put("msg", "success");
        } catch (Exception e) {
            result.put("msg", "fail");
        }
        return result;
    }

    @RequestMapping("/delAttention/{aid}")
    public @ResponseBody Object cancelAttention(@PathVariable("aid") String aid, HttpServletRequest request) {
        User user = (User)request.getSession().getAttribute("user");
        Attention attention = new Attention();
        attention.setUserId(user.getId());
        attention.setAid(Integer.parseInt(aid));
        Map<String, String> result = new HashMap<>();
        try {
            attentionDao.delAttention(attention);
            result.put("msg", "success");
        } catch (Exception e) {
            result.put("msg", "fail");
        }
        return result;
    }

    @RequestMapping("/getAllAttentions")
    public ModelAndView getAllAttentions(
            HttpServletRequest request,
            @RequestParam(value = "pageNow", defaultValue = "1") String pageNow) {
        User user = (User)request.getSession().getAttribute("user");
        List<Attention> attentionList = null;
        List<Author> authors = new ArrayList<>();
        int attentionCount = 0;
        int size = 10;
        if (user != null) {
            Map<String, Object> param = new HashMap<>();
            param.put("userId", user.getId());
            param.put("startIndex", (Integer.parseInt(pageNow) - 1) * size);
            param.put("size", size);
            attentionList = attentionDao.getAllAttentionPage(param);
            attentionCount = attentionDao.getAttentionCount(user.getId());
        }

        if (attentionList != null) {
            for (Attention attention : attentionList) {
                Author author = authorDAO.findById(attention.getAid());
                authors.add(author);
            }
        }


        ModelAndView modelAndView = new ModelAndView("/personCenter/attentions");

        modelAndView.addObject("authorList", authors);
        modelAndView.addObject("pageNow", pageNow);
        modelAndView.addObject("pageCount", (attentionCount%size == 0) ? (attentionCount/size) : (attentionCount/size + 1));

        return modelAndView;
    }
}
