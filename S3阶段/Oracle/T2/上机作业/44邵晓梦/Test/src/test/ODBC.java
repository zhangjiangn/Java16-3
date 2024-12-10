package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Emp;

public class ODBC {
	
	public static Connection conn = null;
	
	public static Connection getConnection(){
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:127.0.0.1:1521:orcl";
			String user ="scott";
			String password = "123";
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static void main(String[] args) throws Exception {
		PreparedStatement ps = getConnection().prepareStatement("select * from emp");
		ResultSet rs = ps.executeQuery();
//		List<Emp> list = new ArrayList<Emp>();
//		while(rs.next()){
//			Emp emp = new Emp();
//			emp.setEmpno(rs.getInt("empno"));
//			emp.setEname(rs.getString("ename"));
//			emp.setJob(rs.getString("job"));
//			emp.setMgr(rs.getInt("mgr"));
//			emp.setHiredate(rs.getString("hiredate"));
//			emp.setSal(rs.getInt("sal"));
//			emp.setComm(rs.getInt("comm"));
//			list.add(emp);
//		}
//		for (Emp emp : list) {
//			System.out.println(emp.getEmpno()+"-----"+emp.getEname()+"-----"+emp.getHiredate());
//		}
		List<Object[]> list = new ArrayList<Object[]>();
		while(rs.next()){
			Object[] obj = new Object[3];
			obj[0] = rs.getInt(1);
			obj[1] = rs.getString(2);
			obj[2] = rs.getString(5);
			list.add(obj);
		}
		for (Object[] objects : list) {
			System.out.println(objects[0]+"-----"+objects[1]+"-----"+objects[2]);
		}
	}
	
	/**
	 * ÐÞ¸Ä
	 */
//	public static void update() throws SQLException{
//		PreparedStatement ps = getConnection().prepareStatement("update emp set ename=? where empno=?");
//		ps.setString(1, "zhangsan");
//		ps.setString(2, "7876");
//		ps.executeUpdate();
//	}
//
//	public static void main(String[] args) throws SQLException {
//		update();
//	}
}
