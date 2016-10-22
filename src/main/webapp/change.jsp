<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.* ,javax.naming.InitialContext , javax.sql.DataSource  ,javax.naming.InitialContext , javax.sql.DataSource " %>


<%
String n=request.getParameter("val");

if(n.length()>0){
session.setAttribute("id",n);
out.print("Enter status<input type='text' name='status'/>");
out.print("<input type='submit' value='save'/>");
%>

<%
}//end of if
%>