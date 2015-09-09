package com.ccmsd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ccmsd.constants.ErrorMessage;
import com.ccmsd.dao.RegisterDAO;
import com.ccmsd.exception.ManualException;
import com.ccmsd.vo.EmployeeVO;

public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		out.println("<script type='text/javascript'>alert('Acccount for has been created and pending with');</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
		EmployeeVO empVO=new EmployeeVO();
		try
		{
		empVO.setEmployeeID(Integer.parseInt(request.getParameter("frm_employeeID")));
		empVO.setEmployeeRole(Integer.parseInt(request.getParameter("frm_employeeRole")));
		empVO.setManagerID(Integer.parseInt(request.getParameter("frm_managerID")));
		}
		catch(Exception e)
		{
			throw new ManualException(ErrorMessage.getMessage("117"));
		}
		try
		{
			Double Phone=0.0,Mobile=0.0;
			if(!request.getParameter("frm_employeePhone").equals("")){Phone=Double.parseDouble(request.getParameter("frm_employeePhone"));}
			if(!request.getParameter("frm_employeeMobile").equals("")){Mobile=Double.parseDouble(request.getParameter("frm_employeeMobile"));}
			empVO.setEmployeePhone(Phone);
			empVO.setEmployeeMobile(Mobile);
		}
		catch(Exception e)
		{
			throw new ManualException(ErrorMessage.getMessage("120"));
		}
		String valEmail=request.getParameter("frm_employeeEmail");
		if(valEmail.indexOf("@cognizant.com")>0)
		{
			empVO.setEmployeeEmail(valEmail);
		}
		else
		{
			empVO.setEmployeeEmail(valEmail+"@cognizant.com");
		}
		empVO.setEmployeePassword(request.getParameter("frm_employeePassword"));
		empVO.setEmployeeName(request.getParameter("frm_employeeName"));
		empVO.setProjectID(request.getParameter("frm_projectID"));
		if(new RegisterDAO().doRegister(empVO))
		{
			PrintWriter out=response.getWriter();
			out.println("<html><script type='text/javascript'>alert('Acccount for "+empVO.getEmployeeID()+" has been created and Approval request is pending with Manager/Employee "+empVO.getManagerID()+"');</script></html>");
			HttpSession session=request.getSession();
			if(session.getAttribute("employeeID")==null)
			{
				request.setAttribute("error","Acccount for "+empVO.getEmployeeID()+" has been created and Approval request is pending with Manager/Employee "+empVO.getManagerID());
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			else
			{
				request.setAttribute("success","Acccount for "+empVO.getEmployeeID()+" has been created and Approval request is pending with Manager/Employee "+empVO.getManagerID());
				RequestDispatcher rd=request.getRequestDispatcher("addResource.jsp");
				rd.forward(request, response);
			}
		}
		}
		catch(ManualException e)
		{
			request.setAttribute("error",e.getMessage());
			RequestDispatcher rd=request.getRequestDispatcher("addResource.jsp");
			rd.forward(request, response);
		}
	}

}
