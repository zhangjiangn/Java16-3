package db;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.DefaultEditorKit.InsertBreakAction;

import bean.Dept;

public class Dao {
	public static Connection con=null;
	public static Statement st;
	public static ResultSet rs;
public static Connection getConnection(){
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String name="scott";
	String pwd="123";
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		con=DriverManager.getConnection(url, name, pwd);

	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return con;
}
public static List<Dept> insert(){
	getConnection();
	String sql="select * from deptd";
	try {
		st=getConnection().createStatement();
		rs=st.executeQuery(sql);
		List<Dept> list=new ArrayList<Dept>();
		while (rs.next()) {
			Dept d=new Dept();
			d.setDid(rs.getInt("did"));
			d.setDname(rs.getString("dname"));
			d.setTel(rs.getInt("tel"));
			d.setRess(rs.getString("ress"));
			list.add(d);
			
		}
		for (Dept dept : list) {
			System.out.println(dept.getDid()+"     "+dept.getDname()+"     "+dept.getTel()+"     "+dept.getRess());
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return null;
}
public static int add(){
	getConnection();
	String sql="insert into deptd values(4,'财务部','55555','吉林')";
	try {
		st=getConnection().createStatement();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
		rs=st.executeQuery(sql);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return 0;
}
public static int del(){
	getConnection();
	String sql="delete from deptd where did='4'";
	try {
		st=getConnection().createStatement();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
		rs=st.executeQuery(sql);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return 0;
	
}
public static int upd(){
	getConnection();
	String sql="update   deptd set ress='巩义' where did='3'";
	try {
		st=getConnection().createStatement();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
		rs=st.executeQuery(sql);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return 0;

}
public static void main(String[] args) {
	
	insert();
}
}