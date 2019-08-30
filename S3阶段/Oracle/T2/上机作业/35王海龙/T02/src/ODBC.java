import java.awt.print.Paper;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.ConnectionEvent;

import bean.Emp;


public class ODBC {

	public static Connection conn=null;
	
	public static Connection getConnection(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url ="jdbc:oracle:thin:127.0.0.1:1521:orcl";
			conn = DriverManager.getConnection(url, "scott", "123");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return conn;
	}
	
//	public static void main(String[] args){
//		try {
//			PreparedStatement ps = getConnection().prepareStatement("select * from emp where ");
//			ResultSet res = ps.executeQuery();
//			List<Emp> list = new ArrayList<Emp>(); 			
//			while (res.next()) {
//				Emp emp = new Emp();
//				emp.setEmpno(res.getInt(1));
//				emp.setEname(res.getString(2));
//				emp.setJob(res.getString(3));
//				emp.setSal(res.getInt(6));
//				list.add(emp);
//			}			
//			for (Emp emp : list) {
//				System.out.println(emp.getEmpno()+"----"+emp.getEname()+"----"+emp.getJob()+"----"+emp.getSal());
//			}
//			
			
			
//			List<Object[]> list = new ArrayList<Object[]>();
//			while (res.next()) {
//				Object[] objects = new Object[4];
//				objects[0] = res.getInt(1);
//				objects[1] = res.getString(2);
//				objects[2] = res.getString(3);
//				objects[3] = res.getInt(6);
//				list.add(objects);
//			}
//		for (Object[] objects : list) {
//			System.out.println(objects[0]+"----"+objects[1]+"----"+objects[2]+"----"+objects[3]);
//		}
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}

	//ÐÞ¸Ä
	public static void main(String[] args){
		PreparedStatement ps;
		try {
			ps = getConnection().prepareStatement("update emp set ename=? where empno=?");
			ps.setString(1, "zhangyue");
			ps.setInt(2, 7782);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
}
