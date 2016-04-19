package com.paper.service;

import com.paper.dao.AuthortoTitleDAO;
import com.paper.dao.PaperDAO;
import com.paper.entity.Author;
import com.paper.entity.AuthortoTitle;
import com.paper.entity.Paper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by fengmengyang on 2016/3/31.
 * desc:
 */
@Service
public class AuthorService {
    @Autowired
    private AuthortoTitleDAO authortoTitleDAO;
    @Autowired
    private PaperDAO paperDAO;

    //根据author获取author下的paper
    public Map<String, Object> getPaperByAuthor(Author author, int pageNow) {
        int pageCount = 1;
        int size = 10;
        Map<String, Object> map = new HashMap<>();
        List<Paper> paperList = new ArrayList<>();
        if (author != null) {
            List<AuthortoTitle> authortoTitles = authortoTitleDAO.findByNid(author.getNid());
            List<Paper> papers = new ArrayList<>();

            if (authortoTitles != null && authortoTitles.size() > 0) {
                for (AuthortoTitle at : authortoTitles) {
                    Paper paper = paperDAO.findPaperByPid(at.getPid());
                    papers.add(paper);
                }
                pageCount = papers.size() / size;
            }
            if (papers.size() % size != 0) {
                pageCount += 1;
            }
            int fromIndex = (pageNow - 1) * size;
            int toIndex = pageNow * size;
            if (toIndex > papers.size()) {
                toIndex = papers.size();
            }
            paperList = sortPaper(papers).subList(fromIndex, toIndex);

            map.put("paperList", paperList);
            map.put("pageCount", pageCount);
            return map;
        } else {
            return null;
        }
    }

    private List<Paper> sortPaper(List<Paper> papers) {
        if (papers.size() > 1) {//当文献数目大于1时，对得到的文献进行权重排序
            for (int i = 0; i < papers.size() - 1; i++) {
                for (int j = i + 1; j < papers.size(); j++) {
                    Paper temp;
                    Paper temp1;
                    Paper temp2;
                    if (papers.get(i).getWeight() < papers.get(j).getWeight()) {
                        temp1 = papers.get(i);
                        temp2 = papers.get(j);
                        temp = temp1;
                        temp1 = temp2;
                        temp2 = temp;
                        papers.set(i, temp1);
                        papers.set(j, temp2);
                    }
                }

            }
        }
        return papers;
    }
}
