package com.hqyj.seven.pojo;

public class Customer {
    private int customer_id;
    private String name;
    private String card;
    private String phone;
    private String mobile;
    private Double remainder;

    public Customer() {
    }

    public Customer(int customer_id, String name, String card, String phone, String mobile, Double remainder) {
        this.customer_id = customer_id;
        this.name = name;
        this.card = card;
        this.phone = phone;
        this.mobile = mobile;
        this.remainder = remainder;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Double getRemainder() {
        return remainder;
    }

    public void setRemainder(Double remainder) {
        this.remainder = remainder;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "customer_id=" + customer_id +
                ", name='" + name + '\'' +
                ", card='" + card + '\'' +
                ", phone='" + phone + '\'' +
                ", mobile='" + mobile + '\'' +
                ", remainder=" + remainder +
                '}';
    }
}
