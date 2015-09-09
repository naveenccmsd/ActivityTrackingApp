<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
  if (session.getAttribute("employeeID") == null)
  {
	  response.sendRedirect("login.jsp");
  }
  else
  {
	  response.sendRedirect("home.jsp");
  }
%>