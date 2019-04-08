package com.lh.dao;

import com.lh.model.Department;
import com.lh.model.Job;
import com.lh.model.Organization;
import com.lh.model.PersonJob;

import java.util.List;

public interface OrgMapper {

    /**
     * 新增组织
     * @param organization
     * @return
     */
    public Integer addOrg(Organization organization);

    /**
     * 查询所有组织
     * @return
     */
    public List<Organization> queryAllOrg();

    /**
     * 查询组织总行数
     * @return
     */
    public Integer queryOrgCount();

    /**
     * 根据ID查询组织
     * @param id
     * @return
     */
    public Organization queryOrgById(String id);


    /**
     * 根据name查询组织信息
     * @param name
     * @return
     */
    public Organization queryOrgByName(String name);

    /**
     * 更新组织信息
     * @param organization
     * @return
     */
    public Integer updateOrg(Organization organization);

    /**
     * 删除组织信息
     * @param id
     * @return
     */
    public Integer delOrg(String id);

    /**
     * 查询部门总行数
     * @return
     */
    public Integer queryDepCount();
    /**
     * 新增部门
     * @param department
     * @return
     */
    public Integer addDep(Department department);

    /**
     * 查询所有部门
     * @return
     */
    public List<Department> queryAllDep();

    /**
     * 根据ID查询部门
     * @param id
     * @return
     */
    public Department queryDepById(String id);

    /**
     *根据name查询部门
     * @param name
     * @return
     */
    public Department queryDepByName(String name);

    /**
     * 更新部门信息
     * @param department
     * @return
     */
    public Integer updateDep(Department department);

    /**
     * 根据ID删除部门
     * @param id
     * @return
     */
    public Integer delDep(String id);

    /**
     * 查询职位总行数
     * @return
     */
    public Integer queryJobCount();
    /**
     * 新增职位
     * @param job
     * @return
     */
    public Integer addJob(Job job);

    /**
     * 查询所有职位
     * @return
     */
    public List<Job> queryAllJob();

    /**
     * 根据ID查询职位
     * @param id
     * @return
     */
    public Job queryJobById(String id);

    /**
     * 根据name查询职位
     * @param name
     * @return
     */
    public Job queryJobByName(String name);

    /**
     * 更新职位信息
     * @param job
     * @return
     */
    public Integer updateJob(Job job);

    /**
     * 删除职位
     * @param id
     * @return
     */
    public Integer delJob(String id);

    /**
     * 查询所有的职位匹配信息
     * @return
     */
    public List<PersonJob> getAllJobInfo();

    /**
     * 查询账号的职位详细信息
     * @param account
     * @return
     */
    public List<PersonJob> getJobInfo(String account);

    /**
     * 查询是否有重复的职位匹配信息，防止重复插入
     * @param personJob
     * @return
     */
    public Integer querySameJobInfo(PersonJob personJob);

    /**
     * 查询所有职位匹配信息的总行数
     * @return
     */
    public Integer queryJobInfoCount();

    /**
     * 更新账号的职位详细信息
     * @param personJob
     * @return
     */
    public Integer updateJobInfo(PersonJob personJob);

    /**
     * 根据id删除职位信息
     * @param id
     * @return
     */
    public Integer delJobInfo(String id);

    /**
     * 新增职位信息
     * @param personJob
     * @return
     */
    public Integer addJobInfo(PersonJob personJob);


}
