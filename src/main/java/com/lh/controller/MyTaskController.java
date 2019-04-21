package com.lh.controller;

import com.lh.model.Page;
import com.lh.service.IMyTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;

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

    /**
     * 跳转到流程图展示界面
     * @return
     */
    @RequestMapping("task/openActivitiProccessImagePage")
    public ModelAndView openActivitiProccessImagePage(String pProcessInstanceId){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("processInstanceId", pProcessInstanceId);
        modelAndView.setViewName("task/ActivitiProccessImagePage");
        return modelAndView;
    }

    /**
     * 获取流程图像，已执行节点和流程线高亮显示
     * @param pProcessInstanceId
     * @param response
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("task/getActivitiProccessImage")
    public void getActivitiProccessImage(String pProcessInstanceId, HttpServletResponse response) throws Exception{
        myTaskService.getActivitiProccessImage(pProcessInstanceId,response);
    }

    /**
     * 审核
     * @param taskId 任务id
     * @param comment 批注
     * @param state 审核状态
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "task/doAuditing",produces = "text/plain;charset=utf-8")
    public String doAuditing(@RequestParam("taskId") String taskId,@RequestParam("comment") String comment,
                             @RequestParam("state") Integer state){
        return myTaskService.audit_bz(taskId,comment,state);
    }

    /**
     * 查询历史批注
     * @param processInstanceId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "task/listHistoryComment",produces = "text/plain;charset=utf-8")
    public String listHistoryComment(String processInstanceId){
        return myTaskService.listHistoryCommentByPid(processInstanceId);
    }
}

