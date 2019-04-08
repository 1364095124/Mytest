package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.dao.OrgMapper;
import com.lh.model.*;
import com.lh.service.IOrgService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service("orgService")
public class OrgServiceImpl implements IOrgService {

    @Autowired
    private OrgMapper orgMapper;

    /**
     * 查询所有的部门信息
     * @return
     */
    @Override
    public ResultMap<List<Department>> getAllDep() {
        List<Department> list=orgMapper.queryAllDep();
        Integer count=orgMapper.queryDepCount();
        return new ResultMap<List<Department>>("",list,0,count);
    }

    /**
     * 根据id删除部门
     * @param id
     * @return
     */
    @Override
    public String delDepById(String id) {
        JSONObject rs=new JSONObject();
        if(orgMapper.delDep(id)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","数据库操作失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 新增部门信息
     * @param department
     * @return
     */
    @Override
    public String addDep(Department department) {
        JSONObject rs=new JSONObject();
        if(orgMapper.queryDepByName(department.getName())!=null){
            rs.put("success",false);
            rs.put("msg","部门名冲突！");
        }else{
            User user=(User) SecurityUtils.getSubject().getPrincipal();
            department.setCreateAccount(user.getAccount());

            if(orgMapper.addDep(department)>0){
                rs.put("success",true);
                rs.put("msg","");
            }else{
                rs.put("success",false);
                rs.put("msg","数据库操作失败！");
            }
        }

        return JSON.toJSONString(rs);
    }

    /**
     * 更新部门信息
     * @param department
     * @return
     */
    @Override
    public String updateDep(Department department) {
        JSONObject rs=new JSONObject();
        if(orgMapper.updateDep(department)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","数据库操作失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 得到所有组织列表
     * @return
     */
    @Override
    public ResultMap<List<Organization>> getAllOrg() {
        List<Organization> list=orgMapper.queryAllOrg();
        Integer count=orgMapper.queryDepCount();
        return new ResultMap<List<Organization>>("",list,0,count);
    }

    /**
     * 根据id删除组织信息
     * @param id
     * @return
     */
    @Override
    public String delOrgById(String id) {
        JSONObject rs=new JSONObject();
        if(orgMapper.delOrg(id)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","数据库操作失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 新增组织信息
     * @param organization
     * @return
     */
    @Override
    public String addOrg(Organization organization) {
        JSONObject rs=new JSONObject();
        if(orgMapper.queryOrgByName(organization.getName())!=null){
            rs.put("success",false);
            rs.put("msg","组织名已存在！");
        }else{
            User user=(User) SecurityUtils.getSubject().getPrincipal();
            organization.setCreateAccount(user.getAccount());

            if(orgMapper.addOrg(organization)>0){
                rs.put("success",true);
                rs.put("msg","");
            }else{
                rs.put("success",false);
                rs.put("msg","数据库操作失败！");
            }
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 更新组织信息
     * @param organization
     * @return
     */
    @Override
    public String updateOrg(Organization organization) {
        JSONObject rs=new JSONObject();
        if(orgMapper.updateOrg(organization)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","数据库操作失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 得到所有职位列表
     * @return
     */
    @Override
    public ResultMap<List<Job>> getAllJob() {
        List<Job> list=orgMapper.queryAllJob();
        Integer count=orgMapper.queryDepCount();
        return new ResultMap<List<Job>>("",list,0,count);
    }

    /**
     * 根据id删除职位信息
     * @param id
     * @return
     */
    @Override
    public String delJobById(String id) {
        JSONObject rs=new JSONObject();
        if(orgMapper.delJob(id)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","数据库操作失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 新增职位信息
     * @param job
     * @return
     */
    @Override
    public String addJob(Job job) {
        JSONObject rs=new JSONObject();
        if(orgMapper.queryJobByName(job.getName())!=null){
            rs.put("success",false);
            rs.put("msg","职位名已存在！");
        }else{
            User user=(User) SecurityUtils.getSubject().getPrincipal();
            job.setCreateAccount(user.getAccount());

            if(orgMapper.addJob(job)>0){
                rs.put("success",true);
                rs.put("msg","");
            }else{
                rs.put("success",false);
                rs.put("msg","数据库操作失败！");
            }
        }

        return JSON.toJSONString(rs);
    }

    /**
     * 更新职位信息
     * @param job
     * @return
     */
    @Override
    public String updateJob(Job job) {
        JSONObject rs=new JSONObject();
        if(orgMapper.updateJob(job)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","数据库操作失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 查询所有职位匹配信息
     * @return
     */
    @Override
    public ResultMap<List<PersonJob>> getAllJobInfo() {
        List<PersonJob> list=orgMapper.getAllJobInfo();
        Integer count=orgMapper.queryJobInfoCount();
        return new ResultMap<List<PersonJob>>("",list,0,count);

    }

    /**
     * 新增职位匹配信息
     * @param personJob
     * @return
     */
    @Override
    public String addJobInfo(PersonJob personJob) {
        JSONObject rs=new JSONObject();
        if(personJob.getAccount()==null||("").equals(personJob.getAccount())){
            rs.put("success",false);
            rs.put("msg","账号不能为空！");
        }else if(personJob.getDepartmentid()==null||("").equals(personJob.getDepartmentid())){
            rs.put("success",false);
            rs.put("msg","所属部门不能为空！");
        }else if(personJob.getOrganizationid()==null||("").equals(personJob.getOrganizationid())){
            rs.put("success",false);
            rs.put("msg","所属组织不能为空！");
        }
        else if(personJob.getJobid()==null || ("").equals(personJob.getJobid())){
            rs.put("success",false);
            rs.put("msg","所属职位不能为空！");
        }else{
            if(orgMapper.querySameJobInfo(personJob)>0){
                rs.put("success",false);
                rs.put("msg","新增的职位信息重复！");
            }else{
                if(orgMapper.addJobInfo(personJob)>0){
                    rs.put("success",true);
                    rs.put("msg","");
                }else{
                    rs.put("success",false);
                    rs.put("msg","更新数据库失败！");
                }
            }
        }


        return JSON.toJSONString(rs);
    }

    /**
     * 更新职位匹配信息
     * @param personJob
     * @return
     */
    @Override
    public String updateJobInfo(PersonJob personJob) {
        JSONObject rs=new JSONObject();
        if(orgMapper.updateJobInfo(personJob)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","更新数据库失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 根据id删除职位匹配信息
     * @param id
     * @return
     */
    @Override
    public String delJobInfoById(String id) {
        JSONObject rs=new JSONObject();
        if(orgMapper.delJobInfo(id)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","更新数据库失败！");
        }
        return JSON.toJSONString(rs);
    }


}
