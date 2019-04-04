package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.common.EmailUtils;
import com.lh.common.JedisUtils;
import com.lh.dao.UserMapper;
import com.lh.model.MailParameters;
import com.lh.model.Person;
import com.lh.model.User;
import com.lh.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.*;

@Service("userService")
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper userMapper;


    @Override
    public List<User> login(String account, String password) {
        User user=new User();
        user.setAccount(account);
        user.setPassword(password);

        return userMapper.login(user);
    }

    @Override
    public int updateIsDisabled(String account, Integer isDisabled) {

        return userMapper.updateIsDisabled(account,isDisabled);
    }

    @Override
    public User selectUser(User user) {
        return userMapper.selectUser(user);
    }

    @Override
    public String getCode(String account) {
        JSONObject resultMap=new JSONObject();
        String code=EmailUtils.produceCode();
        JedisUtils.setex(account+"code",60*3,code);

        Person person =userMapper.selectPersonByAccount(account);
        if(person!=null){
            MailParameters p=new MailParameters();
            p.setSenderAddress("1364095124@qq.com");
            p.setRecipientAddress(person.getEmail());
            p.setMailSubject("验证码");
            p.setMailContent(code);
            p.setSenderPassword("ghlggflzzsayijcc");
            p.setSenderAccount("1364095124@qq.com");
            System.out.println("-------"+JSON.toJSONString(p));
            try {
                EmailUtils.send(p);
                resultMap.put("state","200");
                resultMap.put("message","成功！");
            } catch (Exception e) {
                e.printStackTrace();
                resultMap.put("state","500");
                resultMap.put("message","失败");
            }finally{
                return JSON.toJSONString(resultMap);
            }
        }else{
            resultMap.put("state","400");
            resultMap.put("message","账号不存在");
            return JSON.toJSONString(resultMap);
        }


    }

    @Override
    public String checkCode(String code, String account) {
        JSONObject resultMap=new JSONObject();

        if(JedisUtils.isExist(account+"code")){
            if(code!=null&&code!=""){
                if(JedisUtils.get(account+"code").equals(code)){

                    User user=new User();
                    user.setAccount(account);
                    User user0=userMapper.selectUser(user);

                    resultMap.put("state","200");
                    resultMap.put("message",user0.getPassword());
                    JedisUtils.del(account+"code");
                }else{
                    resultMap.put("state","500");
                    resultMap.put("message","验证码错误！");
                }
            }
        }else{
            resultMap.put("state","400");
            resultMap.put("message","验证码不存在或已经失效，请重新获取！");
        }

        return JSON.toJSONString(resultMap);
    }


    @Override
    public String findPersonByAccount(String account) {
        Person person= userMapper.selectPersonByAccount(account);
        return JSON.toJSONString(person);
    }

    @Override
    public String updatePwd(User user) {
        JSONObject resultMap=new JSONObject();
        if(userMapper.updatePwd(user)>0){
            resultMap.put("state","200");
            resultMap.put("message","密码更新成功！");
        }else{
            resultMap.put("state","500");
            resultMap.put("message","更新失败！请重试");
        }
        return JSON.toJSONString(resultMap);
    }

    @Override
    public String updatePerson(Person person) {
        JSONObject resultMap=new JSONObject();
        if(userMapper.updatePerson(person)>0){
            resultMap.put("state","200");
            resultMap.put("message","个人资料更新成功！");
        }else{
            resultMap.put("state","500");
            resultMap.put("message","更新失败！请重试");
        }
        return JSON.toJSONString(resultMap);
    }



    @Override
    public Map<String, Object> queryPermissionByUser(String account) {
        Map<String,Object> map=new HashMap();
        Set<String> roleSet=new HashSet<>();
        Set<String> permissionSet=new HashSet<>();
        List<String> list=userMapper.queryRoleByUser(account);
        roleSet.addAll(list);
        for(String s:list){
            List<String> l=userMapper.queryPermissionByRole(s);
            permissionSet.addAll(l);
        }
        map.put("role",roleSet);
        map.put("permission",permissionSet);

        return map;
    }




}
