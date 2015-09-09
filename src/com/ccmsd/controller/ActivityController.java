package com.ccmsd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ccmsd.constants.ErrorMessage;
import com.ccmsd.dao.ActivityDAO;
import com.ccmsd.dao.RegisterDAO;
import com.ccmsd.exception.ManualException;
import com.ccmsd.vo.ActivityVO;
import com.ccmsd.vo.EmployeeVO;

/**
 * Servlet implementation class ActivityController
 */
public class ActivityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivityController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
		ActivityVO taskVO=new ActivityVO();
		try
		{
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		taskVO.setTaskName(request.getParameter("frm_activityName"));
		taskVO.setTaskDescription(request.getParameter("frm_description"));
		taskVO.setTaskOwner(Integer.parseInt(request.getParameter("frm_managerID")));
		java.util.Date utilDate =formatter.parse(request.getParameter("frm_startDate"));
	    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		taskVO.setStartDate(sqlDate);
		utilDate =formatter.parse(request.getParameter("frm_endDate"));
	    sqlDate = new java.sql.Date(utilDate.getTime());
		taskVO.setEndDate(sqlDate);
		taskVO.setTaskID(0);
		}
		catch(Exception e)
		{
			throw new ManualException(ErrorMessage.getMessage("119"));
		}
		ActivityVO result=new ActivityDAO().createActivity(taskVO);
		if(result.getTaskID()>0)
		{
				request.setAttribute("success","Task "+result.getTaskID()+" has been created successfully");
				RequestDispatcher rd=request.getRequestDispatcher("addActivity.jsp");
				rd.forward(request, response);
		}
		}
		catch(ManualException e)
		{
			request.setAttribute("error",e.getMessage());
			RequestDispatcher rd=request.getRequestDispatcher("addActivity.jsp");
			rd.forward(request, response);
		}
	}

}
