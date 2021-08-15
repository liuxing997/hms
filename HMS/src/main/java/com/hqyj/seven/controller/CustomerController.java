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
            customer.put("msg","没有客户信息");
        }else {
            customer.put("code", 0);
            customer.put("data", customerList);
            customer.put("msg","获取数据成功！");
        }
        Session session= SecurityUtils.getSubject().getSession();
        session.setAttribute("customerList",customerList);
        return customer;
    }


    @RequestMapping("/getonecus")
    @ResponseBody
    public Map<String,Object> getonecus(String name){
        Map<String,Object> customer = new HashMap<>();
        if (name==null){
            customer.put("code",-1);
            customer.put("message","查询名不为空");
        } else {
            List<Customer> customerList = customerService.queryByCusName(name);
            if (customerList == null) {
                customer.put("code", 0);
                customer.put("massage", "没有查询到姓名为" + name + "的客户信息");
            } else {
                customer.put("code", 1);
                customer.put("message", "查询成功");
                customer.put("data", customerList);
            }
        }
        return customer;
    }
    @RequestMapping("/updateonecus")
    @ResponseBody
    public  Map<String,Object> updateonecus(Customer customer){
         int customernum = customerService.updataOneCus(customer);
        Map<String,Object> customermap = new HashMap<>();
        if (customernum == 0){
            customermap.put("code",-1);
            customermap.put("message","修改失败");
        }else {
            customermap.put("code",200);
            customermap.put("message","修改成功");
        }
        return customermap;
    }
    @RequestMapping("/insertonecus")
    @ResponseBody
    public  Map<String,Object> insertonecus(Customer customer){
        int customernum = customerService.insertOneCus(customer);
        Map<String,Object> customermap = new HashMap<>();
        if (customernum == 0){
            customermap.put("code",-1);
            customermap.put("message","插入失败");
        }else {
            customermap.put("code",200);
            customermap.put("message","插入成功");
        }
        return customermap;
    }
    //客户信息的删除
    @RequestMapping("/deleteHouse")
    @ResponseBody
    public Map<String,Object> deleteHousei(int customer_id){
        Map<String,Object> customermap =  new HashMap<>();
        int num = customerService.deleteOneCus(customer_id);
        if (num==0){
            customermap.put("code",0);
            customermap.put("message","删除失败!");
        }else {
            customermap.put("code",200);
            customermap.put("message","删除成功!");
        }
        return customermap;
    }
}
