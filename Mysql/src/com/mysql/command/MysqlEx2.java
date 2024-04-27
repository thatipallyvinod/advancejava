package com.mysql.command;
import java.sql.*;
public class MysqlEx2 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// Load the Driver
		Class.forName("com.mysql.cj.jdbc.Driver");
		//Create Connection 
		Connection c=DriverManager.getConnection("jdbc:mysql://localhost/khasim","root","root");
		// Creating Statement object //Making resultSet object to Scrollable
		Statement s=c.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		
		ResultSet set=s.executeQuery("select * from emp");
		
		//Reading all Records in BackWord Direction
		set.afterLast();
		while(set.previous()) {
			System.out.println(set.getInt(1)+" "+set.getString(2)+" "+set.getFloat(3));
		//Cursor Sending to First
			set.first();
			System.out.println(set.getInt(1)+" " +set.getString(2)+" "+set.getFloat(3));
			
			//Cursor Sending to Last
			set.last();
			System.out.println(set.getInt(1)+" "+set.getString(2)+" "+set.getFloat(3));
			
		//cursor Sending to Specific LOcation
			set.absolute(2);
			System.out.println(set.getInt(1)+" "+set.getString(2)+" "+set.getFloat(3));
			break;
		}
		 c.close();		
	}

}
