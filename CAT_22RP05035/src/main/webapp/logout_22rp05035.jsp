<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.servlet.http.*" %>
    <%@page session="false" %>
<%
HttpSession session=request.getSession(false);
if(session!=null){
session.invalidate();
}
response.sendRedirect("signin_22rp05035.jsp");
%>