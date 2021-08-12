package com.hqyj.seven.service;

import com.hqyj.seven.pojo.House;
import com.hqyj.seven.pojo.User;

import java.util.Map;

public interface HouseService {
    Map<String, Object> reservation(int customerId, String name);
    House getOneByHousename(String  name);
}
