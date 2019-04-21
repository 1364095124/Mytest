package com.lh.service;

import com.lh.model.Authorization;
import com.lh.model.ResultMap;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IAutService {

    String addAut(Authorization authorization);

    ResultMap<List<Authorization>> getAllNoticeAut();

    ResultMap<List<Authorization>> getAllMettingAut();

    String delAut(String id);



    Integer queryAutByAccount(String permission);
}
