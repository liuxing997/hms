package com.hqyj.seven.pojo;

import java.util.Date;
import java.util.List;

public class Enter {
    private int enter_id;
    private int house_id;
    private int customer_id;
    private int customer_info;
    private Date start_time;
    private Date end_time_estimate;
    private Date end_time_actual;
    private double fee_total;
    private  String fee_info;
    private int user_id;
    private String state;
    private double price;

    private String start_time1;
    private String end_time_estimate1;
    private String end_time_actual1;

    public Enter(int house_id, int customer_id, int customer_info, Date start_time, Date end_time_estimate, Date end_time_actual, double fee_total, String fee_info, int user_id, String state, double price) {
        this.house_id = house_id;
        this.customer_id = customer_id;
        this.customer_info = customer_info;
        this.start_time = start_time;
        this.end_time_estimate = end_time_estimate;
        this.end_time_actual = end_time_actual;
        this.fee_total = fee_total;
        this.fee_info = fee_info;
        this.user_id = user_id;
        this.state = state;
        this.price = price;
    }

    public String getStart_time1() {
        return start_time1;
    }

    public void setStart_time1(String start_time1) {
        this.start_time1 = start_time1;
    }

    public String getEnd_time_estimate1() {
        return end_time_estimate1;
    }

    public void setEnd_time_estimate1(String end_time_estimate1) {
        this.end_time_estimate1 = end_time_estimate1;
    }

    public String getEnd_time_actual1() {
        return end_time_actual1;
    }

    public void setEnd_time_actual1(String end_time_actual1) {
        this.end_time_actual1 = end_time_actual1;
    }

    private List<Customer> customers;

    public List<Customer> getCustomers() {
        return customers;
    }

    public void setCustomers(List<Customer> customers) {
        this.customers = customers;
    }

    public int getEnter_id() {
        return enter_id;
    }

    public void setEnter_id(int enter_id) {
        this.enter_id = enter_id;
    }

    public double getFee_total() {
        return fee_total;
    }

    public void setFee_total(double fee_total) {
        this.fee_total = fee_total;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }



    public int getCustomer_info() {
        return customer_info;
    }

    public void setCustomer_info(int customer_info) {
        this.customer_info = customer_info;
    }

    public int getHouse_id() {
        return house_id;
    }

    public void setHouse_id(int house_id) {
        this.house_id = house_id;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public Date getEnd_time_estimate() {
        return end_time_estimate;
    }

    public void setEnd_time_estimate(Date end_time_estimate) {
        this.end_time_estimate = end_time_estimate;
    }

    public Date getEnd_time_actual() {
        return end_time_actual;
    }

    public void setEnd_time_actual(Date end_time_actual) {
        this.end_time_actual = end_time_actual;
    }



    public void setFee_total(float fee_total) {
        this.fee_total = fee_total;
    }



    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getFee_info() {
        return fee_info;
    }

    public void setFee_info(String fee_info) {
        this.fee_info = fee_info;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Enter(int house_id, int customer_id, int customer_info, Date start_time, Date end_time_estimate, Date end_time_actual, double fee_total, String fee_info, int user_id, String state, double price, String start_time1, String end_time_estimate1, String end_time_actual1, List<Customer> customers) {
        this.enter_id = enter_id;
        this.house_id = house_id;
        this.customer_id = customer_id;
        this.customer_info = customer_info;
        this.start_time = start_time;
        this.end_time_estimate = end_time_estimate;
        this.end_time_actual = end_time_actual;
        this.fee_total = fee_total;
        this.fee_info = fee_info;
        this.user_id = user_id;
        this.state = state;
        this.price = price;
        this.start_time1 = start_time1;
        this.end_time_estimate1 = end_time_estimate1;
        this.end_time_actual1 = end_time_actual1;
        this.customers = customers;
    }

    public Enter() {
    }
}
