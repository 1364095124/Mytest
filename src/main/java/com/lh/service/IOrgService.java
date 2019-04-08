package com.lh.service;

import com.lh.model.*;

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

    public ResultMap<List<PersonJob>> getAllJobInfo();


    public String addJobInfo(PersonJob personJob);

    public String updateJobInfo(PersonJob personJob);

    public String delJobInfoById(String id);
}
