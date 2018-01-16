package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Od {
	public static Connection getConnection() {
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String nam="scott";
		String pwd="123";
		Connection con=null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			 con=DriverManager.getConnection(url,nam,pwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
		
		 
	}
	public static void main(String[] args) {
		 System.out.println("连接成功"+getConnection());
	}

}
