package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.lh.dao.LeaveMapper;
import com.lh.dao.TaskMapper;
import com.lh.model.LeaveForm;
import com.lh.model.MyTask;
import com.lh.model.Page;
import com.lh.model.ResultMap;
import com.lh.service.IMyTaskService;
import org.activiti.engine.*;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service("myTaskService")
public class MyTaskServiceImpl implements IMyTaskService {

    // 引入activiti自带的Service接口
    @Resource
    private TaskService taskService;

    @Resource
    private RepositoryService repositoryService;

    @Resource
    private RuntimeService runtimeService;

    @Resource
    private FormService formService;


    @Resource
    private HistoryService historyService;

    @Autowired
    private LeaveMapper leaveMapper;

    /**
     *  分页查询代办
     * @param page
     * @param limit
     * @return
     */
    @Override
    public String daibanTask(Page page,Integer limit) {
        page.setRows(limit);
        long total=taskService.createTaskQuery()
                .taskAssignee(page.getAccount())
                .count(); // 获取总记录数
        System.out.println("---count="+total);
        List<Task> taskList=taskService.createTaskQuery()
                // 根据用户id查询
                .taskAssignee(page.getAccount())
                // 根据任务名称查询

                // 返回带分页的结果集合
                .listPage(page.getStart(), page.getRows());
        List<MyTask> MyTaskList=new ArrayList<MyTask>();
        SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(Task t:taskList){
            MyTask myTask=new MyTask();
            myTask.setId(t.getId());
            myTask.setName(t.getName());
            myTask.setCreateTime(sf.format(t.getCreateTime()));
            System.out.println("---pid"+t.getId());
            LeaveForm leaveForm=leaveMapper.queryLeaveByPid(t.getId());
            System.out.println("---"+JSON.toJSONString(leaveForm));
            //myTask.setApplyName(leaveForm.getAccount());
            MyTaskList.add(myTask);
        }
        return JSON.toJSONString(new ResultMap<List<MyTask>>("",MyTaskList,
                0,Integer.parseInt(String.valueOf(total))));
    }
}
