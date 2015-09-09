package com.ccmsd.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ccmsd.constants.SqlOueryConstants;
import com.ccmsd.utility.DatabaseUtil;

public class ManagerDAO {
	public  ResultSet getManagerList(String ManagerID) throws ClassNotFoundException, IOException, SQLException
	{
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.managerLsitQuery;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,ManagerID+"%");
		ResultSet res=ps.executeQuery();
		return res;
	}
	public  ResultSet getEmployeeList(String employeeID) throws ClassNotFoundException, IOException, SQLException
	{
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.employeeLsitQuery;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,employeeID+"%");
		ResultSet res=ps.executeQuery();
		return res;
	}
	public boolean approveUser(int employeeID) throws ClassNotFoundException, IOException, SQLException
	{
		boolean res=false;
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.approveUserById;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,employeeID);
		if(ps.executeUpdate()>0)
		{
		res=true;
		}
		return res;
	}
	public boolean addAssignment(int employeeID,int taskID,int upadetBy) throws ClassNotFoundException, IOException, SQLException
	{
		boolean res=false;
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.addAssignmentQuery;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,taskID);
		ps.setInt(2,employeeID);
		ps.setInt(3,upadetBy);
		ps.setString(4,"");
		if(ps.executeUpdate()>0)
		{
			if(updateActivityStatus(taskID))
			{
				res=true;
			}
		}
		return res;
	}
	public boolean completeAssignment(int taskID,int employeeID) throws ClassNotFoundException, IOException, SQLException
	{
		boolean res=false;
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.completeAssignmentById;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,taskID);
		ps.setInt(2,employeeID);
		if(ps.executeUpdate()>0)
		{
			if(updateActivityStatus(taskID))	
			{
			res=true;
			}
		}
		return res;
	}
	
	public boolean withdrawAssignment(int taskID,int employeeID) throws ClassNotFoundException, IOException, SQLException
	{
		boolean res=false;
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.withdrawAssignmentById;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,taskID);
		ps.setInt(2,employeeID);
		if(ps.executeUpdate()>0)
		{
			if(updateActivityStatus(taskID))	
			{
			res=true;
			}
		}
		return res;
	}
	public boolean updateActivityStatus_old(int taskID) throws ClassNotFoundException, IOException, SQLException
	{
		boolean res=false;
		Connection conn=DatabaseUtil.getConnection();
		String sql1=SqlOueryConstants.getAssignmentCountBycomplete;
		PreparedStatement ps1=conn.prepareStatement(sql1);
		ps1.setInt(1,taskID);
		ResultSet r=ps1.executeQuery();
		if(!r.next())
		{
			String sql3=SqlOueryConstants.getAssignmentCountBywithdraw;
			PreparedStatement ps3=conn.prepareStatement(sql3);
			ps3.setInt(1,taskID);
			ResultSet r3=ps3.executeQuery();
			if(!r3.next())
			{
			String sql2=SqlOueryConstants.updateActivityStatusQuery;
			PreparedStatement ps2=conn.prepareStatement(sql2);
			ps2.setInt(1,taskID);
			ps2.executeUpdate();
			res=true;
			}
			else
			{
				String sql4=SqlOueryConstants.removeActivityStatusQuery;
				PreparedStatement ps4=conn.prepareStatement(sql4);
				ps4.setInt(1,taskID);
				ps4.executeUpdate();
				res=true;
			}
		}
		else
		{
			String sql2=SqlOueryConstants.revertActivityStatusQuery;
			PreparedStatement ps2=conn.prepareStatement(sql2);
			ps2.setInt(1,taskID);
			ps2.executeUpdate();
			res=true;
		}
		return res;
		
	}
	public boolean updateActivityStatus(int taskID) throws ClassNotFoundException, IOException, SQLException
	{
		boolean res=false;
		int status=0;//In Progress id default
		Connection conn=DatabaseUtil.getConnection();
		//get InProgress assignment
		String InProgressSql=SqlOueryConstants.getInProgressAssignmentCount;
		PreparedStatement InProgressps1=conn.prepareStatement(InProgressSql);
		InProgressps1.setInt(1,taskID);
		ResultSet InProgressRes=InProgressps1.executeQuery();
		if(!InProgressRes.next())
		{
			String CompleteSql=SqlOueryConstants.getCompleteAssignmentCount;
			PreparedStatement Completeps1=conn.prepareStatement(CompleteSql);
			Completeps1.setInt(1,taskID);
			ResultSet CompleteRes=Completeps1.executeQuery();
			if(!CompleteRes.next())
			{
				String sql4=SqlOueryConstants.removeActivityStatusQuery;
				PreparedStatement ps4=conn.prepareStatement(sql4);
				ps4.setInt(1,taskID);
				ps4.executeUpdate();
				res=true;
			}
			else
			{
				
				String sql2=SqlOueryConstants.updateActivityStatusQuery;
				PreparedStatement ps2=conn.prepareStatement(sql2);
				ps2.setInt(1,taskID);
				ps2.executeUpdate();
				res=true;
			}
		}
		else
		{
			String sql2=SqlOueryConstants.revertActivityStatusQuery;
			PreparedStatement ps2=conn.prepareStatement(sql2);
			ps2.setInt(1,taskID);
			ps2.executeUpdate();
			res=true;
		}
		return res;
		
	}

	
}
