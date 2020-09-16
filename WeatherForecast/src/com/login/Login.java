package com.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDao;


@WebServlet("/Login")
public class Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("uname");
		String psw=request.getParameter("psw");
		
		LoginDao dao=new LoginDao();
		
		
		if(dao.check(uname, psw)) {
			
			HttpSession session=request.getSession();
			session.setAttribute("username", uname);
			response.sendRedirect("AfterLoginHome.jsp");
		}
		else {
			response.sendRedirect("home.jsp");
		}
	}

}