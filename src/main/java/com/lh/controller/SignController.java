package com.lh.controller;

import com.lh.model.Sign;
import com.lh.service.ISignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SignController {

    @Autowired
    private ISignService signService;

    //跳转到签到页面
    @RequestMapping(value ="/oaTools/signManager")
    public String signManager(){
        return "oaTools/signManager";
    }

    /**
     * @Param sign
     * 执行签到
     */
    @ResponseBody
    @RequestMapping(value="/oaTools/signManager/doSign")
    public String doSign(Sign sign){
        return signService.doSign(sign);
    }

    /**
     * @Param account
     * 查询签到情况
     */
    @ResponseBody
    @RequestMapping(value="/oaTools/signManager/querySign")
    public String querySign(String account){
        return signService.querySign(account);
    }

    /**
     * 查询今天是否签到
     */
    @ResponseBody
    @RequestMapping(value="/oaTools/signManager/checkSign")
    public Integer checkSign(String account){
        return signService.checkSign(account);
    }
}
