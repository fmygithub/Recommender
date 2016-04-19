package com.paper.dao;

import com.paper.entity.Attention;
import com.paper.entity.Favorites;

import java.util.List;
import java.util.Map;

/**
 * Created by fengmengyang on 2016/3/27.
 * desc:
 */
public interface AttentionDao {
    
    void addAttention(Attention attention);
    void delAttention(Attention attention);
    Attention getAttention(Map map);

    int getAttentionCount(int userId);

    List<Attention> getAllAttentionPage(Map map);

}
