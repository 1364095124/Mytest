package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.dao.SignMapper;
import com.lh.model.Sign;
import com.lh.model.User;
import com.lh.service.ISignService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("signService")
public class SignServiceImpl implements ISignService {

    @Autowired
    private SignMapper signMapper;

    @Override
    public String doSign(Sign sign) {
        System.out.println("----sign"+ JSON.toJSONString(sign));
        SimpleDateFormat fm=new SimpleDateFormat("yyyy-MM-dd");
        sign.setSignTime(fm.format(new Date()));
        JSONObject result=new JSONObject();
        if(signMapper.addSign(sign)>0){
            result.put("success",true);
            result.put("msg","签到成功!");
        }else{
            result.put("success",false);
            result.put("msg","签到失败!");
        }

        return JSONObject.toJSONString(result);
    }

    @Override
    public String querySign(String account) {
        Sign sign=new Sign();
        sign.setAccount(account);
        List<Sign> list=signMapper.querySign(sign);
        List<String> l=new ArrayList<>();
        for(int n=0;n<list.size();n++){
            l.add(list.get(n).getSignTime());
        }
        return JSONObject.toJSONString(l);
    }

    @Override
    public Integer checkSign(String account) {
        Sign sign=new Sign();
        SimpleDateFormat fm=new SimpleDateFormat("yyyy-MM-dd");
        sign.setSignTime(fm.format(new Date()));
        sign.setAccount(account);
        int n=0;
        List<Sign> list=signMapper.querySign(sign);
        if(list!=null&&!list.isEmpty()){
            n=1;
        }
        System.out.println("-----n"+n);
        return n;
    }
}
