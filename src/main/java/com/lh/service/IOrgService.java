package com.lh.service;

import com.lh.model.Department;
import com.lh.model.Job;
import com.lh.model.Organization;
import com.lh.model.ResultMap;

import java.util.List;

public interface IOrgService {

    public ResultMap<List<Department>> getAllDep();

    public String delDepById(String id);

    public String addDep(Department department);

    public String updateDep(Department department);

    public ResultMap<List<Organization>> getAllOrg();

    public String delOrgById(String id);

    public String addOrg(Organization organization);

    public String updateOrg(Organization organization);

    public ResultMap<List<Job>> getAllJob();

    public String delJobById(String id);

    public String addJob(Job job);

    public String updateJob(Job job);
}
