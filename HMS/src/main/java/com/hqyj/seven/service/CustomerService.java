package com.hqyj.seven.service;

import com.hqyj.seven.pojo.Customer;

import java.util.List;

public interface CustomerService {
    //住房更新金额
    int updateByNameToRemainder(double money, int id);
    //按id查找用户
    Customer queryById(int customerId);
    //查询所有客户信息
    List<Customer> queryAll();

    //根据用户名查询用户的信息
    List<Customer> queryByCusName(String name);

}
