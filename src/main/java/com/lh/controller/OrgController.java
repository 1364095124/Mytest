package com.lh.controller;

import com.alibaba.fastjson.JSON;
import com.lh.model.Department;
import com.lh.model.Job;
import com.lh.model.Organization;
import com.lh.model.PersonJob;
import com.lh.service.IOrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrgController {

    @Autowired
    private IOrgService orgService;

    /**
     * 跳转到组织管理页面
     * @return
     */
    @RequestMapping(value="org/orgList")
    public String orgList(){
        return "orgManager/orgManager";
    }

    /**
     * 获得所有组织信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value="org/getAllOrg",produces = "text/plain;charset=utf-8")
    public String getAllOrg(){
        return JSON.toJSONString(orgService.getAllOrg());
    }

    /**
     * 新增组织
     * @param organization
     * @return
     */
    @ResponseBody
    @RequestMapping(value="org/addOrg")
    public String addOrg(Organization organization){
        return orgService.addOrg(organization);
    }

    /**
     * 根据id删除组织
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("org/delOrg")
    public String delOrg(@RequestParam("id") String id){
        return orgService.delOrgById(id);
    }

    /**
     * 更新组织信息
     * @param organization
     * @return
     */
    @ResponseBody
    @RequestMapping("org/updateOrg")
    public String updateOrg(Organization organization){
        return orgService.updateOrg(organization);
    }

    /**
     * 跳转到部门管理页面
     * @return
     */
    @RequestMapping(value="org/depList")
    public String depList(){
        return "orgManager/depManager";
    }

    /**
     * 获得所有部门信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value="org/getAllDep",produces = "text/plain;charset=utf-8")
    public String getAllDep(){
        return JSON.toJSONString(orgService.getAllDep());
    }

    /**
     * 新增部门
     * @param department
     * @return
     */
    @ResponseBody
    @RequestMapping(value="org/addDep")
    public String addDep(Department department){
        return orgService.addDep(department);
    }

    /**
     * 根据id删除部门
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("org/delDep")
    public String delDep(@RequestParam("id") String id){
        return orgService.delDepById(id);
    }

    /**
     * 更新部门信息
     * @param department
     * @return
     */
    @ResponseBody
    @RequestMapping("org/updateDep")
    public String updateDep(Department department){
        return orgService.updateDep(department);
    }

    /**
     * 跳转到部门管理页面
     * @return
     */
    @RequestMapping(value="org/jobList")
    public String jobList(){
        return "orgManager/jobManager";
    }

    /**
     * 获得所有职位信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value="org/getAllJob",produces = "text/plain;charset=utf-8")
    public String getAllJob(){
        return JSON.toJSONString(orgService.getAllJob());
    }

    /**
     * 新增职位
     * @param job
     * @return
     */
    @ResponseBody
    @RequestMapping(value="org/addJob")
    public String addJob(Job job){
        return orgService.addJob(job);
    }

    /**
     * 根据id删除职位
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("org/delJob")
    public String delJob(@RequestParam("id") String id){
        return orgService.delJobById(id);
    }

    /**
     * 更新职位信息
     * @param job
     * @return
     */
    @ResponseBody
    @RequestMapping("org/updateJob")
    public String updateJob(Job job){
        return orgService.updateJob(job);
    }

    /**
     * 跳转到人员管理界面
     * @return
     */
    @RequestMapping(value="org/personJobList")
    public String personJobList(){
        return "orgManager/personManager";
    }

    /**
     * 得到所有的账号匹配信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value="org/getAllPersonJobList",produces = "text/plain;charset=utf-8")
    public String getAllPersonJobList(){
        return JSON.toJSONString(orgService.getAllJobInfo());
    }

    /**
     * 根据id删除职位匹配
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value="org/delPersonJob")
    public String delPersonJob(@RequestParam("id") String id){
        return orgService.delJobInfoById(id);
    }

    /**
     * 新增职位人员匹配信息
     * @param personJob
     * @return
     */
    @ResponseBody
    @RequestMapping(value="org/addPersonJob",produces = "text/plain;charset=utf-8")
    public String addPersonJob(PersonJob personJob){
        return orgService.addJobInfo(personJob);
    }

    /**
     * 更新职位人员匹配信息
     * @param personJob
     * @return
     */
    @ResponseBody
    @RequestMapping(value="org/updatePersonJob",produces = "text/plain;charset=utf-8")
    public String updatePersonJob(PersonJob personJob){
        return orgService.updateJobInfo(personJob);
    }

}
