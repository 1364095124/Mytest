package com.lh.controller;

import com.alibaba.fastjson.JSON;
import com.lh.model.Authorization;
import com.lh.service.IAutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AutController {
    @Autowired
    private IAutService autService;

    /**
     * 跳转到公告授权管理页面
     * @return
     */
    @RequestMapping("aut/noticeAutList")
    public String noticeAutList(){
        return "autManager/noticeAut";
    }

    /**
     * 跳转到会议授权管理界面
     * @return
     */
    @RequestMapping("aut/mettingAutList")
    public String mettingAutList(){
        return "autManager/mettingAut";
    }

    /**
     * 得到所有公告授权记录
     * @return
     */
    @ResponseBody
    @RequestMapping("aut/getAllNoticeAut")
    public String getAllNoticeAut(){
        return JSON.toJSONString(autService.getAllNoticeAut());
    }

    /**
     * 得到所有会议授权记录
     * @return
     */
    @ResponseBody
    @RequestMapping("aut/getAllMettingAut")
    public String getAllMettingAut(){
        return JSON.toJSONString(autService.getAllMettingAut());
    }

    /**
     * 新增授权信息
     * @param authorization
     * @return
     */
    @ResponseBody
    @RequestMapping("aut/addNoticeAut")
    public String addNoticeAut(Authorization authorization){
        return autService.addAut(authorization);
    }

    /**
     * 删除授权记录
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("aut/delAut")
    public String delAut(String id){
        return autService.delAut(id);
    }

    /**
     * 查询当前用户是否有该权限
     * @param permission
     * @return
     */
    @ResponseBody
    @RequestMapping("aut/queryAutByAccount")
    public Integer queryAutByAccount( String permission){
        return autService.queryAutByAccount(permission);
    }


}
