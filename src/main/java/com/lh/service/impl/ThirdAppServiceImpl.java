package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.dao.ThirdAppMapper;
import com.lh.model.ThirdApp;
import com.lh.model.ThirdAppMsg;
import com.lh.model.ThirdAppPending;
import com.lh.model.ThirdAppSso;
import com.lh.service.IThirdAppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("thirdAppService")
public class ThirdAppServiceImpl implements IThirdAppService {

    @Autowired
    private ThirdAppMapper thirdAppMapper;

    @Override
    public int insertThirdApps(ThirdApp thirdApp) {
        int i=0;
        List<ThirdApp> list=thirdAppMapper.select(thirdApp);

        if(list!=null&&!list.isEmpty()){
            i=-1;
        }else{
            i=thirdAppMapper.insert(thirdApp);
        }
        return i;
    }

    @Override
    public String selectThirdApps(ThirdApp thirdApp) {
        List<ThirdApp> list=thirdAppMapper.select(thirdApp);
        return JSON.toJSONString(list);
    }

    @Override
    public String getAvaliNumber() {
        List<Integer> list=thirdAppMapper.selectAvaliNumber();
        return JSON.toJSONString(list);
    }

    @Override
    public Integer getNewNumber() {
        Integer n=thirdAppMapper.getNewNumber();
        if(n==null){
            n=new Integer(3000);
        }
        return n;
    }

    @Override
    public int insertSso(ThirdAppSso thirdAppSso) {
        int n=0;
        List<ThirdAppSso> list=thirdAppMapper.selectSso(thirdAppSso);
        if(list!=null&&!list.isEmpty()){
            n=-1;
        }else{
            n=thirdAppMapper.insertSso(thirdAppSso);
        }
        return n;
    }

    @Override
    public String selectSso(ThirdAppSso thirdAppSso) {
        List<ThirdAppSso> list=thirdAppMapper.selectSso(thirdAppSso);
        return JSON.toJSONString(list);
    }

    @Override
    public int updateSso(ThirdAppSso thirdAppSso) {

        return thirdAppMapper.updateSso(thirdAppSso);
    }

    @Override
    public String addMsg(ThirdAppMsg thirdAppMsg) {
        JSONObject resultMap=new JSONObject();
         int flag=thirdAppMapper.insertMsg(thirdAppMsg);
         if(flag>0){
             resultMap.put("success","true");
             resultMap.put("message","成功");
         }else{
             resultMap.put("success","flase");
             resultMap.put("message","新增失败，请重试！");
         }
         return resultMap.toJSONString();
    }

    @Transactional
    @Override
    public int deleteThirdApp(String thirdAppNumber) {
        int n=0;
        if(thirdAppMapper.deleteSso(thirdAppNumber)>0){
            if(thirdAppMapper.deleteMsg(thirdAppNumber)>0){
                if(thirdAppMapper.deleteThirdPending(thirdAppNumber)>0){
                    if(thirdAppMapper.deleteThirdApp(thirdAppNumber)>0){
                        n=1;
                    }
                }
            }
        }
        return n;
    }

    @Override
    public String addPending(ThirdAppPending thirdAppPending) {
        JSONObject resultMap=new JSONObject();
        if(thirdAppMapper.addThirdPending(thirdAppPending)>0){
            resultMap.put("success","true");
            resultMap.put("message","成功");
        }else{
            resultMap.put("success","false");
            resultMap.put("message","失败，请重试！");
        }
        return resultMap.toJSONString();
    }

    @Override
    public String selectUnRegisterMsg() {
        List<ThirdApp> list=thirdAppMapper.selectUnRegisterMsg();
        return JSON.toJSONString(list);
    }

    @Override
    public String selectUnRegisterPending() {
        List<ThirdApp> list=thirdAppMapper.selectUnRegisterPending();
        return JSON.toJSONString(list);
    }


}
