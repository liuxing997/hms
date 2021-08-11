package com.hqyj.seven.service.impl;

import com.hqyj.seven.pojo.User;
import com.hqyj.seven.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserServiceImplTest {
   @Autowired
    UserServiceImpl userService;
    @Test
    public void getOneByUsernameTest(){
        String  name = "admin";
        User user=userService.getOneByUsername(name);
        System.out.println(user);


    }

}