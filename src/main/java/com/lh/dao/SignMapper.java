package com.lh.dao;

import com.lh.model.Sign;

import java.util.List;

public interface SignMapper {

    Integer addSign(Sign sign);

    List<Sign> querySign(Sign sign);


}
