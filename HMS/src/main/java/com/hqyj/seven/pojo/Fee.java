package com.hqyj.seven.pojo;

public class Fee {
    private  int feeId;
    private  int enterId;
    private  String direct;
    private  int coustomerId;
    private  double money;
    private  int houseId;
    private  String description;
    private int userId;
    private  String fee_type;

    public int getFeeId() {
        return feeId;
    }

    public void setFeeId(int feeId) {
        this.feeId = feeId;
    }

    public int getEnterId() {
        return enterId;
    }

    public void setEnterId(int enterId) {
        this.enterId = enterId;
    }

    public String getDirect() {
        return direct;
    }

    public void setDirect(String direct) {
        this.direct = direct;
    }

    public int getCoustomerId() {
        return coustomerId;
    }

    public void setCoustomerId(int coustomerId) {
        this.coustomerId = coustomerId;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFee_type() {
        return fee_type;
    }

    public void setFee_type(String fee_type) {
        this.fee_type = fee_type;
    }

    public Fee(int enterId, String direct, int coustomerId, double money, int houseId, String description, int userId, String fee_type) {
        this.enterId = enterId;
        this.direct = direct;
        this.coustomerId = coustomerId;
        this.money = money;
        this.houseId = houseId;
        this.description = description;
        this.userId = userId;
        this.fee_type = fee_type;
    }

    @Override
    public String toString() {
        return "Fee{" +
                "feeId=" + feeId +
                ", enterId=" + enterId +
                ", direct='" + direct + '\'' +
                ", coustomerId=" + coustomerId +
                ", money=" + money +
                ", houseId=" + houseId +
                ", description='" + description + '\'' +
                ", userId=" + userId +
                ", fee_type='" + fee_type + '\'' +
                '}';
    }
}
