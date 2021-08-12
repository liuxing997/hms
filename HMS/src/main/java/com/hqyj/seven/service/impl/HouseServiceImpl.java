package com.hqyj.seven.service.impl;

import com.hqyj.seven.dao.HouseDao;
import com.hqyj.seven.pojo.House;
import com.hqyj.seven.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class HouseServiceImpl implements HouseService {
@Autowired
    private HouseDao houseDao;
    @Override
    public Map<String, Object> reservation(int customerId, String name ) {
        Map<String, Object> result = new HashMap<>();
       House house=houseDao.queryByHousename(name);
       if (house.getState().equals("空闲"))
        {  houseDao.updateByHouseName(customerId,name);
            result.put("订房成功",1);
        }
        if (house.getState().equals("已定")||house.getState().equals("入住"))
        {
            result.put("此房间已定或者入住",-1);

        }
        return result;
    }

    @Override
    public House getOneByHousename(String name) {
        return houseDao.queryByHousename(name);
    }


}
