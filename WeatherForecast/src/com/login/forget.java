package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.login.dao.ForgetDao;


/**
 * Servlet implementation class forget
 */
@WebServlet("/forget")
public class forget extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("pass");
		String cpassword=request.getParameter("cpass");
			
		ForgetDao dao=new ForgetDao();
		
		if(password.equals(cpassword)) {
			if(dao.update(email, password)) {
			response.sendRedirect("home.jsp");
			}
			else {
				response.sendRedirect("error.jsp");
			}
		}else {
			response.sendRedirect("error.jsp");
		}
		
	}
}
