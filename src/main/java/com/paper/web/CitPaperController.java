package com.paper.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by fengmengyang on 2016/3/29.
 * desc:
 */
@Controller
@RequestMapping("/citPaper")
public class CitPaperController {

    @RequestMapping("/searchCit")
    public ModelAndView searchCit(@RequestParam("title") String title) {

        return new ModelAndView();
    }
}
