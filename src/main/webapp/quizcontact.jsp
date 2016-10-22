<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.* ,javax.naming.InitialContext , javax.sql.DataSource "%>

<%@page import="com.javatpoint.DBIntializer"%>
<%

 try {
 
String name= request.getParameter("name");
String email= request.getParameter("email");
String phone= request.getParameter("phone");
String message= request.getParameter("message");
InitialContext ctx = new InitialContext();
DataSource ds = (DataSource) ctx.lookup(DBIntializer.DATASOURCE_NAME);
 Connection  con = ds.getConnection();

PreparedStatement ps=con.prepareStatement("insert into quizcontact values(?,?,?,?)");
ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,phone);
ps.setString(4,message);

int s= ps.executeUpdate();
if(s>0){%>
<jsp:forward page="home.jsp"></jsp:forward>
<% 
}
else{
out.print("sorry!please fill correct detail and try again" );
}
}
catch(Exception e){e.printStackTrace();
out.print("sorry!please fill correct detail and try again" );
}

%>

