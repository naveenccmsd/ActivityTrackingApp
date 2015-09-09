package com.ccmsd.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ccmsd.constants.SqlOueryConstants;
import com.ccmsd.utility.DatabaseUtil;

public class EmployeeDAO {

	public  ResultSet getEmployeeListByID(String EmplyoeeID) throws ClassNotFoundException, IOException, SQLException
	{
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.employeeLsitQuery;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,EmplyoeeID+"%");
		ResultSet res=ps.executeQuery();
		return res;
	}
}
