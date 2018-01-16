package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Test {

	/**
	 * @param args
	 */
	public static Connection conn=null;
	public static PreparedStatement ps=null;
	public static ResultSet rs=null;
	public static Connection getConnection(){
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@127.0.0.1:1521:orcl";
			String userName="scott";
			String pwd="123";
			conn=DriverManager.getConnection(url, userName, pwd);
			ps=conn.prepareStatement("select *from emp");
			rs=ps.executeQuery();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
		
		
		return conn;
		
	}
	
	public void sel1() throws SQLException{

	       ps=getConnection().prepareStatement("select *from emp");
	       rs=ps.executeQuery();
	      Object[] o=new Object[2];
	     while(rs.next()){
	    	 o[0]=rs.getInt(1);
	    	 o[1]=rs.getString(2);
	    	 
	    	  for (Object object : o) {
	    			System.out.println(object);
	    		}
	     }
	 
		
	}
	public void sel2() throws SQLException{
		   Bean b=new Bean();
		   ps=getConnection().prepareStatement("select *from emp");
	       rs=ps.executeQuery();
	     while(rs.next()){
	    	 b.setEmpno(rs.getInt(1));
	    	 b.setEname(rs.getString(2));
	    	 System.out.println(b.getEmpno()+"*********"+b.getEname());
	    	 
	     }
	}
	
	public void update() throws SQLException{
		
		 ps=getConnection().prepareStatement("update emp set ename='sha' where empno=7900");
		 System.out.println("********");
	     
		
	}
	public static void main(String[] args) {
	//System.out.println(getConnection());
               
       Test t=new Test();
       try {
		//t.sel1();
		t.sel2();
		//t.update();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
