package com.hqyj.seven.service.impl;

import com.hqyj.seven.dao.CustomerDao;
import com.hqyj.seven.pojo.Customer;
import com.hqyj.seven.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDao customerDao;
    @Override
    public int updateByNameToRemainder(double money, int id) {
        return customerDao.updataByCustomerIdToremainder(money,id);
    }
    //按用户id查找信息
    @Override
    public Customer queryById(int customerId) {
        return customerDao.queryByCustomer(customerId);
    }
}
