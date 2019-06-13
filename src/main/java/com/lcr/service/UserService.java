package com.lcr.service;

import com.lcr.dao.UserDao;
import com.lcr.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    /***
     * 用户登录
     * @param username
     * @param password
     * @param email
     * @return
     */
    public User login(String username, String password, String email) {
        User user = userDao.queryByNameOrEmail(username, password, email);
        return user;
    }

    /***
     * 根据id查询用户
     * @param id
     * @return
     */
    public User queryById(int id) {
        User user = userDao.queryById(id);
        return user;
    }

    /***
     * 修改用户信息
     * @param user
     * @return
     */
    public int update(User user){
        int i = userDao.update(user);
        return i;
    }
}
