package com.ccmsd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ccmsd.constants.ErrorMessage;
import com.ccmsd.dao.LoginDAO;
import com.ccmsd.exception.ManualException;
import com.ccmsd.vo.EmployeeVO;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
		EmployeeVO empVO=new EmployeeVO();
		try
		{
		empVO.setEmployeeID(Integer.parseInt(request.getParameter("username")));
		}
		catch(Exception e)
		{
			throw new ManualException(ErrorMessage.getMessage("116"));
		}
		empVO.setEmployeePassword(request.getParameter("password"));
		EmployeeVO result=new LoginDAO().verifyLogin(empVO);
		if(result.getEmployeeID()>0)
		{
			HttpSession session=request.getSession();
			session.setAttribute("employeeID",result.getEmployeeID());
			session.setAttribute("employeeEmail",result.getEmployeeEmail());
			session.setAttribute("employeeName",result.getEmployeeName());
			session.setAttribute("employeeRole",result.getEmployeeRole());
			response.sendRedirect("home.jsp");
		}
		else
		{
			request.setAttribute("error",ErrorMessage.getMessage("201"));
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		}
		catch(ManualException e)
		{
			request.setAttribute("error",e.getMessage());
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		
	}

}
