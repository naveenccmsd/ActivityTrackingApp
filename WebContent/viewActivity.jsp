<%@page import="com.ccmsd.dao.ActivityDAO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% request.setAttribute("pageNow", "activity"); %>
 <%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<%
String LoginUser="";
if(session.getAttribute("employeeID")!=null)
{
	LoginUser=session.getAttribute("employeeID").toString();
}
%>
<div class="main">
	
	<div class="main-inner">

	    <div class="container">
	
	      <div class="row">
	      	
	      	<div class="span12">      		
	      		
	      		<div class="widget ">
	      			
	      			<div class="widget-header">
	      				<i class="icon-user"></i>
	      				<h3>Activity List</h3>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
						
						
						
						<div class="tabbable">
							<div class="tab-content">
								<div class="tab-pane active" id="formcontrols">
								<form id="creat_account" class="form-horizontal" >
									<fieldset>
										<%
										String lgUser="false";
										if(request.getParameter("loginUser")!=null)
										{
											lgUser=request.getParameter("loginUser");
										}
										if(lgUser.equals("false"))
										{
										%>
										 <div class="control-group">											
											<label class="control-label" >Activity ID</label>
											
                                            <div class="controls">
                                               <div class="input-prepend input-append">
                                                  <span class="add-on">starts with</span>
                                                  <input class="span2" name="frm_activityID" id="frm_activityID" type="number" autocomplete="off" required="required">
                                                </div>
                                              </div>	<!-- /controls -->			
										</div> <!-- /control-group -->
										
										<div class="control-group">
										<label class="control-label" ></label>
											<div class="controls">
											<button  class="btn btn-primary">Search</button> 
											</div>
										</div> <!-- /form-actions -->
										<%
										}
										%>
										<%
										if(request.getParameter("frm_activityID")!=null)
										{
											ActivityDAO ad=new ActivityDAO();
											String activityID=request.getParameter("frm_activityID");
											if(activityID.equals("0")){activityID="";}
											ResultSet res=ad.getActivityListByID(activityID);	
										%>
										 <table id="dataTable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
							                <thead>
							                  <tr>
							                    <th>activity ID </th>
							                    <th>activity Name</th>
							                    <th>activity Description</th>
							                    <th>activity Status</th>
							                    <th>Owner ID</th>
							                    <th>Owner Name</th>
							                    <th>Start date</th>
							                    <th>End date</th>
							                    <th class="td-actions"> </th>
							                  </tr>
							                </thead>
							                <tbody>
							          
							                <%
							                int count=0;
							                while(res.next())
											 { 
							                	count++;
							                	String OwnerID=res.getInt("cts_taskOwnerID")+"";
							                	boolean show=true;
							                	boolean access=false;
							                	if(OwnerID.equals(LoginUser))
						                		{
							                		access=true;
						                		}
							                	if(request.getParameter("loginUser")!=null)
							                	{
							                		if(!access)
							                		{
							                			show=false;
							                		}
							                	}
							                	if(show)
							                	{
							                		
											 %>
							                 <tr>
							                    <td><%=res.getInt("cts_taskID") %> </td>
							                    <td><%=res.getString("cts_taskName") %></td>
							                    <td><%=res.getString("cts_taskDescription") %> </td>
							                    <td>							                    
							                   <% if(res.getInt("cts_taskStatus")==0){ %> <a href="javascript:;" class="btn btn-warning btn-small" >In Progress<i class="btn-icon-only icon-hand-up"> </i></a><% } %>
							                   <% if(res.getInt("cts_taskStatus")==2){ %><a href="javascript:;" class="btn btn-danger btn-small" >Withdrawn<i class="btn-icon-only icon-hand-down"> </i></a><% } %>
							                   <% if(res.getInt("cts_taskStatus")==1){ %> <a href="javascript:;" class="btn btn-small btn-success">Completed<i class="btn-icon-only icon-ok"> </i></a><% } %>
							                    
							                    </td>
							                    <td><%=res.getInt("cts_taskOwnerID") %> </td>
							                    <td><%=res.getString("cts_EmployeeName") %></td>
							                    <td><%=res.getDate("cts_startDate") %></td>
							                    <td><%=res.getDate("cts_endDate") %></td>
							                    <td class="td-actions" id="td-actions">
							                    <a href="viewActivityByID.jsp?ActivityID=<%=res.getInt("cts_taskID") %>">view</a>
							                    </td>
							                  </tr>
							             	<% 
											 }
											 }
							             	%>
							                </tbody>
							              </table>
							              <% } %>
									</fieldset>
								</form>
								</div>
							</div>
						</div>
					</div> <!-- /widget-content -->
						
				</div> <!-- /widget -->
	      		
		    </div> <!-- /span8 -->
	      	
	      	
	      	
	      	
	      </div> <!-- /row -->
	
	    </div> <!-- /container -->
	    
	</div> <!-- /main-inner -->
    
</div> <!-- /main -->
<%@ include file="footer.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
    $('#dataTable1').DataTable();
} );
</script>
<script src="js/manager.js"></script> 
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap.min.js"></script>
