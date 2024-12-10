package text;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Emp;

import oracle.jdbc.driver.DBConversion;

public class Text {
	
	public static Connection con;
	
	public static Connection getConnection(){
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url="jdbc:oracle:thin:127.0.0.1:1521>:orcl";
			con=DriverManager.getConnection(url, "scott", "123");
			PreparedStatement ps=con.prepareStatement("select * from emp");
			ResultSet rs=ps.executeQuery();
//			List<Object[]> obj=new ArrayList<Object[]>();
//				while (rs.next()) {
//					Object[] ob=new Object[5];
//					ob[0]=rs.getInt(1);
//					ob[1]=rs.getString(2);
//					ob[0]=rs.getString(5);
//					obj.add(ob);
//				}
//			for (Object[] o : obj) {
//				System.out.println(o[0]+"****"+o[1]+"****"+o[2]);
//			}
			
//		    while (rs.next()) {
//				Emp emp=new Emp();
//				emp.setEmpno(rs.getInt(1));
//				emp.setEname(rs.getString(2));
//				emp.setSal(rs.getString(3));
//			System.out.println(emp.getEmpno()+"****"+emp.getEname()+"****"+emp.getSal());
//			}
		   
		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
		
	}
	
///////添加
	public static int addD(){
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url="jdbc:oracle:thin:127.0.0.1:1521>:orcl";
			con=DriverManager.getConnection(url, "scott", "123");
			
		    String sql="insert into dept values(?,?,?)";
		    PreparedStatement ps=con.prepareStatement(sql);
		    ps.setInt(1,60);
		    ps.setString(2, "大头部");
		    ps.setString(3, "bcnndujb");
		    ps.executeUpdate();
		    
		    System.out.println("成功了！");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	  return 1;
	  
	}
//////修改
	public static int update() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		String url="jdbc:oracle:thin:127.0.0.1:1521>:orcl";
		con=DriverManager.getConnection(url, "scott", "123");
		 
		String sql="update dept set dname=? where deptno=?";
		PreparedStatement ps=con.prepareStatement(sql);
	    ps.setString(1, "人事部");
	    ps.setInt(2,20);
	    ps.executeUpdate();
		
		System.out.println("修改成功！");
		return 1;
	}
//////删除
	public static int dele() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		String url="jdbc:oracle:thin:127.0.0.1:1521>:orcl";
		con=DriverManager.getConnection(url, "scott", "123");
		 
		String sql="delect * from dept where deptno=?";
		PreparedStatement ps=con.prepareStatement(sql);
	    ps.setInt(2,30);
	    ps.executeUpdate();
		
		System.out.println("删除成功！");
		return 1;
	}
	
	public static void main(String[] args) throws Exception {
    		//getConnection();
    		//addD();
		    update();
		    
		   //System.out.println(getConnection());
	}
	
}
