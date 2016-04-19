package com.paper.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by fengmengyang on 2016/3/26.
 * desc:
 */
@Controller
public class IndexController {
    @RequestMapping("/")
    public String index() {
        return "system/homepage";
    }
}
