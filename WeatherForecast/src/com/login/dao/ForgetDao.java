package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class ForgetDao {
	
	String sql="update customer set password=? where email=?";
	String url="jdbc:mysql://localhost:3306/weatherproject";
	String username="root";
	String password="system";
	public boolean update(String email,String pass) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(2, email);
			st.setString(1, pass);
			int i=st.executeUpdate();
			if(i>0)
			{
				return true;
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
	}

}
