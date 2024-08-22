<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<button><a href="employee_22rp05035.jsp">Add new</a></button>&nbsp&nbsp&nbsp&nbsp
<button><a href="logout_22rp05035.jsp">Logout</a></button>&nbsp&nbsp&nbsp&nbsp
<button><a href="search_22rp05035.jsp">Search</a></button><br><br>
<h1><b><i>List of Employee Information</i></b></h1>
<table border="5">
<tr>
<th>Emp_id</th>
<th>Emp_Name</th>
<th>Emp_Phone</th>
<th>Emp_Location</th>
<th>Emp_Salary</th>
<th colspan="2">Option</th>
</tr>
<% 
     String url = "jdbc:mysql://localhost:3306/emp_22rp05035";
                String user = "root"; 
                String pass = "";

                Connection conn = null;
                Statement stmt=null;
                ResultSet rs= null;
                
                try{
                Class.forName("com.mysql.ci.jdbc.Driver");
                conn=DriverManager.getConnection(url,user,pass);
		        stmt=conn.createStatement();
		        String sql="SELECT * FROM employee";
		        rs=stmt.executeQuery(sql);
		        
		        while(rs.next()){
		        int id=rs.getInt("id_22rp05035");
		        String name=rs.getString("name_22rp05035");
		        String phone=rs.getString("phone_22rp05035");
		        String location=rs.getString("location_22rp05035");
		        int salary=rs.getInt("salary_22rp05035");
		        %>
		        <tr>
		        <td><%= id %></td>
		        <td><%= name %></td>
		        <td><%= phone %></td>
		        <td><%= location %></td>
		        <td><%= salary %></td>
		        <td><a href="update.jsp?id_22rp05035=<%= id %>">update</a></td>
		        <td><a href="delete.jsp?id_22rp05035=<%= id %>">delete</a></td>
		        </tr>
		        <%
		        }
		        }
		        catch(Exception e){
		        	e.printStackTrace();
		        }
                finally{
                	try{
                		if(rs!=null) rs.close();
                		if(stmt!=null) stmt.close();
                		if(conn!=null) conn.close();
                	}
                	catch(SQLException e){
                		e.printStackTrace();
                	}
                }
		        %>
</table>
</center>
</body>
</html>