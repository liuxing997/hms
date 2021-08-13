package com.hqyj.seven.service;

import com.hqyj.seven.pojo.Customer;

public interface CustomerService {
    //住房更新金额
    int updateByNameToRemainder(double money, int id);
    //按id查找用户
    Customer queryById(int customerId);
}
