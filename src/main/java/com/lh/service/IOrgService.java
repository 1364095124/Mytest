package com.lh.service;

import com.lh.model.*;

import java.util.List;

public interface IOrgService {

     ResultMap<List<Department>> getAllDep();

     String delDepById(String id);

     String addDep(Department department);

     String updateDep(Department department);

     ResultMap<List<Organization>> getAllOrg();

     String delOrgById(String id);

     String addOrg(Organization organization);

     String updateOrg(Organization organization);

     ResultMap<List<Job>> getAllJob();

     String delJobById(String id);

     String addJob(Job job);

     String updateJob(Job job);

     ResultMap<List<PersonJob>> getAllJobInfo();


     String addJobInfo(PersonJob personJob);

     String updateJobInfo(PersonJob personJob);

     String delJobInfoById(String id);

     String queryJobInfoByAccount(String account);


}
