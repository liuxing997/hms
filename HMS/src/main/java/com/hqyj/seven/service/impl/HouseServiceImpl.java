package com.hqyj.seven.service.impl;

import com.hqyj.seven.dao.CustomerDao;
import com.hqyj.seven.dao.EnterDao;
import com.hqyj.seven.dao.Feedao;
import com.hqyj.seven.dao.HouseDao;
import com.hqyj.seven.pojo.Customer;
import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.Fee;
import com.hqyj.seven.pojo.House;
import com.hqyj.seven.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HouseServiceImpl implements HouseService {
    @Autowired
    private HouseDao houseDao;
    @Autowired
    private CustomerDao customerDao;
    @Autowired
    private EnterDao enterDao;
    @Autowired
    private Feedao feedao;
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

    //查询所有住房信息
    @Override
    public List<House> getAllHouse() {
        List<House> houseList = houseDao.queryAllHouseI();
        return houseList;
    }
    // 查询入住信息
    @Override
    public List<Enter> queryInter(int house_id) {
        List<Enter> customers = houseDao.queryInter(house_id);
        return customers;
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
    @Override
    //参数分别为顾客id,房间name,入住人数，userID
    public Map<String, Object> checkIn(int customerId, String name,int day,int numberOfPeople,int userId) throws ParseException {
        Map<String, Object> result = new HashMap<>();
        //按照name获取house数据
        House house=houseDao.queryByHousename(name);
        //按照id获取customer数据
        Customer customer=customerDao.queryByCustomer(customerId);
        Date time=new Date();
        //更新字符串 如果numberOfPeople=2，字符串则更新为2人已入住
        String str1=numberOfPeople+"人已入住";
        //预定时间+day为预定退房时间，实际退房时间 退房时更新
        int  day2 = day*24*60*60*1000;
        long time2=time.getTime()+day2;
        Date time3=new Date(time2);
        System.out.println(time);
        //如果房间是空闲则之间可以入住
        if (house.getState().equals("空闲"))
        {
            double money=house.getPrice()*day;
            //如果余额不足则会提示
            if (money>customer.getRemainder())
                result.put("用户余额不足可以尝试充值或者减少预定住房时间",-1);
            else {
                //更新顾客表余额的数据
                customerDao.updataByCustomerIdToremainder(money,customerId);
                //插入顾客表
                enterDao.inserintoEnter(new Enter(house.getHouseId(),customerId,
                        numberOfPeople,time,time3,null,money,1,userId,"已结账",house.getPrice()));
                //设置时间格式为yyyy-MM-dd HH:mm:ss以便插入
                SimpleDateFormat sdf  =   new  SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
                //规范化插入表时的时间和获取的时间有点误差
                long day3 = time.getTime()+500;
                Date time4=new Date(day3);
                Enter enter= enterDao.queryByHouseIdAndTime(house.getHouseId(),sdf.format(time4));

                //插入缴费表
                feedao.inserintoFee(new Fee( enter.getEnter_id(),"缴费",customerId,money,house.getHouseId(),
                        str1,userId,"会员卡扣费"));
                //更新房间为入住
                houseDao.updateByHouseNametocheckIn(customerId,name,day);
                result.put("入住成功",1);

            }

        }
        else {
            if ((house.getState().equals("已定"))) {
                //判断预定房间号的顾客id和现在的顾客id是否一致
                if (house.getCustomerId() == customerId) {
                    double money = house.getPrice() * day;
                    //如果余额不足则会提示
                    if (money > customer.getRemainder())
                        result.put("用户余额不足可以尝试充值或者减少预定住房时间", -1);
                    else {
                        //更新顾客表余额的数据
                        customerDao.updataByCustomerIdToremainder(money, customerId);
                        //插入顾客表
                        enterDao.inserintoEnter(new Enter(house.getHouseId(), customerId,
                                numberOfPeople, time, time3, null, money, 1, userId, "已结账", house.getPrice()));
                        //设置时间格式为yyyy-MM-dd HH:mm:ss以便插入
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        //规范化插入表时的时间和获取的时间有点误差
                        long day3 = time.getTime() + 500;
                        Date time4 = new Date(day3);
                        Enter enter = enterDao.queryByHouseIdAndTime(house.getHouseId(), sdf.format(time4));

                        //插入缴费表
                        feedao.inserintoFee(new Fee(enter.getEnter_id(), "缴费", customerId, money, house.getHouseId(),
                                str1, userId, "会员卡扣费"));
                        //更新房间为入住
                        houseDao.updateByHouseNametocheckIn(customerId, name, day);
                        result.put("入住预定的房间成功", 2);
                    }


                } else {
                    result.put("此房间不是该顾客预定的哟", -3);
                }
            } else {
                result.put("房间预定或者已经入住", -2);
            }
        }
        return result;
    }

}


