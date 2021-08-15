package com.hqyj.seven.controller;


import com.hqyj.seven.pojo.House;
import com.hqyj.seven.service.HouseService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
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
            house.put("message","获取数据成功！");
        }
        Session session= SecurityUtils.getSubject().getSession();
        session.setAttribute("houselist",houseList);
        return house;
    }
    
    //插入数据
    @RequestMapping("/insertonehouse")
    @ResponseBody
    public  Map<String,Object> insertOneHouse(House house){
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
        return houseMap;
    }

    //更新客房数据
    @RequestMapping("/updatehouse")
    @ResponseBody
    public Map<String,Object> updatehouse(House house){
        Map<String,Object> houseMap =  new HashMap<>();
        if (house==null){
            houseMap.put("code",-1);
            houseMap.put("massage","更新的参数不能为空");
        }else {
            houseMap.put("code",200);
            int num = 0;
            num =  houseService.insertIntoHouse(house);
            if (num == 1){
                houseMap.put("house","更新成功");
            }else {
                houseMap.put("house","更新失败");
            }
        }
        return houseMap;
    }
    //订房
    @RequestMapping("/reservation")
    @ResponseBody
        public Map<String, Object> reservation (int customerId, String name){
        Map<String,Object> houseMap =  new HashMap<>();


        if(name==null){
            houseMap.put("code",-2);
            houseMap.put("massage","房间号不能为空");
        }
        else {

            houseMap=houseService.reservation(customerId,name);



        }
        return houseMap;

    }
    //入住
    //参数分别为顾客id,房间name,入住天数，入住人数，userID
    @RequestMapping("/checkIn")
    @ResponseBody
    public Map<String, Object> checkIn(int customerId, String name,int day,int numberOfPeople,int userId){
        Map<String,Object> houseMap =  new HashMap<>();
        if(name==null||day==0||numberOfPeople==0){
            houseMap.put("code",-2);
            houseMap.put("massage","房间号不能为空或者天数和入住人数不能为0");
        }
        else {
            try {
                houseMap=houseService.checkIn(customerId,name,day,numberOfPeople,userId);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return houseMap;
    }

}
