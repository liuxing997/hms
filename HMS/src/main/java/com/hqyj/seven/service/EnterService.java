package com.hqyj.seven.service;

import com.hqyj.seven.dao.EnterDao;
import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.PageData;

import java.util.List;

public interface EnterService {
    int insertEnter(Enter enter);
    //安照房间号和住房时间查找住房id
    Enter queryByHouseIdAndTime(int CustomerId, String time);
    //查询所有客户信息
    PageData<Enter> queryAll(int number, int size);
    //删除记录
    int deleteEnter(int enter_id);
}
