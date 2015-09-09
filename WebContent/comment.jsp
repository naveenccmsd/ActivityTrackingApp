<%@page import="com.ccmsd.dao.CommentDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
CommentDAO cd=new CommentDAO();
if(request.getParameter("addnewComment")!=null && request.getParameter("addnewComment").equals("true"))
{
	int taskID=Integer.parseInt(request.getParameter("taskID"));
	String newComment=request.getParameter("newComment");
	int updatedBY=Integer.parseInt(request.getParameter("updatedBY"));
	try
	{
	if(cd.addNewComment(taskID, newComment,updatedBY))
	{
		out.println("1");
	 }
	 else
	 {
		 out.println("0");
	 }
	}
	catch(MySQLIntegrityConstraintViolationException e)
	  {
		  out.println("3");
	  }
	  catch(SQLException e)
	  {
		  out.println("3");
	  }
	  catch(Exception e)
	  {
		  out.println("2");
	  }
}
if(request.getParameter("addnewReply")!=null && request.getParameter("addnewReply").equals("true"))
{
	int commentID=Integer.parseInt(request.getParameter("commentID"));
	String newReply=request.getParameter("newReply");
	int updatedBY=Integer.parseInt(request.getParameter("updatedBY"));
	try
	{
	if(cd.addNewReply(commentID, newReply,updatedBY))
	{
		out.println("1");
	 }
	 else
	 {
		 out.println("0");
	 }
	}
	catch(MySQLIntegrityConstraintViolationException e)
	  {
		  out.println("3");
	  }
	  catch(SQLException e)
	  {
		  out.println("3");
	  }
	  catch(Exception e)
	  {
		  out.println("2");
	  }
}
%>