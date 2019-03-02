package com.lh.service;

import com.lh.model.ThirdApp;
import com.lh.model.ThirdAppMsg;
import com.lh.model.ThirdAppPending;
import com.lh.model.ThirdAppSso;

import java.util.List;

public interface IThirdAppService {

    /*
    @Param ThirdApp 第三方应用信息
     新增一个新的第三方应用信息
     */
    public int insertThirdApps(ThirdApp thirdApp);

    /*
    @Param ThirdApp 第三方应用信息
    查询第三方应用信息
     */
    public String selectThirdApps(ThirdApp thirdApp);

    /*
    得到最新可用的应用编码
     */
    public Integer getNewNumber();

    /*
    得到没有绑定过url的应用编码
     */
    public String getAvaliNumber();

    /*
    @Param ThirdAppSso thirdAppSso
    新增一个单点登陆信息
     */
    public int insertSso(ThirdAppSso thirdAppSso);

    /*
    @Param ThirdAppSso thirdAppSso
    查询单点登陆的信息
     */
    public String selectSso(ThirdAppSso thirdAppSso);

    /*
    @Param ThirdAppSso thirdAppSso
    修改单点登陆的信息
     */
    public int updateSso(ThirdAppSso thirdAppSso);

    /*
    @Param ThirdAppMsg thirdAppMsg
    新增一条消息集成配置信息
     */
    public String addMsg(ThirdAppMsg thirdAppMsg);

    /*
    @Param String thirdAppNumber 第三方注册应用的编码
     删除第三方配置的所有信息
     */
    public int deleteThirdApp(String thirdAppNumber);

    /*
    @Param ThirdAppPending thirdAppPending
    新增一条代表那集成配置信息
     */
    public String addPending(ThirdAppPending thirdAppPending);

    //查询未配置过第三方消息集成的应用信息
    public String selectUnRegisterMsg();

    //查询未配置过第三方代办集成的应用信息
    public String selectUnRegisterPending();
}
