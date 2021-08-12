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
    public int deleteHousei(int house_id){
        return houseService.deleteHouseI(house_id);
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
}
