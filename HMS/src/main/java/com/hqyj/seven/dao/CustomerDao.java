package com.hqyj.seven.dao;

import com.hqyj.seven.pojo.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerDao {
    List<Customer> queryAll();
    int updataByCustomerIdToremainder(@Param("money") double money, @Param("id") int id);
}
