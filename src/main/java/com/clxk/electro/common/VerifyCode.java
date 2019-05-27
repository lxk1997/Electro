package com.clxk.electro.common;

import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * @Description 生成验证码
 * @Author Clxk
 * @Date 2019/5/26 14:55
 * @Version 1.0
 */
public class VerifyCode {

    private static final char[] CHS = "23456789asdfghjkzxcvbnmqwertyuipSDAFGHJKLMNBCXZQWERTYUIP".toCharArray();
    private static final int[] FONT_STYLE = {Font.BOLD, Font.ITALIC, Font.PLAIN};
    private static final String[] FONT_TEXT = {"微软雅黑","Times New Roman","黑体","宋体"};

    public static BufferedImage getVerifyCode(int count, int width, int height, HttpSession session) {
        BufferedImage bf = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
        Graphics2D g = (Graphics2D) bf.getGraphics();
        g.setColor(new Color(238,238,238));
        g.fillRect(0,0,width,height);

        StringBuffer code = new StringBuffer();
        Random random = new Random();
        for (int i = 0; i < count; i++) {
            g.setColor(new Color(random.nextInt(237),random.nextInt(237),random.nextInt(237)));
            g.setFont(new Font(FONT_TEXT[random.nextInt(4)], FONT_STYLE[random.nextInt(3)], 25));
            int idx = random.nextInt(CHS.length);
            g.drawString(String.valueOf(CHS[idx]), 15 * i + 5, 23);
            code.append(CHS[idx]);
        }
        session.setAttribute("vcode", code.toString());
        return bf;
    }
}
