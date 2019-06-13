package com.lcr.controller;

import com.lcr.entity.User;
import com.lcr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    /***
     * 登录
     */
    /***
     * @ResponseBody 是把方法的返回值转换成json数据类型
     */
    @RequestMapping("/login")
    @ResponseBody
    public Map<String, Object> login(String username, String password, String email, HttpSession session) {
        Map<String, Object> map = new HashMap();
        User user = userService.login(username, password, email);
        session.setAttribute("user", user);
        if (user != null) {
            map.put("success", true);
            if (user.getType()==0){
                map.put("type", 0);//普通用户
            }
            if (user.getType()==1){
                map.put("type", 1);//门卫
            }
            if (user.getType()==2){
                map.put("type", 2);//管理员
            }
        }else {
            map.put("success", false);
        }
        return map;
    }

    /***
     * 退出登录
     * @param name
     * @param session
     * @return
     */
    @RequestMapping("/exit")
    @ResponseBody
    public Map<String, Object> exit(String name, HttpSession session) {
        Map<String, Object> map = new HashMap();
        session.invalidate();
        map.put("success", true);
        return map;
    }

    /***
     * 先根据id查询到当前登录用户的信息
     */
    @RequestMapping("/upt")
    @ResponseBody
    public Map<String, Object> upt(int id) {
        Map<String, Object> map = new HashMap();
        User user = userService.queryById(id);
        if (user != null) {
            map.put("user", user);
            map.put("success", true);
        }
        return map;
    }

    @RequestMapping("/doUpt")
    @ResponseBody
    public Map<String, Object> doUpt(User user) {
        Map<String, Object> map = new HashMap();
        System.out.println(user.getCarNumber());

        int i = userService.update(user);
        System.out.println("i = " + i);
        if (i > 0) {
            map.put("success", true);
        } else {
            map.put("success", false);
        }
        return map;
    }
}
