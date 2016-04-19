package com.paper.service;

import com.paper.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.security.core.userdetails.User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Created by fengmengyang on 2016/4/4.
 * desc:
 */
@Service
public class UserDetailService implements UserDetailsService {
    @Autowired
    private UserDao userDao;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        com.paper.entity.User user = userDao.getUserByName(userName);
        if (user != null) {
            return createUser(user);
        } else {
            throw new UsernameNotFoundException("Error in retrieving user");
        }
    }

    private User createUser(com.paper.entity.User user) {
        return new User(user.getUserName(), user.getPassword(), true, true, true, true,
                getAuthorities(user.getAccess()));
    }

    /**
     * 获得访问角色权限
     *
     * @param access
     * @return
     */
    public Collection<GrantedAuthority> getAuthorities(Integer access) {

        List<GrantedAuthority> authList = new ArrayList<>(1);

        // 所有的用户默认拥有ROLE_USER权限
        authList.add(new SimpleGrantedAuthority("ROLE_USER"));
        return authList;
    }
}
