package com.clxk.electro.common;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;

/**
 * @Description 工具包
 * @Author Clxk
 * @Date 2019/5/28 21:44
 * @Version 1.0
 */
public class Utils {

    public static String escapeXml(String s) {
        if(s == null) return null;
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '<' || s.charAt(i) == '>' || s.charAt(i) == '|' || s.charAt(i) == '\'' || s.charAt(i) == '"') {
                builder.append(" ");
            } else {
                builder.append(s.charAt(i));
            }
        }
        return builder.toString();
    }
    public static String uuid() {
        return UUID.randomUUID().toString().replace("-","");
    }

    public static boolean isDouble(String str) {
        try{
            Double.valueOf(str);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    public static boolean isInteger(String str) {
        try{
            Integer.valueOf(str);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static Date getDate(String str) {
        try {
            return new SimpleDateFormat("yyyy-MM-dd").parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String saveFile(MultipartFile file, String path) {
        String filename = file.getOriginalFilename();
        String savename = Utils.uuid() + "_" + filename;
        int code = filename.hashCode();
        String s = Integer.toHexString(code);
        String savepath = path + s.charAt(0) + "\\" + s.charAt(1) + "\\";
        File f = new File(savepath);
        f.mkdirs();
        FileOutputStream outputStream = null;
        try {
            outputStream = new FileOutputStream(savepath+savename);
            System.out.println("path: " + savepath + savename);
            outputStream.write(file.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "/" + s.charAt(0) + "/" + s.charAt(1) + "/" + savename;
    }

    public static boolean matchEmail(String email) {
        return email.matches("^[a-z0-9A-Z]+[- | a-z0-9A-Z . _]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-z]{2,}$");
    }


}
