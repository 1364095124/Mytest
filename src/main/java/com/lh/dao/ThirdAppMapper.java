package com.lh.dao;

import com.lh.model.ThirdApp;
import com.lh.model.ThirdAppMsg;
import com.lh.model.ThirdAppPending;
import com.lh.model.ThirdAppSso;

import java.util.List;
import java.util.Map;

public interface ThirdAppMapper {
    /*
    @Param ThirdApp 第三方应用信息
    新增一个第三方应用信息
     */
    public int insert(ThirdApp thirdApp);

    /*
    @Param ThirdApp 第三方应用信息
    查询特定的第三方应用信息
     */
    public List<ThirdApp> select(ThirdApp thirdApp);

    /*
    @Param String Number 第三方应用注册编码
    删除第三方应用信息
     */
    public int deleteThirdApp(String number);

    /*
    得到最新可用的编码
     */
    public Integer getNewNumber();

    /*
    @Param ThirdAppSso thirdAppSso
    新增一条单点登陆信息
     */
    public int insertSso(ThirdAppSso thirdAppSso);

    /*
    @Param ThirdAppSso thirdAppSso
    查询单点登陆的信息
     */
    public List<ThirdAppSso> selectSso(ThirdAppSso thirdAppSso);

    /*
    @Param ThirdAppSso thirdAppSso
    修改单点登陆的信息
     */
    public int updateSso(ThirdAppSso thirdAppSso);

    /*
    @Param String thirdAppnumber 第三方系统注册编码
    删除单点登陆的配置信息
     */
    public int deleteSso(String thirdAppnumber);

    /*
    查询没有绑定过单点登陆地址的应用编号
     */
    public List<Integer> selectAvaliNumber();

    /*
    查询没有绑定过消息集成的应用信息
     */
    public List<ThirdApp> selectAvaliMsg();

    /*
    @Param ThirdAppMsg thirdAppMsg
    插入一条消息集成的配置信息
     */
    public int insertMsg(ThirdAppMsg thirdAppMsg);

    /*
    @Param ThirdAppMsg thirdAppMsg
     修改消息集成的配置信息
     */
    public int updateMsg(ThirdAppMsg thirdAppMsg);

    /*
    @Param String thirdappnumber 第三方系统注册编码
    删除消息集成的配置信息
     */
    public int deleteMsg(String thirdappnumber);
    /*
    @Param thirdAppMsg
    查询消息集成配置信息
     */
    public List<Map<String,Object>> queryThirdMsg(ThirdAppMsg thirdAppMsg);

    /*
    @Param thirdAppPending
    查询代办集成配置信息
     */

    public List<ThirdAppPending> queryThirdPending(ThirdAppPending thirdAppPending);

    /*
    @Param ThirdAppPending thirdAppPending
    新增一条代办集成配置信息
     */
    public int addThirdPending(ThirdAppPending thirdAppPending);

    /*
    @Param ThirdAppPending thirdAppPending
    修改一条代办集成的配置信息
     */
    public int updateThirdPending(ThirdAppPending thirdAppPending);

    /*
    @Param String thirdAppNumber 第三方系统注册编码
     删除第三方代办集成配置信息
     */
    public int deleteThirdPending(String thirdappnumber);


    //查询未配置过消息集成的应用信息
    public List<ThirdApp> selectUnRegisterMsg();

    //查询未配置过代办集成的应用信息
    public List<ThirdApp> selectUnRegisterPending();
}
