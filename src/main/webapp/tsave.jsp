<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.* ,javax.naming.InitialContext , javax.sql.DataSource "%>
<%@page import="com.javatpoint.DBIntializer"%>
<%try{

String model=request.getParameter("model");
String tno=request.getParameter("tno");

String insurance=request.getParameter("insurance");
String cname=request.getParameter("cname");
String owner=request.getParameter("owner");
String mobile=request.getParameter("mobile");
String from=request.getParameter("from");
String to=request.getParameter("to");
java.util.Date sqdate=Calendar.getInstance().getTime();
	java.sql.Date dat =new java.sql.Date(sqdate.getTime());
	

	  InitialContext ctx = new InitialContext();
	  DataSource ds = (DataSource) ctx.lookup(DBIntializer.DATASOURCE_NAME);
 Connection  con = ds.getConnection();
PreparedStatement ps=con.prepareStatement("insert into tinstall values(?,?,?,?,?,?,?,?,?,?)");

ps.setInt(1,2);
ps.setString(2,model);
ps.setString(3,tno);
ps.setString(4,insurance);
ps.setString(6,owner);
ps.setString(5,cname);
ps.setString(7,from);
ps.setString(8,to);
ps.setDate(9,dat);
ps.setString(10,mobile);
int s=ps.executeUpdate();
System.out.print(s);
}catch(SQLException e2){
e2.printStackTrace();
}
%>
<jsp:forward page="admin.jsp"></jsp:forward>
