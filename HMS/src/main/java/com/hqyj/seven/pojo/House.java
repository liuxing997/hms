package com.hqyj.seven.pojo;

public class House {
    private int houseId;
    private  String houseName;
    private  int amount;
    private  double price;
    private int floorId;
    private  String  state;
    private  Integer customerId;

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getFloorId() {
        return floorId;
    }

    public void setFloorId(int floorId) {
        this.floorId = floorId;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    @Override
    public String toString() {
        return "House{" +
                "houseId=" + houseId +
                ", houseName='" + houseName + '\'' +
                ", amount=" + amount +
                ", price=" + price +
                ", floorId=" + floorId +
                ", state='" + state + '\'' +
                ", customerId=" + customerId +
                '}';
    }

    public House(int houseId, String houseName, int amount, double price, int floorId, String state, Integer customerId) {
        this.houseId = houseId;
        this.houseName = houseName;
        this.amount = amount;
        this.price = price;
        this.floorId = floorId;
        this.state = state;
        this.customerId = customerId;
    }
}

