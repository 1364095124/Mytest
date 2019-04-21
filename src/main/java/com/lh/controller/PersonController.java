package com.lh.controller;

import com.alibaba.fastjson.JSON;
import com.lh.model.Person;
import com.lh.service.IPersonService;
import com.lh.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PersonController {

    @Autowired
    private IPersonService personService;




    /**
     * 获得聊天工具初始化信息
     * @param account
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/person/getInit",produces = "text/plain;charset=utf-8")
    public String getInit(@RequestParam("account") String account){
        return personService.getInit(account);
    }

    /**
     * 查询所有账号信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value="person/getAllPerson",produces = "text/plain;charset=utf-8")
    public String getAllPerson(){
        return JSON.toJSONString(personService.getAllPerson());
    }

    /**
     * 修改用户个人信息
     * @param person
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/user/userSetting/updatePerson",produces = "text/plain;charset=utf-8")
    public String updatePerson(Person person){
        return personService.updatePerson(person);
    }

    /**
     * 根据账号查询个人信息
     * @param account
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/user/userSetting/getInfo",produces = "text/plain;charset=utf-8")
    public String getInfo(@RequestParam("account") String account){
        return personService.findPersonByAccount(account);
    }

    /**
     * 根据账号删除用户
     * @param account
     * @return
     */
    @ResponseBody
    @RequestMapping(value="person/delPerson",produces = "text/plain;charset=utf-8")
    public String delPerson(@RequestParam("account") String account){
        return personService.delPerson(account);
    }

    /**
     * 跳转到用户管理界面
     * @return
     */
    @RequestMapping(value="person/personList")
    public String personList(){
        return "user/userManager";
    }


    /**
     * 新增用户
     * @param person
     * @param password
     * @return
     */
    @ResponseBody
    @RequestMapping(value="person/insertPerson",produces = "text/plain;charset=utf-8")
    public String insertPerson(Person person,@RequestParam("password") String password){
        return personService.addPerson(person,password);
    }

}
