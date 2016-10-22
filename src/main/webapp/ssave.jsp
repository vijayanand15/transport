<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*  ,javax.naming.InitialContext , javax.sql.DataSource " %>
<%@page import="com.javatpoint.DBIntializer"%>

<% 
String status=request.getParameter("status");
String id=(String)session.getAttribute("id");
System.out.print(id);
if(id.length()>0){
try{
	  InitialContext ctx = new InitialContext();
	  DataSource ds = (DataSource) ctx.lookup(DBIntializer.DATASOURCE_NAME);
 Connection  con = ds.getConnection();

PreparedStatement ps=con.prepareStatement("update tinstall set status='"+status+"' where id='"+id+"'");
//ps.setString(1,n);
out.print("<br>");
int s=ps.executeUpdate();

con.close();
}catch(Exception e){e.printStackTrace();}
}//end of if
%>
<jsp:forward page="status.jsp"></jsp:forward>