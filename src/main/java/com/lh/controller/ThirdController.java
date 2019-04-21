package com.lh.controller;


import com.lh.model.ThirdApp;
import com.lh.model.ThirdAppMsg;
import com.lh.model.ThirdAppPending;
import com.lh.model.ThirdAppSso;
import com.lh.service.IThirdAppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ThirdController {

    @Autowired
    private IThirdAppService thirdAppService;

    //跳转到第三方应用注册界面
    @RequestMapping(value="/thirdApplication/thirdRegister")
    public String thirdApplication(){
        return "thirdSetting/thirdRegister";
    }

    /*
    响应ajax请求，得到最新可用的应用编号
     */
    @RequestMapping(value="/thirdApplication/thirdRegister/getNewNumber")
    @ResponseBody
    public Integer getNewNumber(){
        return thirdAppService.getNewNumber();
    }

    /*
    @Param ThirdApp thirdApp
    响应ajax请求，新增一个第三方应用信息
     */
    @RequestMapping(value="/thirdApplication/thirdRegister/insertThirdApp")
    @ResponseBody
    public Integer insertThirdApp(ThirdApp thirdApp){
        return thirdAppService.insertThirdApps(thirdApp);
    }

    /*
    @Param ThirdApp thirdApp
    响应ajax请求，得到查询的第三方应用信息
     */
    @RequestMapping(value="/thirdApplication/thirdRegister/getThirdApp")
    @ResponseBody
    public String getThirdApp(ThirdApp thirdApp){
        return thirdAppService.selectThirdApps(thirdApp);
    }

    //跳转到新增单点登陆页面
    @RequestMapping(value="/thirdApplication/thirdAppSso")
    public String thirdAppSso(){
        return "thirdSetting/thirdAppSso";
    }

    /*
    得到没有绑定过url的应用编码
     */
    @RequestMapping(value="/thirdApplication/thirdAppSso/getAvaliNumber")
    @ResponseBody
    public String getAvaliNumber(){
        return thirdAppService.getAvaliNumber();
    }

    /*
    @Param ThirdAppSso thirdAppSso
    响应ajax请求，新增一个单点登陆信息
     */
    @RequestMapping(value="/thirdApplication/thirdAppSso/insertSso")
    @ResponseBody
    public int insertSso(ThirdAppSso thirdAppSso){
        System.out.println("----controll"+thirdAppSso.getThirdAppNumber());
        return thirdAppService.insertSso(thirdAppSso);
    }

    /*
    @Param ThirdAppSso thirdAppSso
    响应ajax请求，查询单点登陆信息
     */
    @RequestMapping(value="/thirdApplication/thirdAppSso/selectSso")
    @ResponseBody
    public String selectSso(ThirdAppSso thirdAppSso){
        return thirdAppService.selectSso(thirdAppSso);
    }

    /*
     @Param ThirdAppSso thirdAppSso
     响应ajax请求，修改单点登陆信息
     */
    @RequestMapping(value="/thirdApplication/thirdAppSso/updateSso")
    @ResponseBody
    public int updateSso(ThirdAppSso thirdAppSso){
        return thirdAppService.updateSso(thirdAppSso);
    }

    //跳转到消息集成界面
    @RequestMapping(value="/thirdApplication/thirdAppMessage")
    public String thirdAppMessage(){
        return "thirdSetting/thirdMessage";
    }

    //跳转到代办集成界面
    @RequestMapping(value="/thirdApplication/thirdAppPending")
    public String thirdAppPending(){
        return "thirdSetting/thirdPending";
    }

    //跳转到第三方应用管理界面
    @RequestMapping(value="/thirdApplication/thirdManager")
    public String thirdManager(){
        return "thirdSetting/thirdManager";
    }

    /*
    @Param ThirdAppMsg thirdAppMsg
    新增一条第三方消息集成记录
     */
    @ResponseBody
    @RequestMapping(value="/thirdApplication/thirdAppMessage/registerMsg",
            produces ="text/plain;charset=UTF-8" )
    public String registerMsg(ThirdAppMsg thirdAppMsg){
        return thirdAppService.addMsg(thirdAppMsg);
    }

    /*
    @Param ThirdAppPending thirdAppPending
    新增一条第三方代办集成配置信息
     */
    @ResponseBody
    @RequestMapping(value="/thirdApplication/thirdAppPending/registerPending",
            produces ="text/plain;charset=UTF-8")
    public String registerPending(ThirdAppPending thirdAppPending){
        return thirdAppService.addPending(thirdAppPending);
    }

    //查询未绑定过第三方消息集成的应用信息
    @ResponseBody
    @RequestMapping(value="/thirdApplication/thirdAppMsg/selectUnRegisterMsg",
            produces ="text/plain;charset=UTF-8")
    public String selectUnRegisterMsg(){
        return thirdAppService.selectUnRegisterMsg();
    }

    //查询未绑定代办集成的应用信息
    @ResponseBody
    @RequestMapping(value="/thirdApplication/thirdAppPending/selectUnRegisterPending",
            produces ="text/plain;charset=UTF-8")
    public String selectUnRegisterPending(){
        return thirdAppService.selectUnRegisterPending();
    }



}
