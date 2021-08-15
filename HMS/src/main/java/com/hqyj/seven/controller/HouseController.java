package com.hqyj.seven.controller;


import com.hqyj.seven.pojo.House;
import com.hqyj.seven.pojo.PageData;
import com.hqyj.seven.service.HouseService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/house")
@Controller
public class HouseController {
    @Autowired
    private HouseService  houseService;


    //客房信息的删除
    @RequestMapping("/deleteHouse")
    @ResponseBody
    public Map<String,Object> deleteHousei(int house_id){
        Map<String,Object> houseMap =  new HashMap<>();
        int num = houseService.deleteHouseI(house_id);
        if (num==0){
            houseMap.put("code",0);
            houseMap.put("message","删除失败!");
        }else {
            houseMap.put("code",200);
            houseMap.put("message","删除成功!");
        }
        return houseMap;
    }

    //获取客房的全部信息
    @RequestMapping("/getallhuose")
    @ResponseBody
    public Map<String,Object> getAllHouse(@RequestParam("page") Integer pageNumber, @RequestParam("limit")Integer pageSize) {
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
        PageData<House> houseList = houseService.getAllHouse(number,size);
        Map<String,Object> house =  new HashMap<>();
        if (houseList == null){
            house.put("code",-1);
            house.put("msg","没有客房信息");
        }else {
            house.put("code", 0);
            house.put("data", houseList);
            house.put("msg","获取数据成功！");
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
            houseMap.put("message","添加的参数不能为空！");
        }else {
            int num = houseService.insertIntoHouse(house);
            if (num == 1){
                houseMap.put("code",200);
                houseMap.put("message","添加成功！");
            }else {
                houseMap.put("code",-1);
                houseMap.put("message","添加失败！");
            }
        }
        return houseMap;
    }

    //更新客房数据
    @RequestMapping("/updatehouse")
    @ResponseBody
    public Map<String,Object> updatehouse(House house){
        Map<String,Object> houseMap =  new HashMap<>();
        if (house == null){
            houseMap.put("code",-9);
            houseMap.put("message","更新的参数不能为空");
        }else {
            int num = houseService.updateHouseI(house);
            if (num == 1){
                houseMap.put("code",200);
                houseMap.put("message","更新成功！");
            }else {
                houseMap.put("code",-1);
                houseMap.put("message","更新失败！");
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
