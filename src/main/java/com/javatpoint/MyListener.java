package com.javatpoint;
import javax.naming.InitialContext;
import javax.servlet.*;
import javax.sql.DataSource;

import java.sql.*;

public class MyListener implements ServletContextListener{

	public void contextInitialized(ServletContextEvent arg0) {
		
		Connection con=null;
	try{
		
		
        InitialContext ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup(DBIntializer.DATASOURCE_NAME);
         con = ds.getConnection();
		
		//PreparedStatement ps2= con.prepareStatement("CREATE SEQUENCE JAVATPOINT MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 NOCACHE NOORDER NOCYCLE");
		//ps2.executeUpdate();
		
		PreparedStatement ps4=con.prepareStatement("CREATE  TABLE IF NOT EXISTS payregister (id INT(12),username VARCHAR(80), userpass VARCHAR(80), branch VARCHAR(80),dateofjoining VARCHAR(80), dateofbirth VARCHAR(80), salary VARCHAR(80),CONSTRAINT PAYREGISTER_PK PRIMARY KEY (id) )");
		ps4.executeUpdate();		
			
		
		ps4= con.prepareStatement("CREATE  TABLE IF NOT EXISTS  tinstall(id INT(12),tmodel VARCHAR(80), tno VARCHAR(80), insurance VARCHAR(80),iname VARCHAR(80), malik VARCHAR(80),tfrom VARCHAR(80), tto VARCHAR(80), idate DATE, mobile INT( 15),status VARCHAR(80),CONSTRAINT TINSTALL_PK PRIMARY KEY (id) )");
		ps4.executeUpdate();
		
		ps4= con.prepareStatement("CREATE  TABLE IF NOT EXISTS  quizcontact(name VARCHAR(80),email VARCHAR(80),phone int(15) NOT NULL , message VARCHAR(1000))");
		ps4.executeUpdate();
		
		
		
		//Statement stmt=con.createStatement();
		//stmt.executeUpdate("CREATE TRIGGER  BI_PAYREGISTER before insert on PAYREGISTER for each row begin select JAVATPOINT.nextval into :NEW.id from dual;end");
		//stmt.executeUpdate("CREATE TRIGGER  BI_TINSTALL before insert on TINSTALL for each row begin select JAVATPOINT.nextval into :NEW.id from dual;end");
			
	}
		
	    catch(Exception e){
	    	e.printStackTrace();
	    	
	    }
	    }
	    
	    public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("project undeployed");
		
	}
}
