package com.hqyj.seven.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.seven.dao.CustomerDao;
import com.hqyj.seven.pojo.Customer;
import com.hqyj.seven.pojo.PageData;
import com.hqyj.seven.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public PageData<Customer> queryAll(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        List<Customer> customerList = customerDao.queryAll();
        PageInfo<Customer> pageInfo = new PageInfo<>(customerList);
        PageData<Customer> pageData = new PageData<>();
        pageData.setCurrentPage(pageNumber);
        //设置每页数
        pageData.setPageSize(pageSize);
        //设置总页数
        pageData.setTotalPage(pageInfo.getPages());
        //设置总记录数
        pageData.setTotalSize((int) pageInfo.getTotal());
        if (pageInfo.isHasNextPage()){
            //有下一页 设置下一页页码
            pageData.setNextPage(pageInfo.getNextPage());
        }else {
            //没有下一页，设置尾页
            pageData.setNextPage(pageInfo.getPages());
        }
        if (pageInfo.isHasPreviousPage()){
            //有上一页 设置上一页页码
            pageData.setPreviousPage(pageInfo.getPrePage());
        }else {
            //没有上一页，设置首页
            pageData.setPreviousPage(1);
        }
        //设置用户信息
        pageData.setList(pageInfo.getList());
        return pageData;
    }

    @Override
    public List<Customer> queryByCusName(String name) {
        List<Customer> customerList = customerDao.queryByCusName(name);
        return customerList;
    }
    @Override
    public int updataOneCus(Customer customer) {
        int num = customerDao.updataOneCus(customer);
        return num;
    }

    @Override
    public int insertOneCus(Customer customer) {
        int num = customerDao.insertOneCus(customer);
        return num;
    }
    @Override
    public int deleteOneCus(int customer_id) {
        int num = customerDao.deleteOneCus(customer_id);
        return num;
    }

}
