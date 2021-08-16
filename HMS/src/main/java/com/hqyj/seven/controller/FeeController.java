package com.hqyj.seven.controller;
import com.hqyj.seven.pojo.*;
import com.hqyj.seven.service.EnterService;
import com.hqyj.seven.service.FeeService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
@RequestMapping("/fee")
public class FeeController {
    private FeeService feeService;

    @Autowired
    public void setFeeService(FeeService feeService) {
        this.feeService = feeService;
    }
    //查询所有已缴费信息
    @RequestMapping("/queryByDirectPay")
    @ResponseBody
    public Map<String,Object> queryByDirectPay(@RequestParam("page") Integer pageNumber, @RequestParam("limit")Integer pageSize) {
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
        //添加分页功能
        PageData<Fee> feeList =feeService.queryByDirectPay(number,size);
        Map<String,Object> fee =  new HashMap<>();
        if (feeList == null){
            fee.put("code",-1);
            fee.put("msg","没有客房信息");
        }else {
           fee.put("code", 0);
            fee.put("data", feeList);
            fee.put("msg","获取数据成功！");
        }
        Session session= SecurityUtils.getSubject().getSession();
        session.setAttribute("feelist",feeList);
        return fee;
    }
    //查询所有未缴费信息
    @RequestMapping("/queryByDirectNoPay")
    @ResponseBody
    public Map<String,Object> queryByDirectNoPay(@RequestParam("page") Integer pageNumber, @RequestParam("limit")Integer pageSize) {
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
        //添加分页功能
        PageData<Fee> feeList =feeService.queryByDirectNoPay(number,size);
        Map<String,Object> fee =  new HashMap<>();
        if (feeList == null){
            fee.put("code",-1);
            fee.put("msg","没有客房信息");
        }else {
            fee.put("code", 0);
           fee.put("data", feeList);
            fee.put("msg","获取数据成功！");
        }
        Session session= SecurityUtils.getSubject().getSession();
        session.setAttribute("feelist",feeList);
        return fee;
    }
    //缴费查询
    @RequestMapping("/queryOneByIdPay")
    @ResponseBody
    public  Map<String,Object> queryOneByIdPay(@RequestParam("page") Integer pageNumber, @RequestParam("limit")Integer pageSize,int id){
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
        //添加分页功能
        PageData<Fee> feeList =feeService.queryAllId(number,size,id,"缴费");
        Map<String,Object> fee =  new HashMap<>();
        if (feeList == null){
            fee.put("code",-1);
            fee.put("msg","没有缴费信息");
        }else {
            fee.put("code", 0);
            fee.put("data", feeList);
            fee.put("msg","获取数据成功！");
        }
        Session session= SecurityUtils.getSubject().getSession();
        session.setAttribute("feelist",feeList);
        return fee;
    }
    //未缴费查询
    @RequestMapping("/queryOneByIdNoPay")
    @ResponseBody
    public  Map<String,Object> queryOneByIdNoPay(@RequestParam("page") Integer pageNumber, @RequestParam("limit")Integer pageSize,int id){
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
        //添加分页功能
        PageData<Fee> feeList =feeService.queryAllId(number,size,id,"未缴费");
        Map<String,Object> fee =  new HashMap<>();
        if (feeList == null){
            fee.put("code",-1);
            fee.put("msg","没有缴费信息");
        }else {
            fee.put("code", 0);
            fee.put("data", feeList);
            fee.put("msg","获取数据成功！");
        }
        Session session= SecurityUtils.getSubject().getSession();
        session.setAttribute("feelist",feeList);
        return fee;
    }
}
