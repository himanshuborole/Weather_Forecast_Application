package com.registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.registration.model.Customer;

public class CustomerDao {
	
	public int registerCustomer(Customer customer) throws ClassNotFoundException{
		String INSERT_USER_SQL="INSERT INTO customer"+"(email,password,last_name,first_name,city,state)VALUES "+"(?,?,?,?,?,?);";
		
		int result=0;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		try(Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/weatherproject","root","system");
			
			PreparedStatement preparedStatement=connection.prepareStatement(INSERT_USER_SQL))
				{
					
					preparedStatement.setString(1, customer.getEmail());
					preparedStatement.setString(2, customer.getPassword());
					preparedStatement.setString(3, customer.getLastname());
					preparedStatement.setString(4, customer.getFirstname());
					preparedStatement.setString(5, customer.getCity());
					preparedStatement.setString(6, customer.getState());
					
					System.out.println(preparedStatement);
					result=preparedStatement.executeUpdate();
					}catch(SQLException e) {
						e.printStackTrace();
					}
		return result;
	}

}
