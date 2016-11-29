package com.szu.subject.ui.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	@RequestMapping("textloadid")
	public void queryUserID(HttpServletRequest req, HttpServletResponse rep)
			throws Exception {
		req.setCharacterEncoding("utf-8"); // 这里不设置编码会有乱码
		rep.setContentType("text/html;charset=utf-8");
		rep.setHeader("Cache-Control", "no-cache");
		PrintWriter out = rep.getWriter();
		
		String loadid = req.getParameter("loadid");
		String s="false";
		
		if(loadid == "2013150100") {
			s = "true";
			System.out.println(s);
			out.println(s);
		}
	}
}
