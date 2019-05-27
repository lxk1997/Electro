package com.clxk.electro.controller;

import com.clxk.electro.common.VerifyCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.resource.HttpResource;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * @Description 验证码controller
 * @Author Clxk
 * @Date 2019/5/26 17:21
 * @Version 1.0
 */
@Controller
@RequestMapping("/verifycode")
public class VerifyCodeController {

    @RequestMapping("/getCode.do")
    public void getVerifyCode(HttpServletResponse response, HttpSession session) throws IOException {
        BufferedImage image = VerifyCode.getVerifyCode(4,70,35,session);
        ImageIO.write(image,"jpg", response.getOutputStream());
    }
}
