package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import po.Emp;

public class Test {
	public static Connection connection = null;

	public static Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
			String user = "scott";
			String pas = "123";
			connection = DriverManager.getConnection(url, user, pas);
		} catch (Exception e) {

		}
		return connection;
	}

	public List<Emp> select() {
		List<Emp> emps = null;
		try {
			PreparedStatement preparedStatement = getConnection().prepareStatement("select * from emp");
			ResultSet resultSet = preparedStatement.executeQuery();
			emps = new ArrayList<Emp>();
			while (resultSet.next()) {
				Emp emp = new Emp();
				emp.setEmpno(resultSet.getInt(1));
				emp.setEname(resultSet.getString(2));
				emp.setJob(resultSet.getString(3));
				emp.setMgr(resultSet.getString(4));
				emp.setSal(resultSet.getInt(6));
				emps.add(emp);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return emps;

	}

	public List<Object[]> select1() {
		List<Object[]> objects = null;
		try {
			PreparedStatement preparedStatement = getConnection().prepareStatement("select * from emp");
			ResultSet resultSet = preparedStatement.executeQuery();
			objects = new ArrayList<Object[]>();
			while (resultSet.next()) {
				Object[] object = new Object[9];
				object[0] = resultSet.getInt(1);
				object[1] = resultSet.getString(2);
				object[2] = resultSet.getString(3);
				object[3] = resultSet.getString(4);
				object[4] = resultSet.getInt(6);
				objects.add(object);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return objects;
	}

	public int delete() {
		int a = 0;
		try {
			PreparedStatement preparedStatement = getConnection().prepareStatement("delete from emp where empno = 7934");
			preparedStatement.execute();
		} catch (Exception e) {
			a = 1;
		}
		return a;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Test test = new Test();
		int a = test.delete();
		List<Emp> emps = test.select();
		for (Emp emp : emps) {
			System.out.println(emp.getEname());
		}
		List<Object[]> objects = test.select1();
		for (Object[] objects2 : objects) {
			System.out.println(objects2[1]);
		}

	}

}
