package com.lh.controller;


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
    @RequiresRoles("normal")
    public String userIntroduce(){
        return "userSetting/userIntroduce";
    }

    //跳转到个人设置页面
    @RequestMapping(value="/user/userSetting")
    @RequiresRoles("normal")
    public String userSetting(){
        return "userSetting/userSetting";
    }

    /*
    @Param account 账号
    响应ajax请求，得到当前人的个人信息
     */
    @ResponseBody
    @RequestMapping(value="/user/userSetting/getInfo",produces = "text/plain;charset=utf-8")
    public String getInfo(@RequestParam("account") String account){
        return userService.findPersonByAccount(account);
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

    /*
    @Param person
    修改用户个人信息
     */
    @ResponseBody
    @RequestMapping(value="/user/userSetting/updatePerson",produces = "text/plain;charset=utf-8")
    public String updatePerson(Person person){
        return userService.updatePerson(person);
    }
}
