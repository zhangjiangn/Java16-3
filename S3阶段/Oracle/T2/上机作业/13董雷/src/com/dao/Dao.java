package com.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.omg.CORBA.TRANSACTION_REQUIRED;

import com.bean.Emp;

public class Dao {
	

	
	public Connection DBManger() {
		
		Connection conn=null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url="jdbc:oracle:thin:@localhost:1521:orcl";
			String user="scott";
			String password="123";
			try {
				conn = DriverManager.getConnection(url, user, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;

	}
	
	///查询
	public void queryemp(){
		List<Emp> emplist=new ArrayList<Emp>();
		String oql="select *from emp";
		try {
			PreparedStatement ps=DBManger().prepareStatement(oql);
			ResultSet rs=ps.executeQuery();
			while (rs.next()&& rs!=null) {
				Emp u=new Emp();
				u.setEid(rs.getInt(1));
				u.setEname(rs.getString(2));
				u.setEdept(rs.getString(3));
				u.setEsal(rs.getString(6));
				emplist.add(u);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		for (Emp emp : emplist) {
			
			System.out.println(emp.getEid()+"&&&"+emp.getEname()+"&&&"+emp.getEsal()+"&&&"+emp.getEdept());
		}
		
	}
	
	
	///查询通过 object对象
	public void queryempbyobject(){
		
		List<Object[]> objlist=new ArrayList<Object[]>();
		String oql="select *from emp";
		try {
			PreparedStatement ps=DBManger().prepareStatement(oql);
			ResultSet rs=ps.executeQuery();
			while (rs.next()&& rs!=null) {
				Object[] u=new Object[4];
				u[0]=rs.getInt(1);
				u[1]=rs.getString(2);
				u[2]=rs.getString(3);
				u[3]=rs.getString(6);
				objlist.add(u);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		for (Object[] objects : objlist) {
			System.out.println(objects);
		}
		
	}
	
	
	
	
	
	

	///update语句  第一条  name改为美国 
	public void updataempbyindex_name(){
		int i=0;
		String oql="update Emp set ename=meiguo where empno=7369";
		try {
			PreparedStatement ps=DBManger().prepareStatement(oql);
			i=ps.executeUpdate();

			
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("已经更新："+i+"语句");
		
		
		
	}
	
	
	
	
	
	
	public static void main(String[] args) {
		Dao dao=new Dao();
//		dao.queryemp();
		dao.updataempbyindex_name();
		
	}

}
