package com.ccmsd.constants;

import java.util.Locale;
import java.util.ResourceBundle;

public class config {

	public static String getMessage(String key){
		Locale loc=Locale.getDefault();
		ResourceBundle rb=ResourceBundle.getBundle("config",loc);
		return rb.getString(key);
	}
	public static String getActivityStatus(int ActivityStatusID)
	{
		String ActivityStatus=null;
		if(ActivityStatusID==0)
		{
			ActivityStatus="In Progress";
		}
		else if(ActivityStatusID==1)
		{
			ActivityStatus="Completed";
		}
		else if(ActivityStatusID==2)
		{
			ActivityStatus="Withdrawn";
		}
		return ActivityStatus;
		
	}
	public static String getRole(int RoleID)
	{
		String Rolename=null;
		if(RoleID==0)
		{
			Rolename="User";
		}
		else if(RoleID==1)
		{
			Rolename="Manager";
		}
		else if(RoleID==9)
		{
			Rolename="Admin";
		}
		return Rolename;
		
	}
	public static String getStatus(int StatusID)
	{
		String Statusname=null;
		if(StatusID==0)
		{
			Statusname="Approval Pending";
		}
		else if(StatusID==1)
		{
			Statusname="Active";
		}
		else if(StatusID==9)
		{
			Statusname="InActive";
		}
		return Statusname;
		
	}
	public final static String getRole(String RoleID)
	{
		String Rolename=null;
		if(RoleID.equals("0"))
		{
			Rolename="User";
		}
		else if(RoleID.equals("1"))
		{
			Rolename="Manager";
		}
		else if(RoleID.equals("9"))
		{
			Rolename="Admin";
		}
		return Rolename;
	}
	
}
