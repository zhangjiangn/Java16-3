package com.src.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.src.bean.Emp;

public class Test {
	public static Connection connection = null;// 创建数据库连接
	public static PreparedStatement preStatement = null; // 创建预编译语句对象
	public static ResultSet resultSet = null; // 创建结果集

	public static Connection getconnection() {

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
			String username = "scott";
			String password = "123";
			connection = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	/**
	 * @param args
	 * @throws SQLException 
	 * @throws SQLException
	 */
/*	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
				try {
		preStatement = getconnection()
				.prepareStatement("select * from emp");
		resultSet = preStatement.executeQuery();
		List<Emp> list = new ArrayList<Emp>();

		while (resultSet.next()) {
			Emp emp = new Emp();
			emp.setEmpno(resultSet.getInt("empno"));
			emp.setEname(resultSet.getString("ename"));
			emp.setJob(resultSet.getString("job"));
			emp.setSal(resultSet.getInt("sal"));
			emp.setComm(resultSet.getInt("comm"));
			list.add(emp);
		}
		for (Emp emp : list) {
			System.out.println(emp.getEmpno() + "---" + emp.getEname()
					+ "---" + emp.getJob() + "---" + emp.getSal() + "---"
					+ emp.getComm());
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		preStatement = getconnection().prepareStatement("select * from emp");
		resultSet = preStatement.executeQuery();
		List<Object[]> list = new ArrayList<Object[]>();
		while (resultSet.next()) {
			Object[] object = new Object[5];
			object[0] = resultSet.getInt("empno");
			object[1] = resultSet.getString("ename");
			object[2] = resultSet.getString("job");
			object[3] = resultSet.getInt("sal");
			object[4] = resultSet.getInt("comm");
			list.add(object);
		}
		for (Object[] o : list) {
			System.out.println(o[0] + "---" + o[1] + "---" + o[2] + "---"
					+ o[3] + "---" + o[4]);
			// System.out.println(o[0]);
		}
		resultSet.close();
		preStatement.close();
		connection.close();
	}*/
	public static void main(String[] args) throws SQLException {
		preStatement = getconnection().prepareStatement("update emp set ename = ? where empno = ?");
		preStatement.setString(1, "JIANG");
		preStatement.setInt(2, 7934);
		preStatement.executeUpdate();
		try {
			preStatement = getconnection()
					.prepareStatement("select * from emp");
			resultSet = preStatement.executeQuery();
			List<Emp> list = new ArrayList<Emp>();

			while (resultSet.next()) {
				Emp emp = new Emp();
				emp.setEmpno(resultSet.getInt("empno"));
				emp.setEname(resultSet.getString("ename"));
				emp.setJob(resultSet.getString("job"));
				emp.setSal(resultSet.getInt("sal"));
				emp.setComm(resultSet.getInt("comm"));
				list.add(emp);
			}
			for (Emp emp : list) {
				System.out.println(emp.getEmpno() + "---" + emp.getEname()
						+ "---" + emp.getJob() + "---" + emp.getSal() + "---"
						+ emp.getComm());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
