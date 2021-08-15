package com.hqyj.seven.service;

import com.hqyj.seven.dao.EnterDao;
import com.hqyj.seven.pojo.Enter;

import java.util.List;

public interface EnterService {
    int insertEnter(Enter enter);
    //安照房间号和住房时间查找住房id
    Enter queryByHouseIdAndTime(int CustomerId, String time);
    //查询所有住房信息
    public List<Enter> queryAll();
}
