package com.hqyj.seven.controller;


import com.hqyj.seven.pojo.House;
import com.hqyj.seven.pojo.PageData;
import com.hqyj.seven.service.HouseService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/house")
@Controller
public class HouseController {

    private HouseService houseService;

    @Autowired
    public void setHouseService(HouseService houseService) {
        this.houseService = houseService;
    }

    //客房信息的删除
    @RequestMapping("/deleteHouse")
    @ResponseBody
    public Map<String, Object> deleteHousei(int house_id) {
        Map<String, Object> houseMap = new HashMap<>();
        int num = houseService.deleteHouseI(house_id);
        if (num == 0) {
            houseMap.put("code", 0);
            houseMap.put("message", "删除失败!");
        } else {
            houseMap.put("code", 200);
            houseMap.put("message", "删除成功!");
        }
        return houseMap;
    }

    //获取客房的全部信息
    @RequestMapping("/getAllHouse")
    @ResponseBody
    public Map<String, Object> getAllHouse(@RequestParam("page") Integer pageNumber, @RequestParam("limit") Integer pageSize) {
        int number;
        int size;
        if (pageNumber == null) {
            number = 1;
        } else {
            number = pageNumber;
        }
        if (pageSize == null) {
            size = 10;
        } else {
            size = pageSize;
        }
        //添加分页功能
        PageData<House> houseList = houseService.getAllHouse(number, size);
        Map<String, Object> house = new HashMap<>();
        if (houseList.getList() == null) {
            house.put("code", -1);
            house.put("msg", "没有客房信息");
            house.put("data", houseList);
        } else {
            house.put("code", 0);
            house.put("msg", "获取数据成功！");
            house.put("data", houseList);
        }
        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute("houselist", houseList);
        return house;
    }

    //插入数据
    @RequestMapping("/insertOneHouse")
    @ResponseBody
    public Map<String, Object> insertOneHouse(House house) {
        Map<String, Object> houseMap = new HashMap<>();
        if (house == null) {
            houseMap.put("code", -1);
            houseMap.put("message", "添加的参数不能为空！");
        } else {
            int num = houseService.insertIntoHouse(house);
            if (num == 1) {
                houseMap.put("code", 200);
                houseMap.put("message", "添加成功！");
            } else {
                houseMap.put("code", -1);
                houseMap.put("message", "添加失败！");
            }
        }
        return houseMap;
    }

    //更新客房数据
    @RequestMapping("/updateOneHouse")
    @ResponseBody
    public Map<String, Object> updateHouse(House house) {
        Map<String, Object> houseMap = new HashMap<>();
        if (house == null) {
            houseMap.put("code", -9);
            houseMap.put("message", "更新的参数不能为空");
        } else {
            int num = houseService.updateHouseI(house);
            if (num == 1) {
                houseMap.put("code", 200);
                houseMap.put("message", "更新成功！");
            } else {
                houseMap.put("code", -1);
                houseMap.put("message", "更新失败！");
            }
        }
        return houseMap;
    }

    //根据ID或房间名查询房间
    @RequestMapping("/searchHouse")
    @ResponseBody
    public Map<String, Object> searchHouse(String names) {
        Map<String, Object> houseMap = new HashMap<>();
        if (names == null) {
            houseMap.put("code", -9);
            houseMap.put("msg", "搜索的参数不能为空");
        } else {
            List<House> houseList = houseService.searchHouse(names);
            if (houseList.size() == 0) {
                houseMap.put("code", -1);
                houseMap.put("msg", "房间"+names+"不存在！");
            } else {
                houseMap.put("code", 0);
                houseMap.put("msg", "搜索房间成功！");
                houseMap.put("data", houseList);
            }
        }
        return houseMap;
    }

    //订房
    @RequestMapping("/reservation")
    @ResponseBody
    public Map<String, Object> reservation(int customerId, String name) {
        Map<String, Object> houseMap = new HashMap<>();
        if (name == null) {
            houseMap.put("code", -2);
            houseMap.put("message", "房间号不能为空");
        } else {
            houseMap = houseService.reservation(customerId, name);
        }
        return houseMap;
    }

    //退订
    @RequestMapping("/unsubscribe")
    @ResponseBody
    public Map<String, Object> unsubscribe(String name) {
        Map<String, Object> houseMap = new HashMap<>();
        if (name == null) {
            houseMap.put("code", -2);
            houseMap.put("message", "房间号不能为空");
        } else {
            houseMap = houseService.unsubscribe(name);
        }
        return houseMap;
    }

