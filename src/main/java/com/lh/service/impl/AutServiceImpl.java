package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.dao.AutMapper;
import com.lh.model.Authorization;
import com.lh.model.ResultMap;
import com.lh.model.User;
import com.lh.service.IAutService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("autService")
public class AutServiceImpl implements IAutService {

    @Autowired
    private AutMapper autMapper;

    /**
     * 新增授权
     * @param authorization
     * @return
     */
    @Override
    public String addAut(Authorization authorization) {
        JSONObject rs=new JSONObject();
        if(autMapper.queryAut(authorization.getPermission(), authorization.getAccount())!=null){
            rs.put("success",false);
            rs.put("msg","新增数据重复！");
        }else{
            User user=(User) SecurityUtils.getSubject().getPrincipal();
            authorization.setCreateAccount(user.getAccount());
            if(autMapper.addAut(authorization)>0){
                rs.put("success",true);
                rs.put("msg","");
            }else{
                rs.put("success",false);
                rs.put("msg","新增失败！");
            }
        }

        return JSON.toJSONString(rs);
    }

    /**
     * 得到所有公告授权
     * @return
     */
    @Override
    public ResultMap<List<Authorization>> getAllNoticeAut() {
        List<Authorization> list=autMapper.getAllNoticeAut();
        Integer count=autMapper.queryNoticeAutCount();
        return new ResultMap<List<Authorization>>("",list,0,count);
    }

    /**
     * 查询所有会议授权记录
     * @return
     */
    @Override
    public ResultMap<List<Authorization>> getAllMettingAut() {
        List<Authorization> list=autMapper.getAllMettingAut();
        System.out.println("---list:"+JSON.toJSONString(list));
        Integer count=autMapper.queryMettingAutCount();
        return new ResultMap<List<Authorization>>("",list,0,count);
    }

    /**
     * 删除授权记录
     * @param id
     * @return
     */
    @Override
    public String delAut(String id) {
        JSONObject rs=new JSONObject();
        if(autMapper.delAut(id)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","删除授权信息失败！");
        }
        return JSONObject.toJSONString(rs);
    }


    /**
     * 查询当前用户是否有该权限
     * @param permission
     * @return
     */
    @Override
    public Integer queryAutByAccount(String permission) {
        User user=(User)SecurityUtils.getSubject().getPrincipal();
        if("公告管理".equals(permission)){
            return autMapper.queryNotAutByAccount(user.getAccount());
        }else if("会议管理".equals(permission)){
            return autMapper.queryMetAutByAccount(user.getAccount());
        }else{
            return 0;
        }

    }
}
