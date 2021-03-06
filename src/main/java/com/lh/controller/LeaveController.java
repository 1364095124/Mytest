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


    /**
     * 跳转到差旅费报销界面
     * @return
     */
    @RequestMapping("/task/newClfTask")
    public String newTask(){
        return "task/clfForm";
    }

    /**
     * 跳转到领款收据单页面
     * @return
     */
    @RequestMapping("task/newLkTask")
    public String newLkTask(){
        return "task/lkForm";
    }

    /**
     * 跳转到付款单
     * @return
     */
    @RequestMapping("task/newFkdTask")
    public String newFkdTask(){
        return "task/fkdForm";
    }

    /**
     * 跳转到表单列表
     * @return
     */
    @RequestMapping("task/allTaskList")
    public String allTaskList(){
        return "task/newTaskList";
    }

    /**
     * 得到所有表单
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "task/getAllTaskList",produces = "text/plain;charset=utf-8")
    public String getAllTaskList(){
        return JSON.toJSONString(leaveService.getAllTaskList());
    }

    /**
     * 启动当前流程
     * @param leave_id
     * @return
     */
    @RequestMapping(value="/startApply")
    @ResponseBody
    public String startApply(@RequestParam("leave_id") String leave_id,@RequestParam("account") String account,
                             @RequestParam("department_Name") String department_Name,@RequestParam("sum") double sum){
        return leaveService.startApply(leave_id,account,department_Name,sum);
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


    /**
     * 跳转到已发事项页面
     * @return
     */
    @RequestMapping(value="task/tasklist")
    public String tasklist(){
        return "task/taskList";
    }

    /**
     * 分页查询存为草稿的申请
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value="task/trashTask")
    @ResponseBody
    public ResultMap<List<LeaveForm>> trashTask(Page page, @RequestParam("limit") Integer limit){

        return leaveService.queryTrashLeave(page, limit);
    }

    /**
     * 跳转到草稿页面
     * @return
     */
    @RequestMapping(value="task/trashTaskJsp")
    public String trashTaskJsp(){
        return "task/trashTask";
    }




}
