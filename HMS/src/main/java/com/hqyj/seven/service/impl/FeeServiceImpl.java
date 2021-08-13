package com.hqyj.seven.service.impl;

import com.hqyj.seven.dao.Feedao;
import com.hqyj.seven.pojo.Fee;
import com.hqyj.seven.service.FeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FeeServiceImpl implements FeeService {

    @Autowired
    private Feedao feedao;
    @Override
    //插入数据
    public int insertFee(Fee fee) {
        return feedao.inserintoFee(fee);

    }
}
