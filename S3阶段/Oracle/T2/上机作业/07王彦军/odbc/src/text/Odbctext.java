package text;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Emp;

public class Odbctext {

	public static Connection connection = null;
	public static Connection getConnection(){
		
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
				String username = "scott";
				String password = "123";
				connection = DriverManager.getConnection(url, username, password);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		return connection;
	}
	public void select() throws Exception {
		getConnection();
		String sql = "select * from emp";
		PreparedStatement ps = connection.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Emp> list = new ArrayList<Emp>();
		while (rs.next()) {
			Emp emp = new Emp();
			emp.setEmpno(rs.getInt("empno"));
			emp.setEname(rs.getString("ename"));
			emp.setSal(rs.getInt("sal"));
			list.add(emp);
		}
		for (Emp emp : list) {
			System.out.println(emp.getEmpno()+"----"+emp.getEname()+"----"+emp.getSal());
		}
	}
	
	public void select1() throws Exception{
		getConnection();
		String sql = "select * from emp";
		PreparedStatement ps = connection.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Object[]> list = new ArrayList<Object[]>();
		while (rs.next()) {
			Object[] obj = new Object[3];
			obj[0] = rs.getInt(1);
			obj[1] = rs.getString(2);
			obj[2] = rs.getString(6);
			list.add(obj);
		}
		for (Object[] o : list) {
			System.out.println(o[0]+"----"+o[1]+"----"+o[2]);
		}
	}
	
	public void insert() throws Exception{
		getConnection();
		String sql = "insert into emp(empno,ename,sal) values('1234','zhangsan','900')";
		PreparedStatement ps = connection.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		System.out.println("zhixingle");
	}
	
	
	public void update() throws Exception{
		getConnection();
		String sql = "update emp set ename='lisi' where empno=1234";
		PreparedStatement ps = connection.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		System.out.println("zhixingle");
	}
	
	
	public void delect() throws Exception{
		getConnection();
		String sql = "delete emp where empno = 1234";
		PreparedStatement ps = connection.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		System.out.println("zhixingle");
	}
	
}
