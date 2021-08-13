package com.hqyj.seven.service;

import com.hqyj.seven.dao.EnterDao;
import com.hqyj.seven.pojo.Enter;

public interface EnterService {
    int insertEnter(Enter enter);
    //安照房间号和住房时间查找住房id
    Enter queryByHouseIdAndTime(int CustomerId, String time);
}
