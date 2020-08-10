package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import po.Emp;

public class Test {
	
	static Connection con=null;
	static PreparedStatement pre=null;
	static ResultSet res=null;
	public static  List<Object[]>emps(){
		con=Od.getConnection();
		 List<Object[]> list=new ArrayList<Object[]>();
		String sql="select * from emp";
		try {
			pre=con.prepareStatement(sql);
			res=pre.executeQuery();
			while(res.next()){
				Object[] object=new Object[3];
				object[0]=res.getInt(1);
				object[1]=res.getString(2);
				object[2]=res.getInt(4);
				list.add(object);
			}
			for (Object[] objects : list) {
				System.out.println(objects[0]+"****"+objects[1]+"****"+objects[2]);
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		
		return list;
		
	}
	public static List<Emp>em(){
		con=Od.getConnection();
		List<Emp> list=new ArrayList<Emp>();
		String sql="select * from emp";
		try {
			pre=con.prepareStatement(sql);
			res=pre.executeQuery();
			while(res.next()){
				Emp emp=new Emp();
				emp.setEmpno(res.getInt("empno"));
				emp.setEname(res.getString("ename"));
				emp.setSal(res.getInt("sal"));
				list.add(emp);
				
			}
			for (Emp emp : list) {
				System.out.println(emp.getEmpno()+"****"+emp.getEname()+"****"+emp.getSal());
				
			}
		
				
			
		
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		
	
		return list;
		
	}
	public static void main(String[] args) {
		emps();
		
	}
	

}
