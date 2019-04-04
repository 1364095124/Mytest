package com.lh.service;

import com.lh.model.Person;
import com.lh.model.User;


import java.util.List;
import java.util.Map;

public interface IUserService {

    public List<User> login(String account, String password);

    public int updateIsDisabled(String account,Integer isDisabled);

    public User selectUser(User user);

    public String getCode(String account);

    public String checkCode(String code,String account);

    public String findPersonByAccount(String account);

    public String updatePwd(User user);

    public String updatePerson(Person person);

    public Map<String,Object> queryPermissionByUser(String account);


}
