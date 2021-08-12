package com.hqyj.seven.service.impl;

import com.hqyj.seven.dao.HouseDao;
import com.hqyj.seven.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HouseServiceImpl implements HouseService {
@Autowired
    private HouseDao houseDao;
    @Override
    public int reservation(int customerId,String name ) {
       return houseDao.updateByHouseName(customerId,name);
    }


}
