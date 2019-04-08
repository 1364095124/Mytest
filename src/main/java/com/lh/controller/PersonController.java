package com.lh.controller;

import com.alibaba.fastjson.JSON;
import com.lh.service.IPersonService;
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
}
