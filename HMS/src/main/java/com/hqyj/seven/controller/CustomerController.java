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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    CustomerService customerService;

    //查询所有客户
    @RequestMapping("/getAllCus")
    @ResponseBody
    public Map<String,Object> getAllCus(@RequestParam("page") Integer pageNumber, @RequestParam("limit")Integer pageSize){
        int number;
        int size;
        if (pageNumber == null){
            number = 1;
        }else {
            number = pageNumber;
        }
        if (pageSize == null){
            size = 10;
        }else {
            size = pageSize;
        }
        PageData<Customer> customerList = customerService.queryAll(number,size);
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


    //根据姓名、身份证号码、座机号码、手机号码查询客户
    @RequestMapping("/getOneCus")
    @ResponseBody
    public Map<String,Object> getOneCus(String name){
        Map<String,Object> customer = new HashMap<>();
        if (name==null){
            customer.put("code",-9);
            customer.put("msg","查询参数不为空");
        } else {
            List<Customer> customerList = customerService.queryByCusName(name);
            if (customerList.size() == 0) {
                customer.put("code", -1);
                customer.put("msg", "客户不存在");
            } else {
                customer.put("code", 0);
                customer.put("msg", "查询成功");
                customer.put("data", customerList);
            }
        }
        return customer;
    }

    //更新客户信息
    @RequestMapping("/updateOneCus")
    @ResponseBody
    public  Map<String,Object> updateOneCus(Customer customer){
         int customernum = customerService.updataOneCus(customer);
        Map<String,Object> customermap = new HashMap<>();
        if (customernum == 0){
            customermap.put("code",-1);
            customermap.put("message","修改失败！");
        }else {
            customermap.put("code",200);
            customermap.put("message","修改成功！");
        }
        return customermap;
    }

    //添加客户信息
    @RequestMapping("/insertOneCus")
    @ResponseBody
    public  Map<String,Object> insertOneCus(Customer customer){
        int customernum = customerService.insertOneCus(customer);
        Map<String,Object> customermap = new HashMap<>();
        if (customernum == 0){
            customermap.put("code",-1);
            customermap.put("message","添加失败！");
        }else {
            customermap.put("code",200);
            customermap.put("message","添加成功！");
        }
        return customermap;
    }

    //删除客户
    @RequestMapping("/deleteOneCus")
    @ResponseBody
    public Map<String,Object> deleteOneCus(int customer_id){
        Map<String,Object> customerMap =  new HashMap<>();
        int num = customerService.deleteOneCus(customer_id);
        if (num==0){
            customerMap.put("code",-1);
            customerMap.put("message","删除失败!");
        }else {
            customerMap.put("code",200);
            customerMap.put("message","删除成功!");
        }
        return customerMap;
    }
    //查询客户住宿状态
    @RequestMapping("/queryOneState")
    @ResponseBody
    public  Map<String,Object> queryOneState(int customer_id){
        Map<String,Object> customerMap =  new HashMap<>();
        List<House> houseList = customerService.queryState(customer_id);
        if (houseList == null){
            customerMap.put("code",-1);
            customerMap.put("message","没有相关住宿信息");
        }else {
            customerMap.put("code",1);
            customerMap.put("message",houseList);
        }
        return customerMap;
    }
}
