package com.lh.service;

import com.lh.model.*;


import java.util.List;
import java.util.Map;

public interface IUserService {

    public List<User> login(String account, String password);

    public String updateIsDisabled(String account,Integer isDisabled);

    public User selectUser(User user);

    public String getCode(String account);

    public String checkCode(String code,String account);



    public String updatePwd(User user);



    public Map<String,Object> queryPermissionByUser(String account);

    public ResultMap<List<User>> getAllUser();

    public ResultMap<List<ErrorUser>> getAllErrUser();


    public String addErrUser(ErrorUser errorUser);

    public String delErrUser(String id);

    String getToken(Rest rest);

    String getTicket();

    String getPersonByTicket(String tokenId,String ticket);


}
