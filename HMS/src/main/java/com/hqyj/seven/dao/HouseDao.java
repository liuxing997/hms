package com.hqyj.seven.dao;

import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.House;
import com.hqyj.seven.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HouseDao {

    int updateByHouseName(@Param("customerId")int customerId,@Param("name") String name );
    //更改维修状态
    int updateByHouseStatetocheckIn(@Param("houseId")int houseId,@Param("state") String state);

    House queryByHousename(String name);

    //根据ID或房间名查询房间
    List<House> searchHouse(String  names);

    //状态查询
    List<House> searchHouseState(String  state);

    int updateByHouse(House house);

    int updateByHouseNametocheckIn(@Param("customerId")int customerId,@Param("name") String name,@Param("day") int day);

    //获取全部客房信息
    List<House> queryAllHouseI();
    //获取单个住房信息和住房人的信息
    List<Enter> queryInter(int house_id);
    //修改房屋信息
    int updateHouse(House house);
    //增加住房
    int insertHouse(House house);
    //更改住房状态
    int updateHouseState(House house);
    //删除客房
    int deleteHouse(int house_id);
    //查询所有房间数量
    Integer queryCount();
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
    //查询状态为打扫和维修的房间
    List<House> queryBySate();
    //查询状态为打扫和维修的房间
    List<House> queryBySate(String state);
    //按照id房间号更改住房信息用于退定
    int updateByHouseNameToUnsubscribe(String houseName);
    //按照id房间号更改住房信息用于退房
    int updateByHouseNameToCheckOut(String houseName);

    //修改打扫和维修的房间名
    int cleanMaintainByHouseState(@Param("name") String name,@Param("state") String state);

    //根据ID或房间名搜索待打扫房间
    List<House> searchHouseClean(String names);

    //根据ID或房间名搜索待维修房间
    List<House> searchHouseMaintain(String names);
}
