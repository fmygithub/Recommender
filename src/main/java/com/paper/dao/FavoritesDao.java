package com.paper.dao;

import com.paper.entity.Favorites;

import java.util.List;
import java.util.Map;

/**
 * Created by fengmengyang on 2016/3/27.
 * desc:
 */
public interface FavoritesDao {
    void addFavorite(Favorites favorites);
    Favorites getFavorite(Map map);
    void delFavorite(Favorites favorites);
    List<Favorites> getAllFavoritesPage(Map map);
    int getCountFavorites(int userId);
}
