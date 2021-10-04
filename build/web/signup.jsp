<%@page import="java.sql.*"%>
<%
                String un = request.getParameter ("name");
		String ue = request.getParameter ("email");
                String up = request.getParameter ("pass");
              try
		{	    
		Class.forName ("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/quixotic?allowPublicKeyRetrieval=true&useSSL=false","root", "root");
		Statement st = con.createStatement();
                String q = "Insert into signup values ('"+un+"','"+ue+"','"+up+"')";
		 st.executeUpdate (q);
		 response.sendRedirect("login.html");
				
			con.close ();
		}catch (Exception e) {out.println (e);}  
%>