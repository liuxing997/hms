package com.hqyj.seven.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.hqyj.seven.pojo.Enter;
import com.hqyj.seven.pojo.Fee;
import com.hqyj.seven.service.EnterService;
import com.hqyj.seven.service.FeeService;
import com.hqyj.seven.utils.AlipayConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 *
 * @File AlipayCallbackController.java
 * @Auth liuxing
 * @Date 2021/8/17 12:13
 * @Email liuxing997@foxmail.com
 */
@Controller
public class AlipayCallbackController {


    private FeeService feeService;

    private EnterService enterService;

    @Autowired
    public void setFeeService(FeeService feeService) {
        this.feeService = feeService;
    }

    @Autowired
    public void setEnterService(EnterService enterService) {
        this.enterService = enterService;
    }

    //异步回调
    @RequestMapping(value = "/notifyUrl", method = RequestMethod.POST)
    public void notifyUrl(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        //获取支付宝POST过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (
                Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = false; //调用SDK验证签名
        try {
            signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
        } catch (
                AlipayApiException e) {
            e.printStackTrace();
        }
        if (signVerified) {//验证成功
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

            //交易状态
            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");

            if (trade_status.equals("TRADE_FINISHED")) {
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序
                Enter enter = enterService.queryByOutTradeNo(out_trade_no);
                System.out.println("enter1:" + enter);
                if (enter != null) {
                    Fee fee = feeService.queryOneByFeeId(enter.getEnter_id());
                    System.out.println("fee1:" + fee);
                    if (fee != null ){
                        feeService.updateFeeInfoByFeeId(fee.getFeeId(), out_trade_no,"支付宝支付完成", "支付宝");
                    }
                }
                //注意：
                //退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
            } else if (trade_status.equals("TRADE_SUCCESS")) {
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序
                Enter enter = enterService.queryByOutTradeNo(out_trade_no);
                System.out.println("enter2:" + enter);
                if (enter != null) {
                    Fee fee = feeService.queryOneByFeeId(enter.getEnter_id());
                    System.out.println("fee2:" + fee);
                    if (fee != null ){
                        feeService.updateFeeInfoByFeeId(fee.getFeeId(), out_trade_no,"支付宝支付完成", "支付宝");
                    }
                }
                //注意：
                //付款完成后，支付宝系统发送该交易状态通知
            }

            out.println("success");

        } else {//验证失败
            out.println("fail");

            //调试用，写文本函数记录程序运行情况是否正常
            //String sWord = AlipaySignature.getSignCheckContentV1(params);
            //AlipayConfig.logResult(sWord);
        }
    }

    //同步回调
    @RequestMapping(value = "/returnUrl", method = RequestMethod.GET)
    public void returnUrl(HttpServletRequest request, HttpServletResponse response) throws IOException, AlipayApiException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        //获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        boolean signVerified = false; //调用SDK验证签名
        try {
            signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }

        if (signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

            //获取支付金额，转换为double类型
            double total_amount1 = Double.parseDouble(total_amount);

            //查询商户流水号在入住表中存在，存在更新订单表的支付状态为"支付宝支付完成"和入住表的缴费流水号为支付宝交易号
            //不存在更新订单表的支付状态为"支付宝支付取消"
            out.println("缴费成功！");
            response.sendRedirect("paidList");
            Enter enter = enterService.queryByOutTradeNo(out_trade_no);
            System.out.println("enter3:" + enter);
            if (enter != null) {
                Fee fee = feeService.queryOneByFeeId(enter.getEnter_id());
                System.out.println("fee2:" + fee);
                if (fee != null ){
                    feeService.updateFeeInfoByFeeId(fee.getFeeId(), trade_no,"支付宝支付中", "支付宝支付完成");
                }
            }
//            if (enter != null) {
//                //根据入住ID查找缴费信息
//                Fee fee = feeService.queryOneByFeeId(enter.getEnter_id());
//                if (fee != null) {
//                    //如果更新成功，对应支付也成功
//                    if (feeService.updateFeeInfoByFeeId(fee.getFeeId(), trade_no,"支付宝支付中", "支付宝") == 1) {
//                            out.println("缴费成功！");
//                            response.sendRedirect("paidList");
//                    } else {
//                        feeService.updateFeeInfoByFeeId(fee.getFeeId(), trade_no,"支付宝支付中", "支付宝支付取消");
//                        out.println("缴费失败！");
//                        response.sendRedirect("unpaidList");
//                    }
//                }
//            }
        } else {
            out.println("验签失败");
        }
    }
}
