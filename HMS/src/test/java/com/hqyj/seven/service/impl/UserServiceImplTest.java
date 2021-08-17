package com.hqyj.seven.service.impl;

import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.User;
import com.hqyj.seven.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserServiceImplTest {
   @Autowired
    UserServiceImpl userService;
   @Autowired
   HouseServiceImpl houseService;
   @Autowired
   EnterServiceImpl enterService;
    @Test
    public void getOneByUsernameTest(){
        Enter enter = enterService.queryByOutTradeNo("202181719193372");
        System.out.println(enter);
    }

}