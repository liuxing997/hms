package com.hqyj.seven.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.seven.dao.EnterDao;
import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.PageData;
import com.hqyj.seven.service.EnterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EnterServiceImpl implements EnterService {

    private EnterDao enterDao;

    @Autowired
    public void setEnterDao(EnterDao enterDao) {
        this.enterDao = enterDao;
    }

    @Override
    public int insertEnter(Enter enter) {
      return    enterDao.inserintoEnter(enter);
    }
    @Override
    public Enter queryByHouseIdAndTime(int CustomerId, String time) {
        return  enterDao.queryByHouseIdAndTime(CustomerId,time);
    }

    @Override
    public PageData<Enter> queryAll(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        List<Enter> enterList = enterDao.queryAll();
        PageInfo<Enter> pageInfo = new PageInfo<>(enterList);
        PageData<Enter> pageData = new PageData<>();
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
        //设置用户信息
        pageData.setList(pageInfo.getList());
        return pageData;
    }

    @Override
    public int deleteEnter(int enter_id) {
       int num =  enterDao.deleteEnter(enter_id);
        return num;
    }

    @Override
    public List<Enter> queryOneById(int id) {
        List<Enter> enterList = enterDao.queryOneById(id);
        return enterList;
    }

}
