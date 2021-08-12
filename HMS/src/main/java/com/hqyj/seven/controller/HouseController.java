package com.hqyj.seven.controller;


import com.hqyj.seven.pojo.House;
import com.hqyj.seven.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/house")
@Controller
public class HouseController {
    @Autowired
    private HouseService  houseService;


    //客房信息的删除
    @RequestMapping("/deleteHouse")
    @ResponseBody
    public void deleteHousei(int house_id){
        Map<String,Object> houseMap =  new HashMap<>();
        int num = houseService.deleteHouseI(house_id);
        if (num==0){
            houseMap.put("code",0);
            houseMap.put("massage","删除失败");
        }else {
            houseMap.put("code",200);
            houseMap.put("house","删除成功");
        }
    }

    //获取客房的全部信息
    @RequestMapping("/getallhuose")
    @ResponseBody
    public Map<String,Object> getAllHouse() {
        List<House> houseList = houseService.getAllHouse();
        Map<String,Object> house =  new HashMap<>();
        if (houseList == null){
            house.put("code",-1);
            house.put("massage","没有客房信息");
        }else {
            house.put("code", 200);
            house.put("house", houseList);
            house.put("massage", "成功");
        }
        return house;
    }
    
    //插入数据
    @RequestMapping("/insertonehouse")
    @ResponseBody
    public void insertOneHouse(House house){
        Map<String,Object> houseMap =  new HashMap<>();
        if (house==null){
            houseMap.put("code",-1);
            houseMap.put("massage","插入的参数不能为空");
        }else {
            houseMap.put("code",200);
            int num = 0;
            num =  houseService.insertIntoHouse(house);
            if (num == 1){
                houseMap.put("house","插入成功");
            }else {
                houseMap.put("house","插入失败");
            }
        }
    }
}
