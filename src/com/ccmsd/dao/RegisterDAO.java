package com.ccmsd.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ccmsd.constants.ErrorMessage;
import com.ccmsd.constants.SqlOueryConstants;
import com.ccmsd.exception.ManualException;
import com.ccmsd.utility.DatabaseUtil;
import com.ccmsd.vo.EmployeeVO;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

public class RegisterDAO {

	public boolean doRegister(EmployeeVO empVO_input) throws ManualException
	{
		boolean ret=false;
		try
		{
			Connection conn=DatabaseUtil.getConnection();
			String sql=SqlOueryConstants.registerQuery;
			String sql1=SqlOueryConstants.registerQuery1;
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,empVO_input.getEmployeeID());
			ps.setString(2,empVO_input.getEmployeeName());
			ps.setInt(3,empVO_input.getManagerID());
			ps.setString(4,empVO_input.getProjectID());
			ps.setDouble(5,empVO_input.getEmployeePhone());
			ps.setDouble(6,empVO_input.getEmployeeMobile());
			int res=ps.executeUpdate();
			if(res>0)
			{
				PreparedStatement ps1=conn.prepareStatement(sql1);
				ps1.setInt(1,empVO_input.getEmployeeID());
				ps1.setString(2,empVO_input.getEmployeePassword());
				ps1.setString(3,empVO_input.getEmployeeEmail());
				ps1.setInt(4,empVO_input.getEmployeeRole());
				int res1=ps1.executeUpdate();
				if(res1>0)
				{
					ret=true;
				}
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
			System.out.println(e);
			throw new ManualException(ErrorMessage.getMessage("103"));
		}
		catch(IOException e)
		{
			throw new ManualException(ErrorMessage.getMessage("104"));
		}
		
		return ret;
	}
}
