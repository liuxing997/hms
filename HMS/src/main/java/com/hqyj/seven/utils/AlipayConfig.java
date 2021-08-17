package com.hqyj.seven.utils;

/**
 * Created by IntelliJ IDEA.
 * @File AlipayConfig.java
 * @Auth liuxing
 * @Date 2021/8/17 00:30
 * @Email liuxing997@foxmail.com
 */
public class AlipayConfig {
    /*支付宝支付配置类*/
    // 应用ID
    public static String app_id = "2021000117643189";
    // 商户私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC593QtLzgNsCa1O9Xg6Md2wyZ9GXQveTFsT0Yqi8fyXHWFxI/h18LIbTDZKffYkZU9wvR6RT3uYRn0uCduiM9FxISfJSDAuqx7RrsMhtOO40DIBSnT5jrxVAbluFaEL8j4qFc17bshArYWyzmPzDLSkfypYdbBfIAm0O8sqmF01yiV9KgZb7El2T4FuUPnNi7MCgv4QVuKrjp07KpaeJ8ZAxerHQa8D8OUPUuHhbg5lpHG+xIuA803NxfrpGkuc1OKyKNiH2ffcnMlrFCGaPkmDgk0cFjFJC+WXEvchFCF/sWAQ1XZM01sO2jVdGE5eTsN0Mq3eOpnTRKJPwNEn58FAgMBAAECggEAMcBW72OrjlXq9R9t576+5jHtURiHMdAtfblznxxIQLmlo0Tj7VqovLAhmmeU6/Z+w8gtWay+ldCafhLqUbL+KL8bb+wh6A3I6S4SCpbjcF2xzhE7kHoOmNOPCNQZKUITdRqsQjw4jOtJxa1W1/acPiNaQgJvztG9AyVwZzWp3vTf2e67TG7HAB4dlkeG9Ibn30xHrVivLWhnnOA6/gFuvRtN13neBS3bMABFY562rK9thg7hUWQL0Hf9Y40kOdLtj6nDm49Etmaq/5enNfOw97j4k6G3eVD6eb/MdW6tqrKodJ0ZQAx2MLnhYQ7GsECAQ8QGyXAgRvwLamhqHzsO4QKBgQDp9H5gnUxQgHJiURu42hW+jjQZoputQVq1PMa7bQJsVGj6SKgvlTodl4Ta8pTiBLvxl+ImrB5qaICAN+ygEK5DxXpimKBKhe9MVeL3CwTnX6mcpaz/43fxm50Gotz2gMGTqthC7FFWSgX63rgYQj/dnCWqsemZfZtv5FHqF2LOaQKBgQDLfV/VhXtT7hz+8ljQClcGoRdjird4yXEdy8vRUDAPBEqGeLKyokJKE2OhmV0GsNC5IUsgnz0inSGIXO+qwuBFtoKUSSQADNnvMUhhplV/r3+uCNaLx7/W+R9XmsNiWidoXVTLc3qwUNulbx5oX0SwGLqyQkls0Fd/TZmO3cLwPQKBgB//CyWlfaFo37vogdUXJnAoPKHg5k+cp44v4LITZ4hvRugr9ayESS1w4n+bO5dptFaHQiut0H8XCbP/cgI2Jc8o++LuIsXuaVrUSDUnMaV/JNBCrFVWw7msYZ5ducCQvWi3rdoBPeKCPy0fNqhCrz9csp4UtPEEB7UW0cklJ6M5AoGAXofOtlV9Fl9ebv1MTtEO3pCFWgO9+cmy18Gt3H3g5Yj7yf5WHXANVXYuaYriUVJglDAoQ25WKzdNtZhe6jf/kcMYZCSaKb/OmjSNyHdJ7rgrm0CV0nen4gj3C25k59KzzeLVmnH6A+B8OR0mxhvDv/6s9FSg4YDjtMrq1BinD40CgYBTNaViBSjprl4euG5lCRR2/0rAJjcLTBy8dDLW8HAEgqjz6gKF+2XXgZumIjsxHivVC9rRzNP2yUfHjZHkRAMb4sbuPOz+UJLoFNsEHBS5KSOvaaeUWprM+9pwGaOB+QikPKTFfEg3UTesWExXgUCoFg+sdLcM2bbLLZYkh6P8Sg==";
    // 支付宝公钥
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmoEIVKrihgB7pXL6oAWTRMVR0o75QdeCsamGBsXF18XcJIawkEdkThfEOYeF45tMXF8WKjtM50d76KEgVWgcYZVoSHyEQQeCw8+oLz7cU7AKXPFoyT8XmNADTAgZbFBzqZrifYpQN1HP9/+2gizC13FnC5JNr9+a7nCe80RQwI1kRkrAwgNoAlc2RqjJKQHvKaJM2PmdwtIANPMVv8qFFptMVHKKWZRS6+LdeE1mbDBtCmSLv0Tbk/u9lTLkK+vvHE2HzJzLl0i6JNbmGbomJU8ccTJTDrs+hr+iE5NsUR3JsB7T/hLEDe/R86Fn5fMOR1/wWszn11KK7W5L5WCyHQIDAQAB";
    // 服务器异步通知页面路径
    public static String notify_url = "http://ys2srt.natappfree.cc/HMS_war_exploded/notifyUrl";
    // 页面跳转同步通知页面路径
    public static String return_url = "http://ys2srt.natappfree.cc/HMS_war_exploded/returnUrl";
    // 签名方式
    public static String sign_type = "RSA2";
    // 字符编码格式
    public static String charset = "utf-8";
    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";//沙箱环境
    //正式环境
    //public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";
    // 支付宝网关
    public static String log_path = "C:\\";
}
