package com.lh.controller;

import com.alibaba.fastjson.JSON;
import com.lh.model.LeaveForm;
import com.lh.model.Page;
import com.lh.model.ResultMap;
import com.lh.service.ILeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class LeaveController {

    @Autowired
    private ILeaveService leaveService;


    //跳转到新建任务页面
    @RequestMapping("/task/newTask")
    public String newTask(){
        return "task/defaultForm";
    }


    /**
     * 启动当前流程
     * @param leave_id
     * @return
     */
    @RequestMapping(value="/startApply")
    @ResponseBody
    public String startApply(@RequestParam("leave_id") String leave_id,@RequestParam("account") String account){
        return leaveService.startApply(leave_id,account);
    }

    /**
     * 分页查询所有已发申请
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value="/task/taskList")
    @ResponseBody
    public ResultMap<List<LeaveForm>> taskList(Page page, @RequestParam("limit") Integer limit){

        return leaveService.queryLeave(page,limit);
    }


    /**
     * 存为草稿
     * @param leaveForm
     * @return
     */
    @RequestMapping(value="/task/saveTask")
    @ResponseBody
    public String saveTask( LeaveForm leaveForm){
        return  leaveService.save(leaveForm);
    }

    /**
     * 保存并自动启动当前流程
     * @param leaveForm
     * @return
     */
    @RequestMapping(value="/task/autoStartApply")
    @ResponseBody
    public String autoStartApply(@RequestBody LeaveForm leaveForm){
        return leaveService.autoStartApply(leaveForm);
    }

    /**
     * 手动部署流程
     * @param name
     * @param bpmn
     * @param png
     * @param key
     */
    @RequestMapping(value="/deploy")
    @ResponseBody
    public void deploy(@RequestParam("name") String name,@RequestParam("bpmn")String bpmn,
                         @RequestParam("png") String png,@RequestParam("key") String key){
         leaveService.deploy(name,bpmn,png,key);
    }


    @RequestMapping(value="task/tasklist")
    public String tasklist(){
        return "task/taskList";
    }




}
