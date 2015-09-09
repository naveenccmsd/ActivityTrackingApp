<%@page import="java.sql.SQLException"%>
<%@page import="com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException"%>
<%@page import="com.ccmsd.dao.ManagerDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <% 
  ManagerDAO md=new ManagerDAO();
  if(request.getParameter("managerID")!=null)
  {
  String managerID=request.getParameter("managerID");
  ResultSet res=md.getManagerList(managerID);
  String result="<table class='table table-striped table-bordered'><thead><tr><th>Manager Id</th><th>Manager Name</th></thead><tbody>";
  while(res.next())
	{
  	result=result+"<tr><td><a href='javascript:;' onclick='setManagerID("+res.getInt(1)+")')>"+res.getInt(1)+"</a></td><td>"+res.getString(2)+"</td></tr>";
	}
  result=result+"</tbody></table>";
  out.println(result);
  }
  
  if(request.getParameter("employeeID")!=null)
  {
  String employeeID=request.getParameter("employeeID");
  ResultSet res=md.getEmployeeList(employeeID);
  String result="<table class='table table-striped table-bordered'><thead><tr><th>Manager Id</th><th>Manager Name</th></thead><tbody>";
  while(res.next())
	{
  	result=result+"<tr><td><a href='javascript:;' onclick=\"addAssignment("+res.getInt(1)+",'"+res.getString(2)+"')\">"+res.getInt(1)+"</a></td><td>"+res.getString(2)+"</td></tr>";
	}
  result=result+"</tbody></table>";
  out.println(result);
  }
  
  if(request.getParameter("addAssignment")!=null)
  {
	  int employeeID=Integer.parseInt(request.getParameter("empID"));
	  int taskID=Integer.parseInt(request.getParameter("taskId"));
	  int upadetBy=Integer.parseInt(request.getParameter("loginID"));
	  try
	  {
			 if( md.addAssignment(employeeID, taskID, upadetBy))
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
  
  if(request.getParameter("approveUser")!=null)
  {
	  int employeeID=Integer.parseInt(request.getParameter("approveUser"));
	 if( md.approveUser(employeeID))
	 {
	  out.println("<a href='javascript:;' class='btn btn-small btn-success'>Approved<i class='btn-icon-only icon-ok'> </i></a>");
	 }
	 else
	 {
		 out.println("<a href='javascript:;' class='btn btn-danger btn-small'>Unable to approve now<i class='btn-icon-only icon-remove'> </i></a>");
		 out.println("<img style='height:30px;display:none' id='approveLoading"+employeeID+"'src='img/ajax-loader.gif'>");
	 }
  }
  if(request.getParameter("completeAssignment")!=null)
  {
	  int taskID=Integer.parseInt(request.getParameter("taskID"));
	  int employeeID=Integer.parseInt(request.getParameter("empID"));
	 if( md.completeAssignment(taskID,employeeID))
	 {
	  out.println("<a href='javascript:;' class='btn btn-small btn-success'>Completed<i class='btn-icon-only icon-ok'> </i></a>");
	 }
	 else
	 {
		 out.println("<a href='javascript:;' class='btn btn-danger btn-small'>Unable to Complete now now<i class='btn-icon-only icon-remove'> </i></a>");
		 out.println("<img style='height:30px;display:none' id='approveLoading"+employeeID+"'src='img/ajax-loader.gif'>");
	 }
  }
  if(request.getParameter("withdrawAssignment")!=null)
  {
	  int taskID=Integer.parseInt(request.getParameter("taskID"));
	  int employeeID=Integer.parseInt(request.getParameter("empID"));
	 if( md.withdrawAssignment(taskID,employeeID))
	 {
	  out.println("<a href='javascript:;' class='btn btn-small btn-danger'>Withdrawn<i class='btn-icon-only icon-ok'> </i></a>");
	 }
	 else
	 {
		 out.println("<a href='javascript:;' class='btn btn-danger btn-small'>Unable to Complete now now<i class='btn-icon-only icon-remove'> </i></a>");
		 out.println("<img style='height:30px;display:none' id='approveLoading"+employeeID+"'src='img/ajax-loader.gif'>");
	 }
  }
  
  %>