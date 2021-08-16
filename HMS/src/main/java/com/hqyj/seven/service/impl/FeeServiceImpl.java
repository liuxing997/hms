package com.hqyj.seven.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.seven.dao.Feedao;
import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.Fee;
import com.hqyj.seven.pojo.House;
import com.hqyj.seven.pojo.PageData;
import com.hqyj.seven.service.FeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeeServiceImpl implements FeeService {


    private Feedao feedao;

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
        PageHelper.startPage(pageNumber,pageSize);
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
        if (pageInfo.isHasNextPage()){
            //有下一页 设置下一页页码
            pageData.setNextPage(pageInfo.getNextPage());
        }else {
            //没有下一页，设置尾页
            pageData.setNextPage(pageInfo.getPages());
        }
        if (pageInfo.isHasPreviousPage()){
            //有上一页 设置上一页页码
            pageData.setPreviousPage(pageInfo.getPrePage());
        }else {
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
        PageHelper.startPage(pageNumber,pageSize);
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
        if (pageInfo.isHasNextPage()){
            //有下一页 设置下一页页码
            pageData.setNextPage(pageInfo.getNextPage());
        }else {
            //没有下一页，设置尾页
            pageData.setNextPage(pageInfo.getPages());
        }
        if (pageInfo.isHasPreviousPage()){
            //有上一页 设置上一页页码
            pageData.setPreviousPage(pageInfo.getPrePage());
        }else {
            //没有上一页，设置首页
            pageData.setPreviousPage(1);
        }
        //设置房屋信息
        pageData.setList(pageInfo.getList());
        //返回房屋信息
        return pageData;
    }


}
