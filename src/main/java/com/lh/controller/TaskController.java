package com.lh.controller;

import com.lh.model.LeaveForm;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TaskController {


    //跳转到新建任务页面
    @RequestMapping("/task/newTask")
    public String newTask(){
        return "task/defaultForm";
    }


    /*
    @Param leaveForm
    部署并启动当前流程
     */
    @RequestMapping(value="/startApply")
    @ResponseBody
    public String startApply(LeaveForm leaveForm){
        return null;
    }
}
