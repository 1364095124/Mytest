package com.lh.service;

import com.alibaba.fastjson.JSONObject;
import com.lh.model.Person;

public interface IPersonService {

    String getUserAvatar(String account);

    String getInit(String account);

    String getOnline();

    JSONObject setInfo(Person person);


}
