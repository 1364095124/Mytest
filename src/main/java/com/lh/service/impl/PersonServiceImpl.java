package com.lh.service.impl;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.lh.common.EmailUtils;
import com.lh.dao.MsgMapper;
import com.lh.dao.PersonMapper;
import com.lh.dao.UserMapper;
import com.lh.model.*;
import com.lh.scoket.SocketHandler;
import com.lh.service.IPersonService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.socket.WebSocketSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("personService")
public class PersonServiceImpl implements IPersonService {

    @Autowired
    private PersonMapper personMapper;

    @Autowired
    private SocketHandler socketHandler;

   @Autowired
   private UserMapper userMapper;

    /**
     * 查询用户的头像
     * @param account
     * @return
     */
    @Override
    public String getUserAvatar(String account) {
        Person person=personMapper.queryPersonByAccount(account);
        return person.getPhoto_url();
    }

    @Override
    public String getInit(String account) {
        IPersonService personService=new PersonServiceImpl();
        Person person=personMapper.queryPersonByAccount(account);
        JSONObject rs=new JSONObject();
        Map<String,Object> data=new HashMap<>();
       //设置自己的相关信息
        JSONObject mine=new JSONObject();
        mine=personService.setInfo(person);
        mine.put("status","online");
        data.put("mine",mine);

        //设置所有人的列表信息
        JSONObject friend=new JSONObject();
        List<Map<String,Object>> friendlist=new ArrayList<>();
        friend.put("groupname","所有人");
        friend.put("id",1);
        List<Person> list=personMapper.queryAllPerson();//获得所有人
        Map<String, WebSocketSession> m=socketHandler.userMap;//获得所有在线人
        for(Person p:list){
            if(!p.getAccount().equals(account)){//排除掉本人信息
                Map<String,Object> f=personService.setInfo(p);
                if(m.get(person.getAccount())!=null){
                    f.put("status","online");
                }else{
                    f.put("status","offline");
                }
                friendlist.add(f);
            }
        }
        friend.put("list",friendlist);
        data.put("friend",friend);

        Map<String,Object> group=new HashMap<>();
        group.put("groupname","测试群");
        group.put("id","12");
        group.put("avatar","//tva1.sinaimg.cn/crop.0.0.200.200.50/006q8Q6bjw8f20zsdem2mj305k05kdfw.jpg");
        data.put("group",group);
        rs.put("code",0);
        rs.put("msg","");
        rs.put("data",data);
        System.out.println("---"+JSON.toJSONString(rs));

        return JSON.toJSONString(rs);
    }

    /**
     * 获得当前在线的所有人
     * @return
     */
    @Override
    public String getOnline() {
        return JSON.toJSONString(socketHandler.userMap);

    }

    /**
     *设置个人通讯信息
     * @param person
     * @return
     */
    @Override
    public JSONObject setInfo(Person person) {
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("username",person.getName());
        jsonObject.put("id",person.getAccount());
        jsonObject.put("sign",person.getNote());
        if(person.getPhoto_url()==null||person.getPhoto_url().equals("")){
            jsonObject.put("avatar","//t.cn/RCzsdCq");
        }else{
            jsonObject.put("avatar",person.getPhoto_url());
        }
        return jsonObject;
    }

    /**
     * 查询所有个人信息
     * @return
     */
    @Override
    public ResultMap<List<Person>> getAllPerson() {
        List<Person> list=personMapper.queryAllPerson();
        Integer count=personMapper.queryPersonCount();
        return new ResultMap<List<Person>>("",list,0,count);
    }

    /**
     * 根据账号删除个人信息
     * @param account
     * @return
     */
    @Transactional
    @Override
    public String delPerson(String account) {
        JSONObject rs=new JSONObject();
        if(personMapper.delPerson(account)>0){
            if(userMapper.delUser(account)>0){
                rs.put("success",true);
                rs.put("msg","");
            }else{
                rs.put("success",false);
                rs.put("msg","users数据库更新失败！");
            }
        }else{
            rs.put("success",false);
            rs.put("msg","persons数据库更新失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 根据账号查询个人信息
     * @param account
     * @return
     */
    @Override
    public String findPersonByAccount(String account) {
        Person person= personMapper.queryPersonByAccount(account);
        return JSON.toJSONString(person);
    }

    /**
     * 更新个人信息
     * @param person
     * @return
     */
    @Override
    public String updatePerson(Person person) {
        JSONObject resultMap=new JSONObject();
        if(personMapper.updatePerson(person)>0){
            resultMap.put("state","200");
            resultMap.put("message","个人资料更新成功！");
        }else{
            resultMap.put("state","500");
            resultMap.put("message","更新失败！请重试");
        }
        return JSON.toJSONString(resultMap);
    }

    /**
     * 新增用户
     * @param person
     * @param password
     * @return
     */
    @Transactional
    @Override
    public String addPerson(Person person, String password) {
        JSONObject rs=new JSONObject();
        User user=new User();
        user.setAccount(person.getAccount());
        user.setPassword(password);
        user.setIsAdmin(0);
        if(userMapper.insertUser(user)>0){
            if(personMapper.insertPerson(person)>0){
                rs.put("success",true);
                rs.put("msg","");
            }else{
                rs.put("success",false);
                rs.put("msg","persons数据库更新失败！");
            }
        }else{
            rs.put("success",false);
            rs.put("msg","users数据库更新失败！");
        }
        return JSON.toJSONString(rs);
    }


}
