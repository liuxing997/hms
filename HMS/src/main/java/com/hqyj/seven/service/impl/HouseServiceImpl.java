package com.hqyj.seven.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hqyj.seven.dao.CustomerDao;
import com.hqyj.seven.dao.EnterDao;
import com.hqyj.seven.dao.Feedao;
import com.hqyj.seven.dao.HouseDao;
import com.hqyj.seven.pojo.*;
import com.hqyj.seven.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HouseServiceImpl implements HouseService {

    private HouseDao houseDao;
    private CustomerDao customerDao;
    private EnterDao enterDao;
    private Feedao feedao;

    @Autowired
    public void setHouseDao(HouseDao houseDao) {
        this.houseDao = houseDao;
    }

    @Autowired
    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    @Autowired
    public void setEnterDao(EnterDao enterDao) {
        this.enterDao = enterDao;
    }

    @Autowired
    public void setFeedao(Feedao feedao) {
        this.feedao = feedao;
    }

    //订房
    @Override
    public Map<String, Object> reservation(int customerId, String name) {
        Map<String, Object> result = new HashMap<>();
        House house = houseDao.queryByHousename(name);
        if (house.getState().equals("空闲")) {
            houseDao.updateByHouseName(customerId, name);
            result.put("code", 200);
            result.put("message", "订房成功");
        }
        if (house.getState().equals("已定") || house.getState().equals("入住")) {
            result.put("code", -2);
            result.put("message", "房间已经入住或者被定");
        }
        return result;
    }

    //根据ID或房间名查询房间
    @Override
    public List<House> searchHouse(String names) {
        return houseDao.searchHouse(names);
    }

    @Override
    public House getOneByHousename(String name) {
        return houseDao.queryByHousename(name);
    }

    //查询所有住房信息
    @Override
    public PageData<House> getAllHouse(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        List<House> houseList = houseDao.queryAllHouseI();
        PageInfo<House> pageInfo = new PageInfo<>(houseList);
        PageData<House> pageData = new PageData<>();
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

    // 查询入住信息
    @Override
    public List<Enter> queryInter(int house_id) {
        List<Enter> customers = houseDao.queryInter(house_id);
        return customers;
    }

    //维修更新
    @Override
    public int updateMaintainHouse(String name) {
        return houseDao.cleanMaintainByHouseState(name, "维修");
    }

    //打扫更新
    @Override
    public int updateCleanHouse(String name) {
        return houseDao.cleanMaintainByHouseState(name, "打扫");
    }


    //更新客房信息
    @Override
    public int updateHouseI(House house) {
        return houseDao.updateHouse(house);
    }

    //插入单个客房信息
    @Override
    public int insertIntoHouse(House house) {
        return houseDao.insertHouse(house);
    }

    //删除单个客房信息
    @Override
    public int deleteHouseI(int house_id) {
        return houseDao.deleteHouse(house_id);
    }

    //查询所有房间数量
    @Override
    public Integer queryHouseNumber() {
        return houseDao.queryCount();
    }

    //查询空闲房间总数
    @Override
    public Integer queryCountByStateNull() {
        return houseDao.queryCountByStateNull();
    }

    //查询预定房间总数
    @Override
    public Integer queryCountByStateReserve() {
        return houseDao.queryCountByStateReserve();
    }

    //查询入住房间总数
    @Override
    public Integer queryCountByStateCheckIn() {
        return houseDao.queryCountByStateCheckIn();
    }

    //查询待打扫房间总数
    @Override
    public Integer queryCountByStateClean() {
        return houseDao.queryCountByStateClean();
    }

    //查询待维修房间总数
    @Override
    public Integer queryCountByStateMaintain() {
        return houseDao.queryCountByStateMaintain();
    }

    //查询打扫房间信息
    @Override
    public PageData<House> queryBySateClean(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        List<House> houseList = houseDao.queryBySate("打扫");
        PageInfo<House> pageInfo = new PageInfo<>(houseList);
        PageData<House> pageData = new PageData<>();
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

    //查询维修房间信息
    @Override
    public PageData<House> queryBySateMaintain(int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        List<House> houseList = houseDao.queryBySate("维修");
        PageInfo<House> pageInfo = new PageInfo<>(houseList);
        PageData<House> pageData = new PageData<>();
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

    //根据ID或房间名搜索待打扫房间
    @Override
    public List<House> searchHouseClean(String names) {
        return houseDao.searchHouseClean(names);
    }

    //根据ID或房间名搜索待维修房间
    @Override
    public List<House> searchHouseMaintain(String names) {
        return houseDao.searchHouseMaintain(names);
    }

    //退订
    @Override
    public Map<String, Object> unsubscribe(String houseName) {
        Map<String, Object> result = new HashMap<>();
        House house = houseDao.queryByHousename(houseName);
        if (house.getState().equals("已定")) {
            houseDao.updateByHouseNameToUnsubscribe(houseName);
            result.put("code", 200);
            result.put("message", "退订成功");
        } else {
            result.put("code", -2);
            result.put("message", "房间已经退订或者正在入住");
        }
        return result;
    }

    //退房
    @Override
    public Map<String, Object> checkOut(String name) {
        Map<String, Object> result = new HashMap<>();
        House house = houseDao.queryByHousename(name);
        double price = house.getPrice();
        int customerId = house.getCustomerId();
        int houseId = house.getHouseId();
        if (house.getState().equals("入住")) {
            Date date1 = new Date();
            enterDao.updateByHouseIdAndCustomerId(date1, houseId, customerId,"已结账");
            Enter enter = enterDao.selectByHouseIdAndCustomerId(houseId, customerId);
            Date date2 = enter.getEnd_time_estimate();
            DecimalFormat df = new DecimalFormat("#.##");
            long day = (date2.getTime() - date1.getTime()) / 24 / 60 / 60 / 1000;
            double money = day * price;
            customerDao.updataByCustomerIdToremainderTwo(money, customerId);
            Fee fee = feedao.queryByHouseIdAndCoustomerId(houseId, customerId);
            int feeId = fee.getFeeId();
            String feeddirect = fee.getDirect();
            if (feeddirect.equals("未缴费")){
                feedao.updateByFeeId(feeId);
                enterDao.updateByHouseIdAndCustomerId(date1, houseId, customerId,"未结账");
            }
            houseDao.updateByHouseNameToCheckOut(name);
            result.put("code", 200);
            result.put("message", "退房成功");
        } else {
            result.put("code", -1);
            result.put("message", "房间已经退了或在其他状态，不需要重复操作");
        }
        return result;

    }

    //入住
    //参数分别为顾客id,房间name,入住人数，userID
    @Override
    public Map<String, Object> checkIn(int customerId, String name, int day, int numberOfPeople, int userId) throws ParseException {
        Map<String, Object> result = new HashMap<>();
        //按照name获取house数据
        House house = houseDao.queryByHousename(name);
        //按照id获取customer数据
        Customer customer = customerDao.queryByCustomer(customerId);
        Date time = new Date();
        //更新字符串 如果numberOfPeople=2，字符串则更新为2人已入住
        String str1 = numberOfPeople + "人已入住";
        //预定时间+day为预定退房时间，实际退房时间 退房时更新
        int day2 = day * 24 * 60 * 60 * 1000;
        long time2 = time.getTime() + day2;
        Date time3 = new Date(time2);
        //如果房间是空闲则之间可以入住
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       String fee_info = Long.toString(System.currentTimeMillis());
        if (house.getState().equals("空闲")) {
            double money = house.getPrice() * day;
            //如果余额不足则会提示
            if (money > customer.getRemainder()) {
                //更新顾客表余额的数据
                customerDao.updataByCustomerIdToremainder(0, customerId);
                //插入顾客表
                enterDao.inserintoEnter(new Enter(house.getHouseId(), customerId,
                        numberOfPeople, time, time3, null, 0, fee_info, userId, "未结账", house.getPrice()));
                //设置时间格式为yyyy-MM-dd HH:mm:ss以便插入
                //规范化插入表时的时间和获取的时间有点误差
                Enter enter = enterDao.queryByHouseIdAndLimitOne(house.getHouseId());
                //插入缴费表
                feedao.inserintoFee(new Fee(enter.getEnter_id(), "未缴费", customerId, money, house.getHouseId(),
                        str1, userId, "未缴费"));
                //更新房间为入住
                houseDao.updateByHouseNametocheckIn(customerId, name, day);
                result.put("code", 201);
                result.put("message", "入住成功，但余额不足需要顾客现金或者充值");
            } else {
                //更新顾客表余额的数据
                customerDao.updataByCustomerIdToremainder(money, customerId);

                //插入顾客表
                enterDao.inserintoEnter(new Enter(house.getHouseId(), customerId,
                        numberOfPeople, time, time3, null, money, fee_info,userId, "已结账", house.getPrice()));
                //设置时间格式为yyyy-MM-dd HH:mm:ss以便插入
                //规范化插入表时的时间和获取的时间有点误差
                Enter enter = enterDao.queryByHouseIdAndLimitOne(house.getHouseId());
                //插入缴费表
                feedao.inserintoFee(new Fee(enter.getEnter_id(), "缴费", customerId, money, house.getHouseId(),
                        str1, userId, "会员卡扣费"));
                //更新房间为入住
                houseDao.updateByHouseNametocheckIn(customerId, name, day);
                result.put("code", 200);
                result.put("message", "入住成功");
            }
        } else {
            if ((house.getState().equals("已定"))) {
                //判断预定房间号的顾客id和现在的顾客id是否一致
                if (house.getCustomerId() == customerId) {
                    double money = house.getPrice() * day;
                    //如果余额不足则会提示
                    if (money > customer.getRemainder()) {
                        //更新顾客表余额的数据
                        customerDao.updataByCustomerIdToremainder(0, customerId);
                        //插入顾客表
                        enterDao.inserintoEnter(new Enter(house.getHouseId(), customerId,
                                numberOfPeople, time, time3, null, 0, fee_info, userId, "未缴费", house.getPrice()));
                        //设置时间格式为yyyy-MM-dd HH:mm:ss以便插入
                        //规范化插入表时的时间和获取的时间有点误差
                        Enter enter = enterDao.queryByHouseIdAndLimitOne(house.getHouseId());
                        //插入缴费表
                        System.out.println(enter);
                        feedao.inserintoFee(new Fee(enter.getEnter_id(), "未缴费", customerId, money, house.getHouseId(),
                                str1, userId, "未缴费"));
                        //更新房间为入住

                        houseDao.updateByHouseNametocheckIn(customerId, name, day);
                        result.put("code", 201);
                        result.put("message", "入住成功预定房间成功，但余额不足需要顾客现金或者充值");
                    } else {
                        //更新顾客表余额的数据
                        customerDao.updataByCustomerIdToremainder(money, customerId);
                        //插入顾客表
                        enterDao.inserintoEnter(new Enter(house.getHouseId(), customerId,
                                numberOfPeople, time, time3, null, money, fee_info, userId, "已结账", house.getPrice()));
                        //设置时间格式为yyyy-MM-dd HH:mm:ss以便插入
                        //规范化插入表时的时间和获取的时间有点误差
                        Enter enter = enterDao.queryByHouseIdAndLimitOne(house.getHouseId());
                        //插入缴费表
                        feedao.inserintoFee(new Fee(enter.getEnter_id(), "缴费", customerId, money, house.getHouseId(),
                                str1, userId, "会员卡扣费"));
                        //更新房间为入住
                        houseDao.updateByHouseNametocheckIn(customerId, name, day);
                        result.put("code", 200);
                        result.put("message", "顾客入住预定的房间成功");
                    }
                } else {
                    result.put("code", -2);
                    result.put("message", "此房间不是该顾客预定的哟");
                }
            } else {
                result.put("code", -3);
                result.put("message", "房间预定或者已经入住哟");
            }
        }
        return result;
    }

}


