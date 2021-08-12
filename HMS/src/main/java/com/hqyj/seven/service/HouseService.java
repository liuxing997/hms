package com.hqyj.seven.service;

import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.House;
import com.hqyj.seven.pojo.User;

import java.util.List;
import java.util.Map;

public interface HouseService {
    Map<String, Object> reservation(int customerId, String name);
    House getOneByHousename(String  name);


    //查询客房信息
    List<House> getAllHouse();

    //查询入住人信息
    List<Enter> queryInter();

    //更新客房信息
    int updateHouseI();

    //增加客房
    int insertIntoHouse();

    //删除客房
    int deleteHouseI();
}
