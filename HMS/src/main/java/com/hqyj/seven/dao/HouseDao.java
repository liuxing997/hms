package com.hqyj.seven.dao;

import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.House;
import com.hqyj.seven.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HouseDao {

         int updateByHouseName(@Param("customerId")int customerId,@Param("name") String name );
         House queryByHousename(String name);
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

    //删除客房
    int deleteHouse(int house_id);
}
