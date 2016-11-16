<%@page import="com.ccmsd.dao.ActivityDAO"%>
<%@page import="java.text.*,java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% request.setAttribute("pageNow", "activity"); %>
 <%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<%
boolean editData=false;
String LoginUser="";
String LoginUserName="";
if(session.getAttribute("employeeID")!=null)
{
	LoginUser=session.getAttribute("employeeID").toString();
}
if(session.getAttribute("employeeName")!=null)
{
	LoginUserName=session.getAttribute("employeeName").toString();
}
if(request.getParameter("ActivityID")==null)
{
	out.println("Invalid access");
}
else
{
	SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
	%>
<div class="main">
  <div class="main-inner">
    <div class="container">
      <div class="row">
        <div class="span12">
          <div class="widget widget-nopad">
            <div class="widget-header"> <i class="icon-list-alt"></i>
              <h3>Activity Details</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="widget big-stats-container">
                <div class="widget-content">
                  <div id="big_stats" class="cf">
                  <%
                 		String ActivityOwner="";
						ActivityDAO ad=new ActivityDAO();
						String activityID=request.getParameter("ActivityID");
						ResultSet res=ad.getActivityListByID(activityID);
						if(res.next())
						{
							ActivityOwner=res.getInt("cts_taskOwnerID")+"";
							if(ActivityOwner.equalsIgnoreCase(LoginUser))
							{
								editData=true;
							}
							Date startDate=res.getDate("cts_startDate");
							Date endDate=res.getDate("cts_endDate");
					%>
                    <div class="stat"><span class="value1">Activity ID</span><br/><span class="value2" id="taskID"><%=res.getInt("cts_taskID") %></span> </div>
                    <div class="stat"><span class="value1">Activity Name</span><br/><span class="value2"><%=res.getString("cts_taskName") %></span> </div>
                    <div class="stat"><span class="value1">Activity Owner</span><br/>
                    <span class="value2">
                   	<a href="mailto:<%=res.getString("cts_employeeEmail")%>"><i class="icon-large icon-envelope-alt"></i></a>
                   	<a href="sip:<%=res.getString("cts_employeeEmail")%>"><i class="icon-large icon-comments-alt"></i></a>
                    <%=res.getString("cts_EmployeeName") %>
                    </span> </div>
                    <div class="stat"><span class="value1">Activity Time line</span><br/><span class="value2"><%=formatter.format(startDate) %> to <%=formatter.format(endDate) %></span> </div>
                  </div>
                  <h6 class="bigstats">
                  </h6>
                  <div class="stat"><span class="value3">Activity Description</span><br/><span class="value4"><%=res.getString("cts_taskDescription") %></span> </div>
                 	 <% } %>
                </div>
                <!-- /widget-content --> 
                
              </div>
            </div>
          </div>
          <!-- /widget -->
          </div>
        <!-- /span12 -->
       
        <div class="span6">
          <div class="widget widget-table action-table">
            <div class="widget-header">
              <h3 style="float:left;top:10px">Assignment</h3>
              <h3 style="float:right;top:10px">
             <% if(editData) { %>  <a href="#EditReport" data-toggle="modal"> Add Resource</a><% } %>
              </h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <table class="table table-striped table-bordered" id="asignmentTable">
                <thead>
                  <tr>
                    <th>Employee Id</th>
                    <th>Employee Name</th>
                    <th>Assignment status</th>
                   <% if(editData) { %> <th class="td-actions">complete/withdraw </th><% } %>
                   </tr>
                </thead>
                <tbody>
                <%
                ResultSet res1=ad.getAssignmentListByID(activityID);
                int count=0;
				while(res1.next())
				{
					count++;
                %>
                  <tr>
                    <td><%=res1.getInt("cts_employeeID") %></td>
                    <td><%=res1.getString("cts_EmployeeName") %></td>
                    <td><%=com.ccmsd.constants.Config.getActivityStatus(res1.getInt("cts_assignmentStatus")) %></td>
                    <% if(editData) { %> 
                    <td class="td-actions" id="td-actions<%=res1.getInt("cts_employeeID") %>">
                    <a href="javascript:;" class="btn btn-small btn-success" onclick="completeAssignment(<%=res1.getInt("cts_taskID") %>,<%=res1.getInt("cts_employeeID") %>)"><i class="btn-icon-only icon-ok"> </i></a>
                    <a href="javascript:;" class="btn btn-danger btn-small"onclick="withdrawAssignment(<%=res1.getInt("cts_taskID") %>,<%=res1.getInt("cts_employeeID") %>)"><i class="btn-icon-only icon-remove"> </i></a>
                    <img alt="" style="height:30px;display:none" id="approveLoading<%=res1.getInt("cts_employeeID") %>" src="img/ajax-loader.gif">
                    </td>
                    <% } %>
                  </tr>
                 <%
				}
                 %>
                
                </tbody>
              </table>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget --> 
        </div>
        <!-- /span6 --> 
         <div class="span6">
          <div class="widget">
            <div class="widget-header"> <i class="icon-file"></i>
              <h3>Discussion</h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
            <ul class="messages_layout">
            <li class="from_user right" style="width:95%">
                  <div class="message_wrap" style="width:100%;border:0px;">                    
                    <div class="text" style="border-top:0px">
                    	<textarea id="newComment" rows="3" cols="" style="width:100%"></textarea>
                    	<button class="btn btn-success" style="float:right" id='addCommentBox' onclick="addComment(<%=activityID %>,'<%=LoginUser %>','<%=LoginUserName %>')">Send</button>
                     </div>
                  </div>
                </li>
            </ul>
              <ul class="messages_layout" id="message_body">
               <%
               ResultSet commentRes=ad.getCommentListByID(activityID);
               while(commentRes.next())
               {
            	   String currentCommentID=commentRes.getInt("cts_commentID")+"";
               %>
               <span id="<%=currentCommentID %>">
                <li class="from_user left"> <a href="#" class="avatar"><img src="img/message_avatar1.png"/></a>
                  <div class="message_wrap"> <span class="arrow"></span>
                    <div class="info"> <a class="name"><%=commentRes.getString("cts_EmployeeName") %></a> <span class="time"><%=commentRes.getDate("cts_commentDate") %></span>
                      <div class="options_arrow">
                        <div class="dropdown pull-right"> <a class="dropdown-toggle " id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="#"> <i class=" icon-caret-down"></i> </a>
                          <ul class="dropdown-menu " role="menu" aria-labelledby="dLabel">
                            <li><a href="javascript:;" onclick="popupreply(<%=currentCommentID %>,'<%=LoginUser %>','<%=LoginUserName %>')" ><i class=" icon-share-alt icon-large"></i> Reply</a></li>
                            
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="text"><%=commentRes.getString("cts_commentDescription") %></div>
                  </div>
                </li>
                <%
                
                ResultSet replyRes=ad.getReplyistByID(currentCommentID);
                while(replyRes.next())
                {
                %>
                <li class="by_myself right"> <a href="#" class="avatar"><img src="img/message_avatar1.png"/></a>
                  <div class="message_wrap"> <span class="arrow"></span>
                    <div class="info"> <a class="name"><%=replyRes.getString("cts_EmployeeName") %></a> <span class="time"><%=replyRes.getDate("cts_replyDate") %></span>
                      <div class="options_arrow">
                        <div class="dropdown pull-right"> <a class="dropdown-toggle " id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="#"> <i class=" icon-caret-down"></i> </a>
                          <ul class="dropdown-menu " role="menu" aria-labelledby="dLabel">
                            <li><a href="javascript:;" onclick="popupreply(<%=currentCommentID %>,'<%=LoginUser %>','<%=LoginUserName %>')" ><i class=" icon-share-alt icon-large"></i> Reply</a></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="text"><%=replyRes.getString("cts_replyDescription") %> </div>
                  </div>
                </li>
                <%
                }%>
                </span>
               <%}
                %>
              </ul>
            </div>
            <!-- /widget-content --> 
          </div>
          <!-- /widget --> 
        </div>
        <!-- /span6 -->
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /main-inner --> 
</div>
<!-- /main -->

<div id="EditReport" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" >x</button>
    <h3 id="myModalLabel">Select Employee</h3>
  </div>
  <div class="modal-body">
   <div class="control-group">	
   <label class="control-label" >Employee ID</label>
   <div class="controls">
   <div class="input-append" >
<input class="span2 m-wrap" type="number"  id="modal_empID" value="" autocomplete="off">
<button class="btn btn-primary" style="margin-top:-10px;" type="button" id="modal_search"><span class="icon-search"></span>Search</button><img alt="" style="height:30px;display:none" id="managerLoading" src="img/ajax-loader.gif"><br/><br/>
  <span id="modalEmployeeResult"></span>
</div>
     </div>
     </div>
    </div>
    <div class="modal-footer">
      <button class="btn " id="frm_cancel" data-dismiss="modal" aria-hidden="true">Cancel</button>
    </div>
  </div>
  
  <a href="#popReply" id="ModalpopReply" data-toggle="modal"></a>
  <div id="popReply" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" id="closeModal" class="close" data-dismiss="modal" >x</button>
    <h3 id="myModalLabel">Add reply</h3>
  </div>
  <div class="modal-body">
   <div class="control-group">	
   <div class="controls">
   <div class="input-append" >
				<div class="message_wrap" style="width:100%;border:0px;">                    
                    <div class="text" style="border-top:0px">
                    	<textarea id="newReply" rows="3" cols="" style="width:100%"></textarea>
                    	<button class="btn btn-success" style="float:right" id='addReplyBox' onclick="addReply()">Send</button>
                     </div>
    </div>
</div>
     </div>
     </div>
    </div>
  </div>
  <input type="hidden" id="commentID" />
  <input type="hidden" id="updateID" />
  <input type="hidden" id="updateName" />
<%
}
%>
<%@ include file="footer.jsp" %>
<script src="js/activity.js"></script> 