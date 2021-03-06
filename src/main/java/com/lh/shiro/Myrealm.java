package com.lh.shiro;

import com.alibaba.fastjson.JSON;
import com.lh.common.StringUtils;
import com.lh.dao.UserMapper;
import com.lh.model.Role;
import com.lh.model.User;
import com.lh.service.IUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class Myrealm extends AuthorizingRealm {

    @Autowired
    private IUserService userService;
    /*
    授权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        User user=(User)principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo info =  new SimpleAuthorizationInfo();
        Map<String,Object> map=userService.queryPermissionByUser(user.getAccount());
        Set<String> roleSet=(Set)map.get("role");
        System.out.println("----role"+JSON.toJSONString(roleSet));
        Set<String> permissionSet=(Set)map.get("permission");
        System.out.println("----per"+JSON.toJSONString(permissionSet));

        /*根据用户ID查询角色（role），放入到Authorization里.*/
        info.setRoles(roleSet);
        /*根据用户ID查询权限（permission），放入到Authorization里.*/
        info.setStringPermissions(permissionSet);
        return info;
    }

    /*
    登陆验证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) {

        String account=(String)token.getPrincipal();
        String password=new String((char[])token.getCredentials());
        List<User> list=userService.login(account,password);
        if(null==list||list.size()==0){
            System.out.println("为空");
            throw new AccountException("账号密码不对");
        }else if(list.get(0).getIsDisabled()==1){
            throw new DisabledAccountException("该账号已被禁止");
        }else{

        }
        return new SimpleAuthenticationInfo(list.get(0),list.get(0).getPassword(), getName());
    }


    /**
     * 清空当前用户权限信息
     */
    public  void clearCachedAuthorizationInfo() {
        PrincipalCollection principalCollection = SecurityUtils.getSubject().getPrincipals();
        SimplePrincipalCollection principals = new SimplePrincipalCollection(
                principalCollection, getName());
        super.clearCachedAuthorizationInfo(principals);
    }
    /**
     * 指定principalCollection 清除
     */
    public void clearCachedAuthorizationInfo(PrincipalCollection principalCollection) {
        SimplePrincipalCollection principals = new SimplePrincipalCollection(
                principalCollection, getName());
        super.clearCachedAuthorizationInfo(principals);
    }


}
