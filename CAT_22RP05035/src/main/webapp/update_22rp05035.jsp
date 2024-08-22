<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update  Employee</title>
</head>
<body>
<h1>Update Employee Information</h1>
<% 
     String url = "jdbc:mysql://localhost:3306/emp_22rp05035";
                String user = "root"; 
                String pass = "";

                Connection conn = null;
                PreparedStatement pstmt=null;
                ResultSet rs= null;
                String id_22rp05035=request.getParameter("id_22rp05035");
                
                
                try{
                Class.forName("com.mysql.ci.jdbc.Driver");
                conn=DriverManager.getConnection(url,user,pass);
		        String sql="SELECT name_22rp05035,phone_22rp05035,location_22rp05035,salary_22rp05035 FROM employee where id_22rp05035=?";
		        pstmt=conn.prepareStatement(sql);
		        pstmt.setString(1,id_22rp05035);
		        rs=pstmt.executeQuery();
                }
                catch(Exception e){
                	out.println("<h2>Error: "+e.getMessage()+"</h2>");
                }
                finally{
                	try{
                		if(rs!=null) rs.close();
                		if(pstmt!=null) pstmt.close();
                		if(conn!=null) conn.close();
                	}
                	catch(SQLException e){
                		e.printStackTrace();
                	}
                }
                if(request.getParameter("update_22rp05035")!=null){
                	String name=request.getParameter("name_22rp05035");
                	String phone=request.getParameter("phone_22rp05035");
                	String location=request.getParameter("location_22rp05035");
                	int salary=Integer.parseInt(request.getParameter("salary_22rp05035"));
                try{
                	conn=DriverManager.getConnection(url,user,pass);
                	String sql="UPDATE employee set name_22rp05035=?,phone_22rp05035=?,location_22rp05035=?,salary_22rp05035=? where id_22rp05035=?";
                	
                	pstmt=conn.prepareStatement(sql);
                	pstmt.setString(1,name);
                	pstmt.setString(2,phone);
                	pstmt.setString(3,location);
                	pstmt.setInt(4,salary);
                	pstmt.executeUpdate();
                	response.sendRedirect("dashboard_22rp05035.jsp");
                }
                catch(Exception e){
                	out.println("<h2>Error: "+e.getMessage()+"</h2>");
                }
                finally{
                	try{
                		if(pstmt!=null)pstmt.close();
                		if(conn!=null)conn.close();
                	
               
               
		        %>
		        <form method="POST" action="">
		        <input type="text" name="name_22rp05035" value="<%= name %>"><br><br>
<input type="text" name="phone_22rp05035" value="<%= phone %>"><br><br>
<input type="text" name="location_22rp05035" value="<%= location %>"><br><br>
<input type="number" name="salary_22rp05035" value="<%= Salary %>"><br><br>
<button name="submit">Update</button>
		        </form>
</body>
</html>