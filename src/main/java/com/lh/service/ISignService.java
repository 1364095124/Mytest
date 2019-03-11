package com.lh.service;

import com.lh.model.Sign;

public interface ISignService {

    String doSign(Sign sign);

    String querySign(String account);

    Integer checkSign(String account);
}
