package com.lh.controller;


import com.alibaba.fastjson.JSON;
import com.lh.model.Person;
import com.lh.model.User;
import com.lh.service.IUserService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

    @Autowired
    private IUserService userService;

    //跳转到个人名片页面
    @RequestMapping(value="/user/userIntroduce")

    public String userIntroduce(){
        return "userSetting/userIntroduce";
    }

    //跳转到个人设置页面
    @RequestMapping(value="/user/userSetting")

    public String userSetting(){
        return "userSetting/userSetting";
    }



    /*
    @Param user
    修改密码
     */
    @ResponseBody
    @RequestMapping(value="/user/userSetting/updatePwd",produces = "text/plain;charset=utf-8")
    public String updatePwd(User user){
        return userService.updatePwd(user);
    }



    /**
     * 聊天工具信息初始化
     * @param account
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/user/getInit")
    public String getInit(@RequestParam("account") String account){
        return null;
    }

    /**
     * 查询所有账号信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value="user/getAllUser")
    public String getAllUser(){
        return JSON.toJSONString(userService.getAllUser());
    }

    /**
     * 跳转到异常信息列表页面
     * @return
     */
    @RequestMapping(value="user/errUserList")
    public String errUserList(){
        return "user/errUserManager";
    }

    /**
     * 查询所有异常信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value="user/getAllErrUser",produces = "text/plain;charset=utf-8")
    public String getAllErrUser(){
        return JSON.toJSONString(userService.getAllErrUser());
    }

    /**
     * 删除异常信息
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value="user/delErrUser")
    public String delErrUser(@RequestParam("id") String id){
        return userService.delErrUser(id);
    }

    /**
     * 更新用户禁用状态
     * @param account
     * @param isDisabled
     * @return
     */
    @ResponseBody
    @RequestMapping(value="user/updateDisToR")
    public String updateDisToR(@RequestParam("account") String account,@RequestParam("isDisabled") Integer isDisabled){
        return userService.updateIsDisabled(account,isDisabled);
    }

}