    //入住
    //参数分别为顾客id,房间name,入住天数，入住人数，userID
    @RequestMapping("/checkIn")
    @ResponseBody
    public Map<String, Object> checkIn(int customerId, String name, int day, int numberOfPeople, int userId) {
        Map<String, Object> houseMap = new HashMap<>();
        if (name == null || day == 0 || numberOfPeople == 0) {
            houseMap.put("code", -2);
            houseMap.put("message", "房间号不能为空或者天数和入住人数不能为0");
        } else {
            try {
                houseMap = houseService.checkIn(customerId, name, day, numberOfPeople, userId);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return houseMap;
    }

    @RequestMapping("/checkOut")
    @ResponseBody
    public Map<String, Object> checkOut(String name) {
        Map<String, Object> houseMap = new HashMap<>();
        if (name == null) {
            houseMap.put("code", -2);
            houseMap.put("message", "房间号不能为空");
        } else {
            houseMap = houseService.checkOut(name);
        }
        return houseMap;
    }

    //房间统计信息
    @RequestMapping("/totalOfHouse")
    @ResponseBody
    public Map<String, Object> totalOfHouse() {
        Map<String, Object> houseTotals = new HashMap<>();
        Map<String, Object> total = new HashMap<>();
        total.put("Sum", houseService.queryHouseNumber());
        total.put("Null", houseService.queryCountByStateNull());
        total.put("Reserve", houseService.queryCountByStateReserve());
        total.put("CheckIn", houseService.queryCountByStateCheckIn());
        total.put("Clean", houseService.queryCountByStateClean());
        total.put("Maintain", houseService.queryCountByStateMaintain());
        houseTotals.put("code", 200);
        houseTotals.put("message", "获取房间统计数据成功！");
        houseTotals.put("data", total);
        return houseTotals;
    }

    //根据ID或房间名搜索待打扫房间
    @RequestMapping("/searchHouseClean")
    @ResponseBody
    public Map<String, Object> searchHouseClean(String names) {
        Map<String, Object> houseMap = new HashMap<>();
        if (names == null) {
            houseMap.put("code", -9);
            houseMap.put("msg", "搜索的参数不能为空");
        } else {
            List<House> houseList = houseService.searchHouseClean(names);
            if (houseList.size() == 0) {
                houseMap.put("code", -1);
                houseMap.put("msg", "房间已打扫或空闲中！");
                houseMap.put("data", houseList);
            } else {
                houseMap.put("code", 0);
                houseMap.put("msg", "搜索房间成功！");
                houseMap.put("data", houseList);
            }
        }
        return houseMap;
    }

    //根据ID或房间名搜索待维修房间
    @RequestMapping("/searchHouseMaintain")
    @ResponseBody
    public Map<String, Object> searchHouseMaintain(String names) {
        Map<String, Object> houseMap = new HashMap<>();
        if (names == null) {
            houseMap.put("code", -9);
            houseMap.put("msg", "搜索的参数不能为空");
        } else {
            List<House> houseList = houseService.searchHouseMaintain(names);
            if (houseList.size() == 0) {
                houseMap.put("code", -1);
                houseMap.put("msg", "房间已维修或空闲中！");
                houseMap.put("data", houseList);
            } else {
                houseMap.put("code", 0);
                houseMap.put("msg", "搜索房间成功！");
                houseMap.put("data", houseList);
            }
        }
        return houseMap;
    }

    //更新住房状态之维修
    @RequestMapping("/updateMaintainState")
    @ResponseBody
    public Map<String, Object> updateMaintainState(String name) {
        Map<String, Object> customerMap = new HashMap<>();
        int housestate = houseService.updateMaintainHouse(name);
        if (housestate == 0) {
            customerMap.put("code", -1);
            customerMap.put("message", "房间已维修成功");
        } else {
            customerMap.put("code", 200);
            customerMap.put("message", "维修成功");
        }
        return customerMap;
    }

    //更新住房状态之打扫
    @RequestMapping("/updateCleanState")
    @ResponseBody
    public Map<String, Object> updateCleanState(String name) {
        Map<String, Object> customerMap = new HashMap<>();
        int housestate = houseService.updateCleanHouse(name);
        if (housestate == 1) {
            customerMap.put("code", 200);
            customerMap.put("message", "打扫成功！");
        } else {
            customerMap.put("code", -1);
            customerMap.put("message", "房间已经打扫过啦！");
        }
        return customerMap;
    }

    //获取所有打扫房间信息
    @RequestMapping("/queryBySatClean")
    @ResponseBody
    public Map<String, Object> queryBySateClean(@RequestParam("page") Integer pageNumber, @RequestParam("limit") Integer pageSize) {
        int number;
        int size;
        if (pageNumber == null) {
            number = 1;
        } else {
            number = pageNumber;
        }
        if (pageSize == null) {
            size = 10;
        } else {
            size = pageSize;
        }
        //添加分页功能
        PageData<House> houseList = houseService.queryBySateClean(number, size);
        Map<String, Object> house = new HashMap<>();
        if (houseList.getList().size() == 0) {
            house.put("code", -1);
            house.put("msg", "没有未打扫客房信息");
            house.put("data", houseList);
        } else {
            house.put("code", 0);
            house.put("data", houseList);
            house.put("msg", "获取数据成功！");
        }
        return house;
    }

    //获取所有查询维修房间信息
    @RequestMapping("/queryBySateMaintain")
    @ResponseBody
    public Map<String, Object> queryBySateMaintain(@RequestParam("page") Integer pageNumber, @RequestParam("limit") Integer pageSize) {
        int number;
        int size;
        if (pageNumber == null) {
            number = 1;
        } else {
            number = pageNumber;
        }
        if (pageSize == null) {
            size = 10;
        } else {
            size = pageSize;
        }
        //添加分页功能
        PageData<House> houseList = houseService.queryBySateMaintain(number, size);
        Map<String, Object> house = new HashMap<>();
        if (houseList.getList().size() == 0) {
            house.put("code", -1);
            house.put("msg", "没有待维修客房信息");
            house.put("data", houseList);
        } else {
            house.put("code", 0);
            house.put("data", houseList);
            house.put("msg", "获取数据成功！");
        }
        return house;
    }
}
