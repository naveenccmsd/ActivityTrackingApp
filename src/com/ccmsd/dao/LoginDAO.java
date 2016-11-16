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

public class LoginDAO {

	public EmployeeVO verifyLogin(EmployeeVO empVO_input) throws ManualException
	{
		EmployeeVO empVO=new EmployeeVO();
		try
		{
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.userLoginQuery;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1,empVO_input.getEmployeeID());
		ps.setString(2,empVO_input.getEmployeePassword());
		ResultSet res=ps.executeQuery();
		while(res.next())
		{
			empVO.setEmployeeID(res.getInt(1));
			empVO.setEmployeeEmail(res.getString(2));
			empVO.setEmployeeName(res.getString("cts_EmployeeName"));
			empVO.setEmployeeRole(res.getInt("cts_employeeRole"));
		}
		}
		catch (ClassNotFoundException e) 
		{
			System.out.println(e);
			throw new ManualException(ErrorMessage.getMessage("102"));
		}
		catch (SQLException e)
		{
			throw new ManualException(ErrorMessage.getMessage("103"));
		}
		catch(IOException e)
		{
			throw new ManualException(ErrorMessage.getMessage("104"));
		}
		return empVO;
	}
	
}
