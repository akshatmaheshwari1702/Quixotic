<%@page import="java.sql.*"%>
<%
                String un = request.getParameter ("u1");
		String up = request.getParameter ("u2");
		try
		{	    
		Class.forName ("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/quixotic?allowPublicKeyRetrieval=true&useSSL=false","root", "root");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery ("select * from signup where name='"+un+"' and password='"+up+"'");
		if (rs.next ())    
                {
                    session = request.getSession();
                    session.setAttribute("session_un", un);
                    session.setAttribute("session_up", up);
                    response.sendRedirect("index.html");
                }
		else 
                {
                    response.sendRedirect("login.jsp?un=invalid username or password ");
                }
				
			con.close ();
		}catch (Exception e) {out.println (e);}  
%>