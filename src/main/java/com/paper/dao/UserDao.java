package com.paper.dao;

import com.paper.entity.User;

/**
 * Created by fengmengyang on 2016/3/27.
 * desc:
 */
public interface UserDao {
    void insert(User user);
    User getUserByName(String userName);
    User getByUser(User user);
}
