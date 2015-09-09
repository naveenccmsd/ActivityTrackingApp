package com.ccmsd.constants;

public class SqlOueryConstants {

	public final static String sampleOuery="SELECT NOW() as CurrentDate";
	public final static String userLoginQuery="select cts_employeeID,cts_employeeEmail,cts_EmployeeName,cts_employeeRole from cts_userlogin join cts_employeedetails using (cts_EmployeeID) where cts_employeeID=? and cts_employeePassword=? and cts_employeeStatus=1";
	public final static String managerLsitQuery="SELECT cts_EmployeeID,cts_EmployeeName FROM cts_employeedetails join cts_userlogin using (cts_EmployeeID) where cts_employeeID LIKE ? and (cts_employeeRole=1 or cts_employeeRole=9)";
	public final static String getEmployeeList="SELECT cts_EmployeeID,cts_EmployeeName FROM cts_employeedetails join cts_userlogin using (cts_EmployeeID) where cts_employeeID LIKE ?";
	public final static String approveUserById="Update cts_userlogin set cts_employeeStatus=1 where cts_employeeID=?";
	public final static String addAssignmentQuery="insert into cts_taskassignment (cts_taskID,cts_employeeID,cts_updatedBy,cts_completeComments) VALUES(?,?,?,?)";
	public final static String addNewCommentQuery="insert into cts_commentdetails (cts_commentDescription,cts_commentFrom,cts_commentDate,cts_taskID) VALUES(?,?,?,?)";
	public final static String addNewReplyQuery="insert into cts_replydetails (cts_replyDescription,cts_replyFrom,cts_replyDate,cts_commentID) VALUES(?,?,?,?)";
	public final static String completeAssignmentById="Update cts_taskassignment set cts_assignmentStatus=1 where cts_taskID=? and cts_employeeID=?";
	public final static String withdrawAssignmentById="Update cts_taskassignment set cts_assignmentStatus=2 where cts_taskID=? and cts_employeeID=?";
	public final static String employeeLsitQuery="SELECT A.cts_EmployeeID,B.cts_EmployeeName,A.cts_employeeRole,A.cts_employeeStatus,B.cts_ManagerID,c.cts_EmployeeName as ManagerName ,B.cts_projecctID,B.cts_employeePhone,B.cts_employeeMobile,A.cts_employeeEmail FROM cts_employeedetails B join cts_userlogin A using (cts_EmployeeID) join cts_employeedetails C where B.cts_ManagerID=c.cts_EmployeeID and A.cts_employeeID LIKE ? ";
	public final static String activityLsitQuery="SELECT T.cts_taskID,T.cts_taskName,T.cts_taskDescription,T.cts_taskStatus,T.cts_startDate,T.cts_endDate,T.cts_taskOwnerID,E.cts_EmployeeName,L.cts_employeeEmail from cts_userlogin L join cts_employeedetails E using (cts_EmployeeID)  join cts_taskinfo T  where T.cts_taskOwnerID=E.cts_EmployeeID  and T.cts_taskID LIKE ? ";
	public final static String activityDetailsQuery=" SELECT cts_taskID,cts_taskName,cts_startDate,cts_endDate,cts_assignmentStatus,cts_taskOwnerID from cts_taskassignment join cts_taskinfo using (cts_taskID) where cts_employeeID=? or cts_taskOwnerID=? group by cts_taskName";
	public final static String CommentLsitQuery="Select cts_commentID,cts_commentDescription,cts_commentFrom,cts_commentDate,cts_EmployeeName from cts_commentdetails C join cts_employeedetails E where C.cts_commentFrom=E.cts_EmployeeID and cts_taskID=? order by cts_commentID desc";
	public final static String ReplyLsitQuery="Select cts_replyID,cts_replyDescription,cts_replyFrom,cts_replyDate,cts_EmployeeName from cts_replydetails R join cts_employeedetails E where R.cts_replyFrom=E.cts_EmployeeID and cts_commentID=? order by cts_replyID asc";
	public final static String assignmentLsitQuery="SELECT A.cts_taskID,A.cts_employeeID,E.cts_EmployeeName,A.cts_assignmentStatus,A.cts_completeComments from cts_taskassignment A join cts_employeedetails E using (cts_EmployeeID) where A.cts_taskID LIKE ?";
	public final static String registerQuery="insert into cts_employeedetails(`cts_EmployeeID`, `cts_EmployeeName`, `cts_ManagerID`, `cts_projecctID`,  `cts_employeePhone`, `cts_employeeMobile`) VALUES (?,?,?,?,?,?)";
	public static String registerQuery1="insert into cts_userlogin (`cts_employeeID`, `cts_employeePassword`, `cts_employeeEmail`, `cts_employeeRole`) VALUES (?,?,?,?)";
	public static String addActivityQuery="insert into cts_taskinfo (cts_taskID,cts_taskName,cts_taskDescription,cts_taskOwnerID,cts_startDate,cts_endDate) VALUES(?,?,?,?,?,?)";
	public static String getActivityIDQuery="select max(cts_taskID) from cts_taskinfo";
	public static String updateActivityStatusQuery="update cts_taskinfo set cts_taskStatus=1 where cts_taskID=?";
	public static String removeActivityStatusQuery="update cts_taskinfo set cts_taskStatus=2 where cts_taskID=?";
	public static String revertActivityStatusQuery="update cts_taskinfo set cts_taskStatus=0 where cts_taskID=?";
	public static String getAssignmentCountBycomplete="select count(cts_employeeID) from cts_taskassignment where cts_assignmentStatus=0 and cts_taskID=?  group by cts_taskID ";
	public static String getAssignmentCountBywithdraw="select count(cts_employeeID) from cts_taskassignment where cts_assignmentStatus=2 and cts_taskID=?  group by cts_taskID ";
	public static String getInProgressAssignmentCount="select count(cts_employeeID) from cts_taskassignment where cts_assignmentStatus=0 and cts_taskID=?  group by cts_taskID";
	public static String getCompleteAssignmentCount="select count(cts_employeeID) from cts_taskassignment where cts_assignmentStatus=1 and cts_taskID=?  group by cts_taskID";
	public static String getNewRequests="select count(cts_EmployeeID) new_request from cts_employeedetails join cts_userlogin using (cts_employeeID) where cts_ManagerID=? and cts_employeeStatus=0 ";
	public static String getStatusTasks="select Created,completed,withdrawn from (SELECT count(cts_taskID) as Created from cts_taskassignment where cts_employeeID=? and cts_assignmentStatus=0) A,(SELECT count(cts_taskID) as completed from cts_taskassignment where cts_employeeID=? and cts_assignmentStatus=1) B,(SELECT count(cts_taskID) as withdrawn from cts_taskassignment where cts_employeeID=? and cts_assignmentStatus=2) C";
}
