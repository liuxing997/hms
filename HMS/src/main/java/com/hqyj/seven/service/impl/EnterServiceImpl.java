package com.hqyj.seven.service.impl;

import com.hqyj.seven.dao.EnterDao;
import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.service.EnterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnterServiceImpl implements EnterService {
    @Autowired
   private EnterDao enterDao;

    @Override
    public int insertEnter(Enter enter) {
      return    enterDao.inserintoEnter(enter);
    }
    @Override
    public Enter queryByHouseIdAndTime(int CustomerId, String time) {
        return  enterDao.queryByHouseIdAndTime(CustomerId,time);
    }

    @Override
    public List<Enter> queryAll() {
        return enterDao.queryAll();
    }
}
