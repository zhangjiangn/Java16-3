package test;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import po.Emp;

public class Test {
	public static Connection connection =null;
	
	public static Connection getConnection(){
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:127.0.0.1:1521:oracl";
			String userName = "scott";
			String password = "123";
			connection = DriverManager.getConnection(url, userName, password);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public static void main(String[] args) throws SQLException {
//		PreparedStatement ps = getConnection().prepareStatement("select * from emp");
//		ResultSet rs = ps.executeQuery();
		//实体类查询
//		List<Emp> list = new ArrayList<Emp>();
//		while (rs.next()) {
//			Emp emp = new Emp();
//			emp.setEmpno(rs.getInt("empno"));
//			emp.setEname(rs.getString(2));
//			emp.setJob(rs.getString(3));
//			emp.setSal(rs.getInt("sal"));
//			list.add(emp);
//		}
//	for (Emp emp : list) {
//		System.err.println(emp.getEmpno()+"**"+emp.getEname()+"**"+emp.getJob()+"**"+emp.getSal());
//	}
		//obj查询
//		List<Object[]> list = new ArrayList<Object[]>();
//		while (rs.next()) {
//			Object[] obj = new Object[4];
//			obj[0] = rs.getInt(1);
//			obj[1] = rs.getString(2);
//			obj[2] = rs.getString(3);
//			obj[3] = rs.getInt(6);
//			list.add(obj);
//		}
//		for (Object[] o : list) {
//			System.out.println(o[0]+"**"+o[1]+"**"+o[2]+"**"+o[3]);
//		}
		//修改
		PreparedStatement ps = getConnection().prepareStatement("update emp set ename = ? where empno = ?");
		ps.setString(1, "helaoji");
		ps.setInt(2, 7934);
		ps.executeUpdate();
	}
}
