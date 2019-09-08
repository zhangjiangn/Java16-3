package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Emp;

public class Test {
	public static Connection con = null;
	
	public static Connection getConnection(){
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url="jdbc:oracle:thin:@:1521:crol";
			String name = "scott";
			String password = "123";
			con = DriverManager.getConnection(url,name,password);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return con;
		
	}
	
	
	
	
	public static void main(String[] args) throws Exception {
		PreparedStatement ps = getConnection().prepareStatement("sql");
		ResultSet set = ps.executeQuery(); 
		List<Emp> list = new ArrayList<Emp>();
		while (set.next()) {
			Emp emp = new Emp();
			emp.getEname();
			
		}
		
	
		

	}

}
