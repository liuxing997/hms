package com.hqyj.seven.controller;

import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.service.EnterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/enter")
public class EnterController {
    @Autowired
    EnterService enterService;
    @RequestMapping("/queryEnter")
    @ResponseBody
    public Map<String,Object> queryEnter(){
        List<Enter> enterList = enterService.queryAll();
        Map<String,Object> enterMap = new HashMap<>();
        if (enterList.size()==0){
            enterMap.put("code",-1);
            enterMap.put("message","没有相关的住房信息");
        }else {
            enterMap.put("code",200);
            enterMap.put("message","查询成功！");
            enterMap.put("data",enterList);
        }
        return enterMap;
    }
}
