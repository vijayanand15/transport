<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.* ,javax.naming.InitialContext , javax.sql.DataSource  "%>
<%@page import="com.javatpoint.DBIntializer"%>
<%try{

String username=request.getParameter("username");
String userpass=request.getParameter("userpass");

String dateofbirth=request.getParameter("dob");
String dateofjoining=request.getParameter("doj");
String salary=request.getParameter("salary");
String branch=request.getParameter("branch");
InitialContext ctx = new InitialContext();
DataSource ds = (DataSource) ctx.lookup(DBIntializer.DATASOURCE_NAME);
 Connection  con = ds.getConnection();
PreparedStatement ps=con.prepareStatement("insert into payregister values(?,?,?,?,?,?,?)");

ps.setInt(1,2);
ps.setString(2,username);
ps.setString(3,userpass);
ps.setString(4,branch);
ps.setString(6,dateofbirth);
ps.setString(5,dateofjoining);
ps.setString(7,salary);
int s=ps.executeUpdate();
if(s>0){
%>
<jsp:forward page="admin.jsp"></jsp:forward>
<% 
}
else{
out.print("sorry!please fill correct detail and try again" );
}
}catch(SQLException e2){
out.print("sorry!please fill correct detail and try again" );
e2.printStackTrace();
}
%>

