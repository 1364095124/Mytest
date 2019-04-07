package com.lh.dao;

import com.lh.model.Department;
import com.lh.model.Job;
import com.lh.model.Organization;
import org.omg.PortableServer.LIFESPAN_POLICY_ID;

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
}
