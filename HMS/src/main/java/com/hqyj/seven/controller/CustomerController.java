package com.hqyj.seven.controller;

import com.hqyj.seven.pojo.Customer;
import com.hqyj.seven.pojo.House;
import com.hqyj.seven.pojo.PageData;
import com.hqyj.seven.service.CustomerService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    CustomerService customerService;
    @RequestMapping("/getallcus")
    @ResponseBody
    public Map<String,Object> getAllcus(){
        List<Customer> customerList = customerService.queryAll();
        Map<String,Object> customer =   new HashMap<>();
        if (customerList == null){
            customer.put("code",-1);
            customer.put("msg","没有客房信息");
        }else {
            customer.put("code", 0);
            customer.put("data", customerList);
            customer.put("msg","获取数据成功！");
        }
        Session session= SecurityUtils.getSubject().getSession();
        session.setAttribute("customerList",customerList);
        return customer;
    }
}
