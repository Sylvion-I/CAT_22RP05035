<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body><center>
<div>
<h1><b>Add New Employee Information </b></h1>
<form method="POST" action="">
<input type="text" name="name_22rp05035" placeholder="Employee name"><br><br>
<input type="text" name="phone_22rp05035" placeholder="Phone number"><br><br>
<input type="text" name="location_22rp05035" placeholder="Location"><br><br>
<input type="number" name="salary_22rp05035" placeholder="Salary"><br><br>
<button name="submit">Add</button>
</form>
</div>
</center>
  <%
            if (request.getParameter("submit") != null) {
                String name = request.getParameter("name_22rp05035");
                String phone = request.getParameter("phone_22rp05035");
                String location = request.getParameter("location_22rp05035");
                String salary = request.getParameter("salary_22rp05035");
                
                String url = "jdbc:mysql://localhost:3306/emp_22rp050035";
                String user = "root"; 
                String pass = "";

                Connection conn = null;
                PreparedStatement pstmt = null;

                try {
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    conn = DriverManager.getConnection(url, user, pass);
                    
                   
                    String sql = "INSERT INTO employee(name,phone,location,salary) VALUES (?,?,?,?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, name);
                    pstmt.setString(2, phone);
                    pstmt.setString(3, location);
                    pstmt.setString(4, salary);
                    
                   
                    pstmt.executeUpdate();

                    out.println("<h3> Successful!</h3>");
                    out.println("<p>Name: " + name + "</p>");
                    response.sendRedirect("dashboard_22rp05035.jsp");
                } catch (Exception e) {
                    out.println("<h3>Error: " + e.getMessage() + "</h3>");
                } finally {
                    if (pstmt != null) 
                    	try { pstmt.close(); } 
                    catch (SQLException e) {}
                    if (conn != null) 
                    	try { conn.close(); } 
                    catch (SQLException e) {}
                }
            }
        %>
        
</body>
</html>