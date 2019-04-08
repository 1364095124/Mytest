package com.lh.dao;

import com.lh.model.Person;

import java.util.List;

public interface PersonMapper {

    public Integer insertPerson(Person person);

    public Person queryPersonByAccount(String account);

    public List<Person> queryAllPerson();

    public Integer queryPersonCount();

    public Integer updatePerson(Person person);

    public Integer delPerson(String account);
}
