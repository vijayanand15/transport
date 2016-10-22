
<%@page import="java.sql.DriverManager ,javax.naming.InitialContext , javax.sql.DataSource "%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>    
<%@page import="com.javatpoint.DBIntializer"%>
    <jsp:include page="header.jsp"></jsp:include>
            <div id="gbox-bg">
              <div id="gbox-grd">
                <h2>WELCOME TO OUR TRUCK TRACKING COMPANY</h2>
				<marquee dir="ltr"><font style="color: navy;">Delhi-Kanpur,Agra-Kanpur,Agra-Ghaziabad,Kanpur-Delhi........</font></marquee>

				<%
				  InitialContext ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup(DBIntializer.DATASOURCE_NAME);
				 Connection  con = ds.getConnection();
				PreparedStatement ps= con.prepareStatement("select name,email,phone,message from quizcontact limit 7 ");
				ResultSet rs= ps.executeQuery();
				out.print("<table border='3'>");
				out.print("<tr><td>Name</td><td>Email</td><td>Phone</td><td>Message</td></tr>");
				
				while(rs.next()){
				out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td></tr>");
				
				}
				out.print("</table>");
				 %>				
				


                <div id="newsletter">
			        
                 
                  
                  
                <p></p>
                </div>

                <div class="clear"> </div>
                
              </div>
            </div>
            <jsp:include page="footer.html"></jsp:include>