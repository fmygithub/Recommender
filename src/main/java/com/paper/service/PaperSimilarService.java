package com.paper.service;

import com.paper.dao.PaperDAO;
import com.paper.dao.PapersimDAO;
import com.paper.entity.Paper;
import com.paper.entity.Papersim;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by fengmengyang on 2016/3/27.
 * desc: 相似文献相关业务
 */
@Service
public class PaperSimilarService {
    @Autowired
    private PapersimDAO papersimDAO;

    @Autowired
    private PaperDAO paperDAO;

    //根据pid获取相似文献列表
    public Map<String,List> getSimilarPaperList(int pid) {
        //存放目标结果集
        List<Paper> similarPaperList = new ArrayList<>();
        //存放权重值
        List<Double> weightList = new ArrayList<>();

        List<Papersim> papersims = papersimDAO.finByNid(pid);
        for (Papersim ps : papersims) {
            similarPaperList.add(paperDAO.findPaperByPid(ps.getTid()));
            weightList.add(ps.getSim());
        }
        Map<String, List> map = new HashMap<>();
        map.put("similarPaperList", similarPaperList);
        map.put("weightList", weightList);
        return map;
    }
}
