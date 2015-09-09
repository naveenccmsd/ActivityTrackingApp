package com.ccmsd.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;

import com.ccmsd.constants.SqlOueryConstants;
import com.ccmsd.utility.DatabaseUtil;

public class CommentDAO {

	public boolean addNewComment(int taskID,String newComment,int upadetBy) throws ClassNotFoundException, IOException, SQLException
	{
		boolean res=false;
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.addNewCommentQuery;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,newComment);
		ps.setInt(2,upadetBy);
		ps.setDate(3,new Date(Calendar.getInstance().getTime().getTime()));
		ps.setInt(4,taskID);
		if(ps.executeUpdate()>0)
		{
				res=true;
		}
		return res;
	}
	public boolean addNewReply(int commentID,String newReply,int upadetBy) throws ClassNotFoundException, IOException, SQLException
	{
		boolean res=false;
		Connection conn=DatabaseUtil.getConnection();
		String sql=SqlOueryConstants.addNewReplyQuery;
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,newReply);
		ps.setInt(2,upadetBy);
		ps.setDate(3,new Date(Calendar.getInstance().getTime().getTime()));
		ps.setInt(4,commentID);
		if(ps.executeUpdate()>0)
		{
				res=true;
		}
		return res;
	}
}
