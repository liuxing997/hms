package com.hqyj.seven.controller;

import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.PageData;
import com.hqyj.seven.service.EnterService;
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
@RequestMapping("/enter")
public class EnterController {

    private EnterService enterService;

    @Autowired
    public void setEnterService(EnterService enterService) {
        this.enterService = enterService;
    }

    //获得所有订单记录
    @RequestMapping("/queryEnter")
    @ResponseBody
    public Map<String, Object> getAllenter(@RequestParam("page") Integer pageNumber, @RequestParam("limit") Integer pageSize) {
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
        PageData<Enter> enterList = enterService.queryAll(number, size);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (Enter enter : enterList.getList()) {
            enter.setStart_time1(df.format(enter.getStart_time()));
            enter.setEnd_time_estimate1(df.format(enter.getEnd_time_estimate()));
            if (enter.getEnd_time_actual() == null) {
                enter.setEnd_time_actual1("未定");
            } else {
                enter.setEnd_time_actual1(df.format(enter.getEnd_time_actual()));
            }
        }
        Map<String, Object> enter = new HashMap<>();
        if (enterList.getList().size() == 0) {
            enter.put("code", -1);
            enter.put("msg", "没有客户信息");
            enter.put("data", enterList);
        } else {
            enter.put("code", 0);
            enter.put("msg", "获取数据成功！");
            enter.put("data", enterList);
        }
        return enter;
    }

    @RequestMapping("/queryOneById")
    @ResponseBody
    public Map<String, Object> queryOneById(int id) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Enter> enterList = enterService.queryOneById(id);
        for (Enter enter : enterList) {
            enter.setStart_time1(df.format(enter.getStart_time()));
            enter.setEnd_time_estimate1(df.format(enter.getEnd_time_estimate()));
            if (enter.getEnd_time_actual() == null) {
                enter.setEnd_time_actual1("未定");
            } else {
                enter.setEnd_time_actual1(df.format(enter.getEnd_time_actual()));
            }
        }
        Map<String, Object> enterMap = new HashMap<>();
        if (enterList.size() == 0) {
            enterMap.put("code", -1);
            enterMap.put("msg", "未查询到任何信息！");
            enterMap.put("data", enterList);
        } else {
            enterMap.put("code", 0);
            enterMap.put("msg", "查询成功！");
            enterMap.put("data", enterList);
        }
        return enterMap;
    }
}
