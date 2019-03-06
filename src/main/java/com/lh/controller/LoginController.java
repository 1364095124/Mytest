package com.lh.controller;

import com.alibaba.fastjson.JSON;
import com.lh.common.JedisUtils;
import com.lh.model.User;
import com.lh.service.IUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class LoginController {

    @Autowired
    private IUserService userService;
    private Map<String,Object> resultMap=new HashMap<>();


    //跳转到登录页
    @RequestMapping(value="/login")
    public String login(){
        return "login";
    }

    //跳转到找回密码界面
    @RequestMapping(value="findPassword")
    public String findPassword(){
        return "findPassword";
    }

    //跳转到错误页
    @RequestMapping(value = "/error")
    public String error(){
        return "error";
    }

    //跳转到主界面
    @RequestMapping(value = "/home")
    public String home(){
        return "home/UserHome";
    }

    //跳转到测试界面
    @RequestMapping(value="/testHome")
    public String testHome(){
        return "home";
    }

    //跳转到管理员的主界面
    @RequestMapping(value="/adminHome")
    public String adminHome(){
        return "home/AdminHome";
    }

    /*
    *得到当前的登陆人信息
     */
    @RequestMapping(value="/getCurrentUser")
    @ResponseBody
    public String getCurrentUser(HttpServletRequest request){
       User user=(User)SecurityUtils.getSubject().getPrincipal();
        return user.getAccount();
    }

    @RequestMapping(value="/getTest")
    @ResponseBody
    public int getTest(){
        return 1;
    }
    /*
    响应ajax请求，执行shiro的登陆验证操作
    @Param account 用户名
    @Param password 密码
     */
    @RequestMapping(value="/checkPwd",produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String checkPwd(@RequestParam("account") String account, @RequestParam("password") String password,
                           HttpServletRequest request, HttpServletResponse response, HttpSession session){
        Subject subject= SecurityUtils.getSubject();
        UsernamePasswordToken token=new UsernamePasswordToken(account,password);
        try{
            subject.login(token);
            if(JedisUtils.isExist(account)){
                JedisUtils.del(account);
            }

            User user0=new User();
            user0.setAccount(account);
            User user=userService.selectUser(user0);
            resultMap.put("state",200);
            if(user.getIsAdmin()==0){
                resultMap.put("message","user");
            }else if(user.getIsAdmin()==1){
                resultMap.put("message","admin");
            }



        }catch(DisabledAccountException dax){
            resultMap.put("state",500);
            resultMap.put("message","该账户已被禁用");
        }catch (ExcessiveAttemptsException eae) {
            resultMap.put("status", 500);
            resultMap.put("message", "登录次数过多！");
        }catch(AccountException ae){

            String excessiveInfo = ExcessiveAttemptsInfo(account);
            if(null!=excessiveInfo){
                resultMap.put("state",500);
                resultMap.put("message",excessiveInfo);
            }else{
                resultMap.put("state",500);
                resultMap.put("message","账号密码错误");
            }
        }catch(AuthenticationException ax){
            System.out.println(ax.toString());
            resultMap.put("state",500);
            resultMap.put("message","用户名不存在或密码错误");
        }
        return JSON.toJSONString(resultMap);
    }


    /*
    记录该账号密码错误的次数，达到5次提醒，达到10次禁用该账号
    @Param account 登陆名
     */
    public String ExcessiveAttemptsInfo(String account){
        String excessiveinfo=null;
        String accountkey=account;
        /*StringBuffer username=new StringBuffer(account);
        username=username.append("excessiveCount");
        String accountkey=username.toString();*/
        if(null==JedisUtils.get(accountkey)){
            JedisUtils.setex(accountkey,1800,"1");
        }else{
            Integer count=Integer.parseInt(JedisUtils.get(accountkey))+1;
            JedisUtils.setex(accountkey,1800-120*count,Integer.toString(count));
        }
        if(5==Integer.parseInt(JedisUtils.get(accountkey))){
            excessiveinfo="错误次数已达5次，再错误5次账号就会被封禁";
        }else if(10==Integer.parseInt(JedisUtils.get(accountkey))){
            excessiveinfo="次数已达上限，该账号已被封禁，请联系管理员解封";
            User user=new User();
            user.setAccount(account);
            if (null!=userService.selectUser(user)){
                userService.updateIsDisabled(account,1);
                JedisUtils.del(account);
            }
        }
        return excessiveinfo;
    }


    /*
    @Param String account
    获取验证码
     */
    @ResponseBody
    @RequestMapping(value="/getCode",produces = "text/plain;charset=UTF-8")
    public String getCode(@RequestParam("account") String account){
       return userService.getCode(account);
    }

    /*
    @Param String account,String code
    验证验证码，正确即可得到密码
     */
    @ResponseBody
    @RequestMapping(value="/checkCode",produces = "text/plain;charset=UTF-8")
    public String checkCode(@RequestParam("account") String account,@RequestParam("code") String code){
        return userService.checkCode(code,account);
    }
}
