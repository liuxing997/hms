package com.hqyj.seven.service;

import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.House;
import com.hqyj.seven.pojo.PageData;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

public interface HouseService {
    Map<String, Object> reservation(int customerId, String name);

    //根据ID或房间名查询房间
    List<House> searchHouse(String  names);

    House getOneByHousename(String  name);


    //查询所有客房信息
    PageData<House> getAllHouse(int number, int size);

    //查询入住人信息
    List<Enter> queryInter(int house_id);

    //更新客房信息
    int updateHouseI(House house);

    //增加客房
    int insertIntoHouse(House house);

    //删除客房
    int deleteHouseI(int house_id);
    //住房功能
    public Map<String, Object> checkIn(int customerId, String name,int day,int numberOfPeople,int userId) throws ParseException;
}
