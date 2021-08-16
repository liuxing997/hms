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

    @RequestMapping("/queryEnter")
    @ResponseBody
    public Map<String,Object> getAllenter(@RequestParam("page") Integer pageNumber, @RequestParam("limit")Integer pageSize){
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
        PageData<Enter> enterList = enterService.queryAll(number,size);
        Map<String,Object> enter =   new HashMap<>();
        if (enterList == null){
            enter.put("code",-1);
            enter.put("msg","没有客户信息");
        }else {
            enter.put("code", 0);
            enter.put("data", enterList);
            enter.put("msg","获取数据成功！");
        }
        Session session= SecurityUtils.getSubject().getSession();
        session.setAttribute("enterList",enterList);
        return enter;
    }
}
