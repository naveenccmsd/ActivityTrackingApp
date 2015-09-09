package com.ccmsd.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ccmsd.constants.ErrorMessage;
import com.ccmsd.constants.SqlOueryConstants;
import com.ccmsd.exception.ManualException;
import com.ccmsd.utility.DatabaseUtil;
import com.ccmsd.vo.ActivityVO;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

public class ActivityDAO {

	public  ResultSet getActivityListByID(String ActivityID) throws ClassNotFoundException, IOException, SQLException
	{
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.activityLsitQuery;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,ActivityID+"%");
		ResultSet res=ps.executeQuery();
		return res;
	}
	public  ResultSet getCommentListByID(String ActivityID) throws ClassNotFoundException, IOException, SQLException
	{
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.CommentLsitQuery;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,Integer.parseInt(ActivityID));
		ResultSet res=ps.executeQuery();
		return res;
	}
	public  ResultSet getReplyistByID(String CommentID) throws ClassNotFoundException, IOException, SQLException
	{
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.ReplyLsitQuery;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,Integer.parseInt(CommentID));
		ResultSet res=ps.executeQuery();
		return res;
	}
	public  ResultSet getAssignmentListByID(String ActivityID) throws ClassNotFoundException, IOException, SQLException
	{
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.assignmentLsitQuery;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,ActivityID);
		ResultSet res=ps.executeQuery();
		return res;
	}
	public ActivityVO createActivity(ActivityVO actVO_input) throws ManualException
	{
		boolean ret=false;
		try
		{
			Connection conn=DatabaseUtil.getConnection();
			String sql=SqlOueryConstants.addActivityQuery;
			String sql1=SqlOueryConstants.getActivityIDQuery;
			PreparedStatement ps1=conn.prepareStatement(sql1);
			ResultSet res1=ps1.executeQuery();
			if(res1.next())
			{
				actVO_input.setTaskID(res1.getInt(1)+1);
			}
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, actVO_input.getTaskID());
			ps.setString(2, actVO_input.getTaskName());
			ps.setString(3, actVO_input.getTaskDescription());
			ps.setInt(4, actVO_input.getTaskOwner());
			ps.setDate(5, (Date) actVO_input.getStartDate());
			ps.setDate(6, (Date) actVO_input.getEndDate());
			int res=ps.executeUpdate();
			if(res>0)
			{
				ret=true;
			}
		}
		catch (ClassNotFoundException e) 
		{
			throw new ManualException(ErrorMessage.getMessage("102"));
		}
		catch(MySQLIntegrityConstraintViolationException e)
		{
			throw new ManualException(ErrorMessage.getMessage("118"));
		}
		catch (SQLException e)
		{
			throw new ManualException(ErrorMessage.getMessage("103"));
		}
		catch(IOException e)
		{
			throw new ManualException(ErrorMessage.getMessage("104"));
		}
		
		return actVO_input;
		
	}
	public  ResultSet getActivityByUserID(String UserID) throws ClassNotFoundException, IOException, SQLException
	{
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.activityDetailsQuery;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,Integer.parseInt(UserID));
		ps.setInt(2,Integer.parseInt(UserID));
		ResultSet res=ps.executeQuery();
		return res;
	}
	public  ResultSet getActivityDetail(String UserID) throws ClassNotFoundException, IOException, SQLException
	{
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.getStatusTasks;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,Integer.parseInt(UserID));
		ps.setInt(2,Integer.parseInt(UserID));
		ps.setInt(3,Integer.parseInt(UserID));
		ResultSet res=ps.executeQuery();
		return res;
	}
	public  ResultSet getNewRequest(String UserID) throws ClassNotFoundException, IOException, SQLException
	{
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.getNewRequests;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,Integer.parseInt(UserID));
		ResultSet res=ps.executeQuery();
		return res;
	}
}
