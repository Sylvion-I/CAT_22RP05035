<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
    <%@ session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<div>
<h1>Employee Management System</h1>
<form method="POST" action="">
<input type="email" name="email" placeholder="Email"><br><br>
<input type="password" name="password" placeholder="Password"><br><br>
<input type="checkbox" name="remember"value="remember">Remember Me<br><br>
<button name="submit">Sign in</button>
</form>
</div>
<%
if(requset.getParameter("submit")!= null){
	String email_22rp05035=request.getParameter("email");
	String password_22rp05035=request.getParameter("password");
	String url="jdbc:mysql://localhost:3306/emp_22rp05035";
	String user="root";
	String pass="";
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,pass);
		String sql="SELECT *from user where email_22rp05035=? and password_22rp05035=?";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, email_22rp05035);
		pstmt.setString(2, password_22rp05035);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			HttpSession=request.getSession();
			session.setAttribute("userEmail",email_22rp05035);
			out.println("<h2>Sign in successfully!</h2>");
			out.println("<p>Welcome, "+email_22rp05035+"!</p>");
			response.sendRedirect("dashboard_22rp05035.jsp");
		}
		else{
			out.println("<h2>Invalid email and password!</h2>");
		}
	}
	catch(Exception e){
		out.println("<h2>Error: "+e.getMessage()+"</h2>");
	}
	finally{
		if(rs!=null)
			try{
				rs.close();
			}
		catch(SQLException e){}
		if(pstmt!=null)
			try{
				pstmt.close();
			}
		catch(SQLException e){}
		if(conn!=null)
			try{
				conn.close();
			}
		catch(SQLException e){}
	}
}
%>
</center>
</body>
</html>