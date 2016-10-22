<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.* ,javax.naming.InitialContext , javax.sql.DataSource  " %>
<%@page import="com.javatpoint.DBIntializer"%>
<%
String n=request.getParameter("val");
if(n.length()>0){
try{
	  InitialContext ctx = new InitialContext();
	  DataSource ds = (DataSource) ctx.lookup(DBIntializer.DATASOURCE_NAME);
	  Connection  con = ds.getConnection();
PreparedStatement ps=con.prepareStatement("delete from payregister where id ='"+n+"'");
ps.executeUpdate();
con.close();
request.setAttribute("msg","Record Has been Deleted");
}catch(Exception e){e.printStackTrace();}
}//end of if
%>
<jsp:forward page="admin.jsp"></jsp:forward>