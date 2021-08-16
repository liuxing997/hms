package com.hqyj.seven.service;

import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.PageData;

import java.util.List;

public interface EnterService {

    //插入入住信息
    int insertEnter(Enter enter);

    //按照房间号和住房时间查找住房id
    Enter queryByHouseIdAndLimitOne(int CustomerId);

    //查询所有客户信息
    PageData<Enter> queryAll(int number, int size);

    //删除入住信息
    int deleteEnter(int enter_id);

    //根据住房id或者房间id查询住宿情况
    List<Enter> queryOneById(int id);
}
