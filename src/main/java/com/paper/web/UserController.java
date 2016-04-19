package com.paper.web;

import com.paper.dao.UserDao;
import com.paper.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.sound.midi.Soundbank;

/**
 * Created by fengmengyang on 2016/3/26.
 * desc: 用户相关控制
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserDao userDao;

    //进入登录界面
    @RequestMapping("/login")
    public ModelAndView intoLoginPage(@RequestParam(value = "error", required = false) boolean error, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("login");
        if (error) {
            modelAndView.addObject("error","You have entered an invalid username or password!");
        } else {
            modelAndView.addObject("error", "");
        }
        //如果session中有数据，则清除
        User user = (User)request.getSession().getAttribute("user");
        if (user != null) {
            request.getSession().removeAttribute("user");
        }
        return modelAndView;
    }

    @RequestMapping("/loginCheck")
    public ModelAndView loginCheck(HttpServletRequest request, User user) {
        User u = userDao.getByUser(user);
        if (u != null) {
            request.getSession().setAttribute("user", u);
            return new ModelAndView("system/homepage");
        } else {
            return new ModelAndView("login", "error", "用户名或密码错误");
        }
    }

    @RequestMapping("/loginSuccess")
    public ModelAndView loginSuccess() {
        return new ModelAndView("system/homepage");
    }

    //进入注册页面
    @RequestMapping("/register")
    public String intoRegisterPage() {
        return "register";
    }

    //注册校验
    @RequestMapping("/registerCheck")
    public ModelAndView registerCheck(HttpServletRequest request, User user) {
        if (userDao.getUserByName(user.getUserName()) != null) {
            return new ModelAndView("register", "error", "该用户名已被使用!");
        } else {
            userDao.insert(user);
            //进入主页
            //保存登录状态
            User u = userDao.getUserByName(user.getUserName());
            request.getSession().setAttribute("user", u);
            return new ModelAndView("system/homepage");
        }
    }

}
