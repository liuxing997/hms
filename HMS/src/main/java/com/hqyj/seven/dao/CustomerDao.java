package com.hqyj.seven.dao;

import com.hqyj.seven.pojo.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerDao {

    int updataByCustomerIdToremainder(@Param("money") double money, @Param("id") int id);
    Customer queryByCustomer(int CustomerId);
    //获取全部客户信息
    List<Customer> queryAll();

    //根据用户名查询用户的信息
    List<Customer> queryByCusName(String name);
}
