package com.hqyj.seven.pojo;

import java.util.List;

public class Enter {
    private int enter_id;
    private String house_id;
    private int customer_id;
    private  String customer_info;
    private String start_time;
    private String end_time_estimate;
    private String end_time_actual;
    private float fee_total;
    private  int fee_info;
    private int user_id;
    private String state;
    private float price;

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

    public String getHouse_id() {
        return house_id;
    }

    public void setHouse_id(String house_id) {
        this.house_id = house_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getCustomer_info() {
        return customer_info;
    }

    public void setCustomer_info(String customer_info) {
        this.customer_info = customer_info;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time_estimate() {
        return end_time_estimate;
    }

    public void setEnd_time_estimate(String end_time_estimate) {
        this.end_time_estimate = end_time_estimate;
    }

    public String getEnd_time_actual() {
        return end_time_actual;
    }

    public void setEnd_time_actual(String end_time_actual) {
        this.end_time_actual = end_time_actual;
    }

    public float getFee_total() {
        return fee_total;
    }

    public void setFee_total(float fee_total) {
        this.fee_total = fee_total;
    }

    public int getFee_info() {
        return fee_info;
    }

    public void setFee_info(int fee_info) {
        this.fee_info = fee_info;
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Enter{" +
                "enter_id=" + enter_id +
                ", house_id='" + house_id + '\'' +
                ", customer_id=" + customer_id +
                ", customer_info='" + customer_info + '\'' +
                ", start_time='" + start_time + '\'' +
                ", end_time_estimate='" + end_time_estimate + '\'' +
                ", end_time_actual='" + end_time_actual + '\'' +
                ", fee_total=" + fee_total +
                ", fee_info=" + fee_info +
                ", user_id=" + user_id +
                ", state='" + state + '\'' +
                ", price=" + price +
                ", customers=" + customers +
                '}';
    }
}
