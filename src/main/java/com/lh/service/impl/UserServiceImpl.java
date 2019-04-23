package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.common.EmailUtils;
import com.lh.common.JedisUtils;
import com.lh.dao.PersonMapper;
import com.lh.dao.UserMapper;
import com.lh.model.*;
import com.lh.service.IUserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.*;

@Service("userService")
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PersonMapper personMapper;

    /**
     * 登陆验证
     * @param account
     * @param password
     * @return
     */
    @Override
    public List<User> login(String account, String password) {
        User user=new User();
        user.setAccount(account);
        user.setPassword(password);

        return userMapper.login(user);
    }

    /**
     * 启用/禁用账号
     * @param account
     * @param isDisabled
     * @return
     */
    @Override
    public String updateIsDisabled(String account, Integer isDisabled) {
        JSONObject rs=new JSONObject();
        if(userMapper.updateIsDisabled(account,isDisabled)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","更新数据库失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 查询指定账号信息
     * @param user
     * @return
     */
    @Override
    public User selectUser(User user) {
        return userMapper.selectUser(user);
    }

    /**
     * 获取验证码
     * @param account
     * @return
     */
    @Override
    public String getCode(String account) {
        JSONObject resultMap=new JSONObject();
        Person person =personMapper.queryPersonByAccount(account);
        System.out.println("----person:"+person);
        if(person!=null){
            String code=EmailUtils.produceCode();
            JedisUtils.setex(account+"code",60*3,code);
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
                resultMap.put("success",true);
                resultMap.put("msg","");
            } catch (Exception e) {
                e.printStackTrace();
                resultMap.put("success",false);
                resultMap.put("msg","发送验证码失败,请重试！");
            }finally{
                return JSON.toJSONString(resultMap);
            }
        }else{
            resultMap.put("success",false);
            resultMap.put("msg","账号不存在!");
            return JSON.toJSONString(resultMap);
        }


    }

    /**
     * 检查验证码
     * @param code
     * @param account
     * @return
     */
    @Override
    public String checkCode(String code, String account) {
        JSONObject resultMap=new JSONObject();

        if(JedisUtils.isExist(account+"code")){
            if(code!=null&&code!=""){
                if(JedisUtils.get(account+"code").equals(code)){

                    User user=new User();
                    user.setAccount(account);
                    User user0=userMapper.selectUser(user);

                    resultMap.put("success",true);
                    resultMap.put("msg",user0.getPassword());
                    JedisUtils.del(account+"code");
                }else{
                    resultMap.put("success",false);
                    resultMap.put("msg","验证码错误！");
                }
            }
        }else{
            resultMap.put("state","400");
            resultMap.put("message","验证码不存在或已经失效，请重新获取！");
        }

        return JSON.toJSONString(resultMap);
    }



    /**
     * 更新账号密码
     * @param user
     * @return
     */
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




    /**
     * 根据账号查询权限信息
     * @param account
     * @return
     */
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

    /**
     * 获取所有账号信息
     * @return
     */
    @Override
    public ResultMap<List<User>> getAllUser() {
        List<User> list=userMapper.getAllUser();
        Integer count=userMapper.queryUserCount();
        return new ResultMap<List<User>>("",list,0,count);
    }

    /**
     * 得到所有异常信息
     * @return
     */
    @Override
    public ResultMap<List<ErrorUser>> getAllErrUser() {
        List<ErrorUser> list=userMapper.getAllErrUser();
        Integer count=userMapper.queryErrUserCount();
        return new ResultMap<List<ErrorUser>>("",list,0,count);
    }



    /**
     * 新增异常信息
     * @param errorUser
     * @return
     */
    @Override
    public String addErrUser(ErrorUser errorUser) {
        JSONObject rs=new JSONObject();
        if(userMapper.addErrUser(errorUser)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","数据库更新失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 根据id删除异常信息
     * @param id
     * @return
     */
    @Override
    public String delErrUser(String id) {
        JSONObject rs=new JSONObject();
        if(userMapper.delErrUser(id)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","数据库更新失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     *获取token身份令牌
     * @param rest
     * @return
     */
    @Override
    public String getToken(Rest rest) {
        JSONObject rs=new JSONObject();
        if(userMapper.getRest(rest)>0){
            UUID uuid = UUID.randomUUID();
            JedisUtils.setex("tokenId",1000*60*15,String.valueOf(uuid));
            rs.put("success",true);
            rs.put("msg",String.valueOf(uuid));
        }else{
            rs.put("success",false);
            rs.put("msg","账号密码错误，身份验证失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 获取ticket信息
     * @return
     */
    @Override
    public String getTicket() {
        JSONObject rs=new JSONObject();
        User user=(User) SecurityUtils.getSubject().getPrincipal();
        UUID uuid = UUID.randomUUID();
        JedisUtils.setex("ticket",1000*60*15,String.valueOf(uuid)+"_"+user.getAccount());
        return JSON.toJSONString(rs);
    }

    /**
     * 根据ticket获取用户身份
     * @param tokenId
     * @param ticket
     * @return
     */
    @Override
    public String getPersonByTicket(String tokenId, String ticket) {
        JSONObject rs=new JSONObject();
        String tokenId0=JedisUtils.get("tokenId");
        if(null==tokenId0){
            rs.put("success",false);
            rs.put("msg","token信息失效！");
        }else{
            String ticket0=JedisUtils.get("ticket");
            if(null==ticket){
                rs.put("success",false);
                rs.put("msg","ticketId信息失效！");
            }else{
                String ticket1=tokenId0.substring(0,ticket0.lastIndexOf("_"));
                String account=tokenId0.substring(ticket0.lastIndexOf("_")+1);
                if(ticket.equals(ticket1)&&tokenId.equals(tokenId0)){
                    Person person=personMapper.queryPersonByAccount(account);
                    rs.put("success",true);
                    rs.put("msg",JSON.toJSONString(person));
                }else{
                    rs.put("success",false);
                    rs.put("msg","身份验证失败！");
                }
            }
        }
        return JSON.toJSONString(rs);
    }


}
