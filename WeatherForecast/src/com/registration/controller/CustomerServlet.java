package com.registration.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.registration.dao.CustomerDao;
import com.registration.model.Customer;

@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CustomerDao customerdao=new CustomerDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("home.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("psw");
		String lastname=request.getParameter("lastname");
		String firstname=request.getParameter("firstname");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		
		Customer customer=new Customer();
		customer.setEmail(email);
		customer.setPassword(password);
		customer.setLastname(lastname);
		customer.setFirstname(firstname);
		customer.setCity(city);
		customer.setState(state);
		
		try {
		customerdao.registerCustomer(customer);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		//response.sendRedirect("index.jsp");
		RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
		
	}

}
