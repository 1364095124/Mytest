package com.lh.dao;

import com.lh.model.Person;
import com.lh.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface UserMapper {

    /*

     */
    public List<User> login(User user);

    public int updateIsDisabled(@Param("account") String account,@Param("isDisabled") Integer isDisabled);

    public User selectUser(User user);

    public User selectUserById(String id);

    public User selectUserByAccount(String account);

    public Person  selectPersonByAccount(String account);

    public int updatePwd(User user);

    public int updatePerson(Person person);

    public User queryRoleByAccount(String account);

    public Set<String> queryRoleByUser(String account);

    public Set<String>  queryPermissionByRole(String roleName);


}
