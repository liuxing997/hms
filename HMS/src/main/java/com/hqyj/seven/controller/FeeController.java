package com.hqyj.seven.controller;

import com.hqyj.seven.pojo.Fee;
import com.hqyj.seven.pojo.PageData;
import com.hqyj.seven.service.FeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
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
    public Map<String, Object> queryByDirectPay(@RequestParam("page") Integer pageNumber, @RequestParam("limit") Integer pageSize) {
        int number;
        int size;
        if (pageNumber == null) {
            number = 1;
        } else {
            number = pageNumber;
        }
        if (pageSize == null) {
            size = 10;
        } else {
            size = pageSize;
        }
        //添加分页功能
        PageData<Fee> feeList = feeService.queryByDirectPay(number, size);
        Map<String, Object> fee = new HashMap<>();
        if (feeList.getList().size() == 0) {
            fee.put("code", -1);
            fee.put("msg", "没有已缴费信息!");
        } else {
            fee.put("code", 0);
            fee.put("data", feeList);
            fee.put("msg", "获取数据成功！");
        }
        return fee;
    }

    //查询所有未缴费信息
    @RequestMapping("/queryByDirectNoPay")
    @ResponseBody
    public Map<String, Object> queryByDirectNoPay(@RequestParam("page") Integer pageNumber, @RequestParam("limit") Integer pageSize) {
        int number;
        int size;
        if (pageNumber == null) {
            number = 1;
        } else {
            number = pageNumber;
        }
        if (pageSize == null) {
            size = 10;
        } else {
            size = pageSize;
        }
        //添加分页功能
        PageData<Fee> feeList = feeService.queryByDirectNoPay(number, size);
        Map<String, Object> fee = new HashMap<>();
        if (feeList.getList().size() == 0) {
            fee.put("code", -1);
            fee.put("msg", "没有未缴费信息！");
            fee.put("data",feeList);
        } else {
            fee.put("code", 0);
            fee.put("data", feeList);
            fee.put("msg", "获取数据成功！");
        }
        return fee;
    }

    //缴费查询
    @RequestMapping("/queryOneByIdPay")
    @ResponseBody
    public Map<String, Object> queryOneByIdPay(@RequestParam("page") Integer pageNumber, @RequestParam("limit") Integer pageSize, int id) {
        int number;
        int size;
        if (pageNumber == null) {
            number = 1;
        } else {
            number = pageNumber;
        }
        if (pageSize == null) {
            size = 10;
        } else {
            size = pageSize;
        }
        //添加分页功能
        PageData<Fee> feeList = feeService.queryAllId(number, size, id, "缴费");
        Map<String, Object> fee = new HashMap<>();
        if (feeList.getList().size() == 0) {
            fee.put("code", -1);
            fee.put("msg", "没有条件为" + id + "的缴费信息！");
            fee.put("data",feeList);
        } else {
            fee.put("code", 0);
            fee.put("data", feeList);
            fee.put("msg", "获取数据成功！");
        }
        return fee;
    }

    //未缴费查询
    @RequestMapping("/queryOneByIdNoPay")
    @ResponseBody
    public Map<String, Object> queryOneByIdNoPay(@RequestParam("page") Integer pageNumber, @RequestParam("limit") Integer pageSize, int id) {
        int number;
        int size;
        if (pageNumber == null) {
            number = 1;
        } else {
            number = pageNumber;
        }
        if (pageSize == null) {
            size = 10;
        } else {
            size = pageSize;
        }
        //添加分页功能
        PageData<Fee> feeList = feeService.queryAllId(number, size, id, "未缴费");
        Map<String, Object> fee = new HashMap<>();
        if (feeList.getList().size()== 0) {
            fee.put("code", -1);
            fee.put("msg", "没有条件为" + id + "的未缴费信息");
            fee.put("data",feeList);
        } else {
            fee.put("code", 0);
            fee.put("data", feeList);
            fee.put("msg", "获取数据成功！");
        }
        return fee;
    }
    //现金显示金额接口
    @RequestMapping("/paymentAmount")
    @ResponseBody
    public  double paymentAmount(int feeId){
        return feeService.paymentAmount(feeId);
    }
    //现金支付接口
    @RequestMapping("/cashPayment")
    @ResponseBody
    public Map<String, Object> cashPayment(int feeId){
        Map<String, Object> result = new HashMap<>();
        if (feeId==0){
            result.put("code",-2);
            result.put("message","房间号异常");
        }
        else {
            result=feeService.CashPayment(feeId);
        }
        return  result;
    }

}
