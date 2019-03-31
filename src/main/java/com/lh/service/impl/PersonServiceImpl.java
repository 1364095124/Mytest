package com.lh.service.impl;


import com.lh.dao.PersonMapper;
import com.lh.model.Person;
import com.lh.service.IPersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("personService")
public class PersonServiceImpl implements IPersonService {

    @Autowired
    private PersonMapper personMapper;

    /**
     * 查询用户的头像
     * @param account
     * @return
     */
    @Override
    public String getUserAvatar(String account) {
        Person person=personMapper.queryPersonByAccount(account);
        return person.getPhoto_url();
    }
}
