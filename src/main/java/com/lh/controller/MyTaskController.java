package com.lh.controller;

import com.lh.model.Page;
import com.lh.service.IMyTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyTaskController {

    @Autowired
    private IMyTaskService myTaskService;

    /**
     * 跳转到代办页面
     * @return
     */
    @RequestMapping(value="/task/daibanjsp")
    public String daibanjsp(){
        return "task/daibanTask";
    }


    /**
     * 分页查询代办
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value="/task/daiban/daibanList",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String daibanList(Page page, @RequestParam("limit") Integer limit){
        return myTaskService.daibanTask(page,limit);
    }


}

