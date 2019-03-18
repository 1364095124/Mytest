package com.lh.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.lh.dao.SignMapper;
import com.lh.model.Memo;
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
        return n;
    }

    @Override
    public String addMemo(Memo memo) {
        JSONObject result=new JSONObject();
        if(signMapper.addMemo(memo)>0){
            result.put("success",true);
            result.put("msg","新增备忘录成功");
        }else{
            result.put("success",false);
            result.put("msg","新增备忘录失败");
        }
        return JSON.toJSONString(result);
    }

    @Override
    public String queryMemo(String account, String keyWord,String isNew) {
        List<Memo> list=new ArrayList<>();
        if(isNew.equals("1")){
            list=signMapper.queryNewMemo(account,keyWord);
        }else if(isNew.equals("0")){
            list=signMapper.queryOldMemo(account,keyWord);
        }
        return JSON.toJSONString(list);
    }

    @Override
    public String updateMemo(Memo memo) {
        JSONObject result=new JSONObject();
        if(signMapper.updateMemo(memo)>0){
            result.put("success",true);
            result.put("msg","修改备忘录成功");
        }else{
            result.put("success",false);
            result.put("msg","修改备忘录失败");
        }
        return JSON.toJSONString(result);
    }

    @Override
    public String deleteMemo(String id) {
        JSONObject result=new JSONObject();
        if(signMapper.deleteMemo(id)>0){
            result.put("success",true);
            result.put("msg","删除备忘录成功");
        }else{
            result.put("success",false);
            result.put("msg","删除备忘录失败");
        }
        return JSON.toJSONString(result);
    }
}
