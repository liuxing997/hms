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

    //维修更新空闲
    int updateMaintainHouse (String name);

    //打扫更新空闲
    int updateCleanHouse(String name);

    //更新客房信息
    int updateHouseI(House house);

    //增加客房
    int insertIntoHouse(House house);

    //删除客房
    int deleteHouseI(int house_id);
    //查询所有房间数量
   Integer queryHouseNumber();
    //查询空闲房间总数
    Integer queryCountByStateNull();
    //查询预定房间总数
    Integer queryCountByStateReserve();
    //查询入住房间总数
    Integer queryCountByStateCheckIn();
    //查询待打扫房间总数
    Integer queryCountByStateClean();
    //查询待维修房间总数
    Integer queryCountByStateMaintain();
    //查询房间为打扫的房间信息
    PageData<House> queryBySateClean(int pageNumber, int pageSize);
    //查询房间为维修的房间信息
    public PageData<House> queryBySateMaintain(int pageNumber, int pageSize);
    //退订功能
    Map<String, Object> unsubscribe(String houseName);
    //住房功能
    public Map<String, Object> checkIn(int customerId, String name,int day,int numberOfPeople,int userId) throws ParseException;
}
