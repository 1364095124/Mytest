package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.dao.NoticeMapper;
import com.lh.model.Metting;
import com.lh.model.Notice;
import com.lh.model.ResultMap;
import com.lh.model.User;
import com.lh.service.INoticeService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.java2d.pipe.SpanShapeRenderer;

import java.security.Security;
import java.text.SimpleDateFormat;
import java.util.List;

@Service("noticeService")
public class NoticeServiceImpl implements INoticeService {
    @Autowired
    private NoticeMapper noticeMapper;

    /**
     * 查询所有公告
     * @return
     */
    @Override
    public ResultMap<List<Notice>> getAllNotice() {
        List<Notice> list=noticeMapper.getAllNotice();
        Integer count=noticeMapper.queryNoticeCount();
        return new ResultMap<List<Notice>>("",list,0,count);
    }

    /**
     * 新增公告
     * @param notice
     * @return
     */
    @Override
    public String addNotice(Notice notice) {
        JSONObject rs=new JSONObject();
        if(noticeMapper.querySameNotice(notice)!=null){
            rs.put("success",false);
            rs.put("msg","新增公告重复，请重试！");
        }else{
            User user=(User) SecurityUtils.getSubject().getPrincipal();
            notice.setCreateAccount(user.getAccount());
            if(noticeMapper.addNotice(notice)>0){
                rs.put("success",true);
                rs.put("msg","");
            }else{
                rs.put("success",false);
                rs.put("msg","更新数据库失败！");
            }
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 删除公告
     * @param id
     * @return
     */
    @Override
    public String delNotice(String id) {
        JSONObject rs=new JSONObject();
        if(noticeMapper.delNotice(id)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","更新数据库失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 更新公告
     * @param notice
     * @return
     */
    @Override
    public String updateNotice(Notice notice) {
        JSONObject rs=new JSONObject();
        if(noticeMapper.updateNotice(notice)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","更新数据库失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 查询所有的会议
     * @return
     */
    @Override
    public ResultMap<List<Metting>> getAllMetting() {
        List<Metting> list=noticeMapper.getAllMetting();
        Integer count=noticeMapper.queryMettingCount();
        return new ResultMap<List<Metting>>("",list,0,count);
    }

    /**
     * 新增会议
     * @param metting
     * @return
     */
    @Override
    public String addMetting(Metting metting) {
        JSONObject rs=new JSONObject();
        if(noticeMapper.querySameMetting(metting)!=null) { //判断是否新增重复记录
            rs.put("success",false);
            rs.put("msg","新增会议重复！");
        }else{
            if(noticeMapper.queryMettingByAddress(metting.getAddress(),metting.getTiggerTime())!=null){ //判断会议室改时间是否已被预约
                rs.put("success",false);
                rs.put("msg","该时间场地的会议室已被预约！");
            }else{
                User user=(User)SecurityUtils.getSubject().getPrincipal();
                metting.setCreateAccount(user.getAccount());
                if(noticeMapper.addMetting(metting)>0){
                    rs.put("success",true);
                    rs.put("msg","");
                }else{
                    rs.put("success",false);
                    rs.put("msg","更新数据库失败！");
                }

            }
        }

        return JSON.toJSONString(rs);
    }

    /**
     * 删除会议记录
     * @param id
     * @return
     */
    @Override
    public String delMetting(String id) {
        JSONObject rs=new JSONObject();
        if(noticeMapper.delMetting(id)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","更新数据库失败！");
        }
        return JSON.toJSONString(rs);
    }

    /**
     * 更新会议
     * @param metting
     * @return
     */
    @Override
    public String updateMetting(Metting metting) {
        JSONObject rs=new JSONObject();
        if(noticeMapper.updateMetting(metting)>0){
            rs.put("success",true);
            rs.put("msg","");
        }else{
            rs.put("success",false);
            rs.put("msg","更新数据库！");
        }
        return JSON.toJSONString(rs);
    }
}
