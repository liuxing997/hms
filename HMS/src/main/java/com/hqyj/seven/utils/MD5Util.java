package com.hqyj.seven.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * Created by IntelliJ IDEA.
 * @File MD5Util.java
 * @Auth liuxing
 * @Date 2021/8/11 16:42
 * @Email liuxing997@foxmail.com
 */
public class MD5Util {

    public static String md5Hash(String password,String salt){
        ByteSource saltBytes = ByteSource.Util.bytes(salt);
        SimpleHash simpleHash = new SimpleHash("MD5",password,saltBytes,1000);
        return simpleHash.toString();
    }
}
