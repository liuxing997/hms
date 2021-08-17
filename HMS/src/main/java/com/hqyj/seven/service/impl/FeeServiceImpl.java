package com.hqyj.seven.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.seven.dao.EnterDao;
import com.hqyj.seven.dao.Feedao;
import com.hqyj.seven.pojo.Fee;
import com.hqyj.seven.pojo.PageData;
import com.hqyj.seven.service.FeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FeeServiceImpl implements FeeService {


    private Feedao feedao;

    @Autowired
    public void setEnterDao(EnterDao enterDao) {
        this.enterDao = enterDao;
    }

    private EnterDao enterDao;

    @Autowired
    public void setFeedao(Feedao feedao) {
        this.feedao = feedao;
    }

    @Override
    //插入数据
    public int insertFee(Fee fee) {
        return feedao.inserintoFee(fee);

    }

    //查询已经缴费信息表
    @Override
    public PageData<Fee> queryByDirectPay(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        List<Fee> houseList = feedao.queryByDirect("缴费");
        PageInfo<Fee> pageInfo = new PageInfo<>(houseList);
        PageData<Fee> pageData = new PageData<>();
        pageData.setCurrentPage(pageNumber);
        //设置每页数
        pageData.setPageSize(pageSize);
        //设置总页数
        pageData.setTotalPage(pageInfo.getPages());
        //设置总记录数
        pageData.setTotalSize((int) pageInfo.getTotal());
        if (pageInfo.isHasNextPage()) {
            //有下一页 设置下一页页码
            pageData.setNextPage(pageInfo.getNextPage());
        } else {
            //没有下一页，设置尾页
            pageData.setNextPage(pageInfo.getPages());
        }
        if (pageInfo.isHasPreviousPage()) {
            //有上一页 设置上一页页码
            pageData.setPreviousPage(pageInfo.getPrePage());
        } else {
            //没有上一页，设置首页
            pageData.setPreviousPage(1);
        }
        //设置房屋信息
        pageData.setList(pageInfo.getList());
        //返回房屋信息
        return pageData;
    }

    @Override
    public PageData<Fee> queryByDirectNoPay(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        List<Fee> houseList = feedao.queryByDirect("未缴费");
        PageInfo<Fee> pageInfo = new PageInfo<>(houseList);
        PageData<Fee> pageData = new PageData<>();
        pageData.setCurrentPage(pageNumber);
        //设置每页数
        pageData.setPageSize(pageSize);
        //设置总页数
        pageData.setTotalPage(pageInfo.getPages());
        //设置总记录数
        pageData.setTotalSize((int) pageInfo.getTotal());
        if (pageInfo.isHasNextPage()) {
            //有下一页 设置下一页页码
            pageData.setNextPage(pageInfo.getNextPage());
        } else {
            //没有下一页，设置尾页
            pageData.setNextPage(pageInfo.getPages());
        }
        if (pageInfo.isHasPreviousPage()) {
            //有上一页 设置上一页页码
            pageData.setPreviousPage(pageInfo.getPrePage());
        } else {
            //没有上一页，设置首页
            pageData.setPreviousPage(1);
        }
        //设置房屋信息
        pageData.setList(pageInfo.getList());
        //返回房屋信息
        return pageData;
    }

    @Override
    public PageData<Fee> queryAllId(int pageNumber, int pageSize, int id, String direct) {
        PageHelper.startPage(pageNumber, pageSize);
        List<Fee> houseList = feedao.queryAllId(id, direct);
        PageInfo<Fee> pageInfo = new PageInfo<>(houseList);
        PageData<Fee> pageData = new PageData<>();
        pageData.setCurrentPage(pageNumber);
        //设置每页数
        pageData.setPageSize(pageSize);
        //设置总页数
        pageData.setTotalPage(pageInfo.getPages());
        //设置总记录数
        pageData.setTotalSize((int) pageInfo.getTotal());
        if (pageInfo.isHasNextPage()) {
            //有下一页 设置下一页页码
            pageData.setNextPage(pageInfo.getNextPage());
        } else {
            //没有下一页，设置尾页
            pageData.setNextPage(pageInfo.getPages());
        }
        if (pageInfo.isHasPreviousPage()) {
            //有上一页 设置上一页页码
            pageData.setPreviousPage(pageInfo.getPrePage());
        } else {
            //没有上一页，设置首页
            pageData.setPreviousPage(1);
        }
        //设置房屋信息
        pageData.setList(pageInfo.getList());
        //返回房屋信息
        return pageData;
    }

    @Override
    public double paymentAmount(int feeId) {
        Fee fee = feedao.queryOneByFeeId(feeId);
        return fee.getMoney();
    }

    //现金支付
    @Override
    public Map<String, Object> CashPayment(int feeId) {
        Map<String, Object> result = new HashMap<>();
        Fee fee = feedao.queryOneByFeeId(feeId);
        System.out.println(fee);
        if (fee != null&&fee.getFee_type().equals("待缴费")) {
            double money = fee.getMoney();
            int enterId = fee.getEnterId();
            fee.setFee_type("现金");
            fee.setDirect("缴费");
            feedao.updateFee(fee);
            enterDao.updateByEnterIdToMoney(money, enterId);
            result.put("code", 200);
            result.put("message", "现金支付成功");
        } else {
            result.put("code", -1);
            result.put("message", "此房间未找到或者已经付费");
        }
        return result;
    }


}
