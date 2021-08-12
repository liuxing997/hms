package com.hqyj.seven.controller;


import com.hqyj.seven.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/house")
@Controller
public class HouseController {
    @Autowired
    private HouseService  houseService;


    @RequestMapping("/deleteHouse")
    public int deleteHousei(){

        return 0;
    }
}
