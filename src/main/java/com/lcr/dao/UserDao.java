package com.lcr.dao;

import com.lcr.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

public interface UserDao {
    /***
     * 添加用户
     * @param user
     * @return
     */
    public int insert(User user);

    /***
     * 更新用户,当设置state为3时表示删除用户
     * @param user
     * @return
     */
    public int update(User user);

    /***
     * 查询用户
     * @param user
     * @return
     */
    public User queryById(User user);

    /***
     * 根据用户名和email登录
     * @param name
     * @param email
     * @param password
     * @return
     */
    /***
     * mybatis接收多个参数时，需要加@Param()
     * @param username
     * @param email
     * @param password
     * @return
     */
    public User queryByNameOrEmail(@Param("username") String username,@Param("password")  String password, @Param("email")String email);

    /*public User queryByNameOrEmail(User user);*/

    /***
     * 根据id查询用户信息
     * @param id
     * @return
     */
    public User queryById(int id);

}
