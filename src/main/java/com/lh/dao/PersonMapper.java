package com.lh.dao;

import com.lh.model.Person;

import java.util.List;

public interface PersonMapper {

     Integer insertPerson(Person person);

     Person queryPersonByAccount(String account);

     List<Person> queryAllPerson();

     Integer queryPersonCount();

     Integer updatePerson(Person person);

     Integer delPerson(String account);

}
