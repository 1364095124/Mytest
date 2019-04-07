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
        User user=(User) SecurityUtils.getSubject().getPrincipal();
        department.setCreateAccount(user.getAccount());
        JSONObject rs=new JSONObject();
        if(orgMapper.addDep(department)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","数据库操作失败！");
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
        User user=(User) SecurityUtils.getSubject().getPrincipal();
        organization.setCreateAccount(user.getAccount());
        JSONObject rs=new JSONObject();
        if(orgMapper.addOrg(organization)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","数据库操作失败！");
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
        User user=(User) SecurityUtils.getSubject().getPrincipal();
        job.setCreateAccount(user.getAccount());
        JSONObject rs=new JSONObject();
        if(orgMapper.addJob(job)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","数据库操作失败！");
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


}
