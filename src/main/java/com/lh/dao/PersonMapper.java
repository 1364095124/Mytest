package com.lh.dao;

import com.lh.model.Person;

public interface PersonMapper {

    public Integer insertPerson(Person person);

    public Person queryPersonByAccount(String account);

    public Integer updatePerson(Person person);

    public Integer delPerson(String account);
}
