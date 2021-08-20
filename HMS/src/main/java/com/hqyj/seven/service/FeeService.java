package com.hqyj.seven.service;

import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.Fee;
import com.hqyj.seven.pojo.PageData;

import java.util.Map;

public interface FeeService {

    //插入缴费信息
    int insertFee(Fee fee);

    //查询已经缴费信息表
    PageData<Fee> queryByDirectPay(int pageNumber, int pageSize);

    //查询未缴费信息表
    PageData<Fee> queryByDirectNoPay(int pageNumber, int pageSize);

    //用id查询缴费
    PageData<Fee> queryAllId(int pageNumber, int pageSize, int id, String direct);

    Fee  queryOneByFeeId(int feeId);

    //查询本次缴费金额
    double paymentAmount(int feeId);

    //现金支付
    Map<String, Object> CashPayment(int feeId);
    //支付宝支付
    boolean payByAliPay(int feeId,double total_amount,String out_trade_no);

    //支付宝发起支付时更新订单表的支付状态为"支付宝支付中"和入住表的缴费流水号为商户订单号
    //支付宝支付完成时更新订单表的支付状态为"支付宝支付完成"和入住表的缴费流水号为支付宝交易号
    int updateFeeInfoByFeeId(int feeId,String out_trade_no,String Fee_type1,String Fee_type2);
}
