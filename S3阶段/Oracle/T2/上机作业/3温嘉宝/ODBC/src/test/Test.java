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
	private static Connection conn =null;
	
	public static Connection getConnection(){
		
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				String url="jdbc:oracle:thin:@localhost:1521:orcl";
				String name="scott";
				String pwd="123";
				conn = DriverManager.getConnection(url, name, pwd);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		return conn;
	}
	
	/**
	 * ÐÞ¸Ä
	 */
//	public static void update() throws SQLException{
//		PreparedStatement ps = getConnection().prepareStatement("update emp set ename=? where empno=?");
//		ps.setString(1, "zhangsan");
//		ps.setString(2, "7369");
//		ps.executeUpdate();
//	}
	
	public static void main(String[] args) throws SQLException {

		PreparedStatement ps = getConnection().prepareStatement("select * from emp");
		ResultSet rs = ps.executeQuery();
//		List<Emp> list = new ArrayList<Emp>();
//		while (rs.next()) {
//			Emp emp = new Emp();
//			emp.setEmpno(rs.getInt("empno"));
//			emp.setEname(rs.getString(2));
//			emp.setJob(rs.getString(3));
//			emp.setSal(rs.getInt("sal"));
//			list.add(emp);
//		}
//		for (Emp emp : list) {
//			System.out.println(emp.getEmpno()+"--"+emp.getEname()+"--"+emp.getJob()+"--"+emp.getSal());
//		}
	
		List<Object[]> list = new ArrayList<Object[]>();
		while(rs.next()){
			Object[] obj = new Object[4];
			obj[0] = rs.getInt(1);
			obj[1] = rs.getString(2);
			obj[2] = rs.getString(3);
			obj[3] = rs.getInt(6);
			list.add(obj);
		}
		for (Object[] objects : list) {
			System.out.println(objects[0]+"-----"+objects[1]+"-----"+objects[2]+"-----"+objects[3]);
		}
		
		
		//update();
	}

}
