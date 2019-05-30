package com.clxk.electro.common;

import java.util.UUID;

/**
 * @Description 工具包
 * @Author Clxk
 * @Date 2019/5/28 21:44
 * @Version 1.0
 */
public class Utils {

    public static String escapeXml(String s) {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '<' || s.charAt(i) == '>' || s.charAt(i) == ' ' || s.charAt(i) == '\'' || s.charAt(i) == '"') {
                builder.append("a");
            } else {
                builder.append(s.charAt(i));
            }
        }
        return builder.toString();
    }
    public static String uuid() {
        return UUID.randomUUID().toString().replace("-","");
    }


}
