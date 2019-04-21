package com.lh.dao;

import com.lh.model.ErrorUser;
import com.lh.model.Person;
import com.lh.model.Rest;
import com.lh.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    /**
     * 登陆验证
     * @param user
     * @return
     */
    public List<User> login(User user);

    /**
     * 禁用/启用指定账号
     * @param account
     * @param isDisabled
     * @return
     */
    public int updateIsDisabled(@Param("account") String account,@Param("isDisabled") Integer isDisabled);

    /**
     * 查询指定账号
     * @param user
     * @return
     */
    public User selectUser(User user);

    /**
     * 根据id查询账号
     * @param id
     * @return
     */
    public User selectUserById(String id);

    /**
     * 根据账号查询账号信息
     * @param account
     * @return
     */
    public User selectUserByAccount(String account);



    /**
     * 修改账号密码
     * @param user
     * @return
     */
    public int updatePwd(User user);



    /**
     * 根据账号查询角色信息
     * @param account
     * @return
     */
    public List<String> queryRoleByUser(String account);

    /**
     * 根据角色查询权限信息
     * @param roleName
     * @return
     */
    public List<String>  queryPermissionByRole(String roleName);

    /**
     * 新增账号
     * @param user
     * @return
     */
    public Integer insertUser(User user);

    /**
     * 查询所有账号信息
     * @return
     */
    public List<User> getAllUser();

    /**
     * 查询账号总数，分页使用
     * @return
     */
    public Integer queryUserCount();

    /**
     * 查询得到所有账号异常的信息
     * @return
     */
    public List<ErrorUser> getAllErrUser();

    /**
     * 得到异常账号的数目
     * @return
     */
    public Integer queryErrUserCount();

    /**
     * 新增账号异常信息
     * @param errorUser
     * @return
     */
    public Integer addErrUser(ErrorUser errorUser);


    /**
     * 删除异常信息
     * @param id
     * @return
     */
    public Integer delErrUser(String id);

    /**
     * 根据账号删除用户
     * @param account
     * @return
     */
    public Integer delUser(String account);

    /**
     * rest账户验证
     * @param rest
     * @return
     */
    public Integer getRest(Rest rest);

}
