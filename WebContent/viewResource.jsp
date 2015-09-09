<%@page import="com.ccmsd.dao.EmployeeDAO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% request.setAttribute("pageNow", "resource"); %>
<% request.setAttribute("resource", "view"); %>
 <%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<div class="main">
	
	<div class="main-inner">

	    <div class="container">
	
	      <div class="row">
	      	
	      	<div class="span12">      		
	      		
	      		<div class="widget ">
	      			
	      			<div class="widget-header">
	      				<i class="icon-user"></i>
	      				<h3>Resource List</h3>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
						
						
						
						<div class="tabbable">
							<div class="tab-content">
								<div class="tab-pane active" id="formcontrols">
								<form id="creat_account" class="form-horizontal" >
									<fieldset>
									
										
										 <div class="control-group">											
											<label class="control-label" >Employee ID</label>
											
                                            <div class="controls">
                                               <div class="input-prepend input-append">
                                                  <span class="add-on">starts with</span>
                                                  <input class="span2" name="frm_employeeID" id="frm_employeeID" type="number" autocomplete="off" required="required">
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
										if(request.getParameter("frm_employeeID")!=null)
										{
											EmployeeDAO ed=new EmployeeDAO();
											String employeeID=request.getParameter("frm_employeeID");
											if(employeeID.equals("0")){employeeID="";}
											ResultSet res=ed.getEmployeeListByID(employeeID);	
											boolean pa=false;
											if(request.getParameter("pendingApprove")!=null)
											{
												pa=true;
											}
										%>
										 <table class="table table-striped table-bordered">
							                <thead>
							                  <tr>
							                    <th>Employee ID </th>
							                    <th> Employee Name</th>
							                    <th>Employee Email</th>
							                    <th>Employee Role</th>
							                    <th>Employee Status</th>
							                    <th>Manager ID</th>
							                    <th>manager Name</th>
							                    <th class="td-actions"> </th>
							                  </tr>
							                </thead>
							                <tbody>
							                
							                <%
							                int count=0;
							                while(res.next())
											 { 
							                	
							                	boolean display=false;
							                	if(pa)
							                	{
							                		String tmp="";
							                		if(session.getAttribute("employeeID")!=null)
							                		{
							                			tmp=session.getAttribute("employeeID").toString();
							                		}
							                		if(res.getInt("cts_employeeStatus")==0 && (res.getInt("cts_ManagerID")+"").equalsIgnoreCase(tmp))
							                		{
							                			display=true;
							                		}
							                	}
							                	else
							                	{
							                		display=true;
							                	}
							                		if(display)
							                		{
							                			count++;
											 %>
							                 <tr>
							                    <td><%=res.getInt("cts_EmployeeID") %> </td>
							                    <td><%=res.getString("cts_EmployeeName") %></td>
							                    <td><%=res.getString("cts_employeeEmail") %> </td>
							                    <td><%=com.ccmsd.constants.config.getRole(res.getInt("cts_employeeRole")) %></td>
							                    <td><%=com.ccmsd.constants.config.getStatus(res.getInt("cts_employeeStatus")) %> </td>
							                    <td><%=res.getInt("cts_ManagerID") %></td>
							                    <td><%=res.getString("ManagerName") %></td>
							                    <td class="td-actions" id="td-actions<%=res.getInt("cts_EmployeeID") %>">
							                    <% if((res.getInt("cts_ManagerID")+"").equalsIgnoreCase(session.getAttribute("employeeID").toString())){ %>
							                    
							                    <% if(res.getInt("cts_employeeStatus")==0)
							                    {
							                    	%>
							                    <a href="javascript:;" class="btn btn-warning btn-small" onclick="approveUser(<%=res.getInt("cts_EmployeeID") %>)">Approve User<i class="btn-icon-only icon-download"> </i></a>
							                    <% }
							                    else if(res.getInt("cts_employeeStatus")==1)
							                    {
							                    %>
							                    <a href="javascript:;" class="btn btn-small btn-success">Approved<i class="btn-icon-only icon-ok"> </i></a>
							                    <% } %>
							                    <% } %>
							                    <img alt="" style="height:30px;display:none" id="approveLoading<%=res.getInt("cts_EmployeeID") %>" src="img/ajax-loader.gif">
							                    </td>
							                  </tr>
							             	<% } 
											 }
							                if(count<=0)
							                {
							                	%>
							                	<tr>
							                	<td colspan=8>No records found</td>
							                	</tr> 
							                	<%
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
<script src="js/manager.js"></script> 