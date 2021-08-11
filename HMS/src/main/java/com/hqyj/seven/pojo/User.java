package com.hqyj.seven.pojo;

/**
 * Created by IntelliJ IDEA.
 * @File User.java
 * @Auth liuxing
 * @Date 2021/8/11 16:44
 * @Email liuxing997@foxmail.com
 */
public class User {
    private int id;
    private String name;
    private String password;
    private String phone;
    private String state;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", state='" + state + '\'' +
                '}';
    }

    public User(int id, String name, String password, String phone, String state) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.state = state;
    }
}
