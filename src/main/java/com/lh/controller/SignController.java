package com.lh.controller;

import com.alibaba.fastjson.JSON;
import com.lh.model.Memo;
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
     * 跳转到备忘录页面
     */
    @RequestMapping(value="/oaTools/memoManager")
    public String memoManager(){
        return "oaTools/memoManager";
    }

    /**
     * @Param sign
     * 执行签到
     */
    @ResponseBody
    @RequestMapping(value="/oaTools/signManager/doSign",produces = "text/plain;charset=utf-8")
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
     * @Param account
     * 查询今天是否签到
     */
    @ResponseBody
    @RequestMapping(value="/oaTools/signManager/checkSign")
    public Integer checkSign(String account){
        return signService.checkSign(account);
    }

    /**
     * @Param memo
     * 新增一条备忘录数据
     */
    @ResponseBody
    @RequestMapping(value="/oaTools/memoMannger/addMemo")
    public String addMemo(Memo memo){
        return signService.addMemo(memo);
    }

    /**
     * @Param memo,keyWord,isNew
     * 查询备忘录数据
     */
    @ResponseBody
    @RequestMapping(value="/oaTools/memoMannger/queryMemo",produces = "text/plain;charset=utf-8")
    public String queryMemo(@RequestParam("account") String account,@RequestParam("keyWord") String keyWord,
                            @RequestParam("isNew") String isNew){
        return signService.queryMemo(account,keyWord,isNew);
    }



    /**
     * @Param memo
     * 修改备忘录数据
     */
    @ResponseBody
    @RequestMapping(value="/oaTools/memoMannger/updateMemo")
    public String updateMemo(Memo memo){
        return signService.updateMemo(memo);
    }

    /**
     * @Param id
     * 删除备忘录数据
     */
    @ResponseBody
    @RequestMapping(value="/oaTools/memoMannger/deleteMemo")
    public String deleteMemo(@RequestParam("id") String id){
        return signService.deleteMemo(id);
    }

    /**
     * 查询未过期提醒的次数
     * @param account 账号
     * @return
     */
    @ResponseBody
    @RequestMapping("oaTools/memoManager/getNewMemoCount")
    public Integer getNewMemoCount(String account){
        return signService.newMemoCount(account);
    }

}
