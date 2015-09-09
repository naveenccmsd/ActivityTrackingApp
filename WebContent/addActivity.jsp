<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <% request.setAttribute("pageNow", "activity"); %>
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>
<%
if(request.getAttribute("isManagerAccess").equals("false"))
{
	out.println("INVALID ACCESS");
}
else
{
%>
<div class="main">
	
	<div class="main-inner">

	    <div class="container">
	
	      <div class="row">
	      	
	      	<div class="span12">      		
	      		
	      		<div class="widget ">
	      			
	      			<div class="widget-header">
	      				<i class="icon-user"></i>
	      				<h3>Add Activity</h3>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
						
						
						
						<div class="tabbable">
							<div class="tab-content">
								<div class="tab-pane active" id="formcontrols">
								<form id="creat_account" class="form-horizontal" method="post" action="ActivityController" onsubmit="return Activity_validation()">
									<fieldset>
									<% 
								if(request.getAttribute("error")!=null)
									{
										
									%>

											<div class="control-group" >
												<label class="control-label"></label>
												<div class="controls">
													 <div class="alert">
                                              <button type="button" class="close" data-dismiss="alert">&times;</button>
                                              <strong>Warning!</strong> <% out.print(request.getAttribute("error")); %>
                                            </div>
											</div> <!-- /control-group -->
										<% } %>
										
										<% 
								if(request.getAttribute("success")!=null)
									{
										
									%>

											<div class="control-group" >
												<label class="control-label"></label>
												<div class="controls">
													 <div class="alert alert-success">
                                              <button type="button" class="close" data-dismiss="alert">&times;</button>
                                              <strong></strong> <% out.print(request.getAttribute("success")); %>
                                            </div>
											</div> <!-- /control-group -->
										<% } %>										
										<div class="control-group">											
											<label class="control-label" >Activity Name</label>
											<div class="controls">
												<input type="text" name="frm_activityName" class="span4" value="" autocomplete="off" required="required">
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										<div class="control-group">											
											<label class="control-label" >Description</label>
											<div class="controls">
												<input type="text" name="frm_description" class="span4" value="" autocomplete="off" >
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
                                         
                                        <div class="control-group">											
											<label class="control-label" >Activity owner</label>
											
                                            <div class="controls">
                                               <div class="input-append">
                                                  <input class="span2 m-wrap"  disabled type="text"  id="frm_managerID" value="<%=session.getAttribute("employeeID") %>" required="required">
                                                  <input type="hidden" name="frm_managerID" id="hidden_frm_managerID" value="<%=session.getAttribute("employeeID") %>" />
                                                 <a href="#EditReport" data-toggle="modal"> <button class="btn" type="button"><span class="icon-edit"></span>Edit</button></a>
                                                </div>
                                             
                                                    <!-- Modal -->
                                                    <div id="EditReport" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" >x</button>
                                                        <h3 id="myModalLabel">Select Manager</h3>
                                                      </div>
                                                      <div class="modal-body">
                                                       <div class="control-group">	
                                                       <label class="control-label" >Employee ID</label>
                                                       <div class="controls">
                                                       <div class="input-append" >
		                                                  <input class="span2 m-wrap" type="number"  id="managerID" value="" autocomplete="off">
		                                                  <button class="btn btn-primary" type="button" id="findManager"><span class="icon-search"></span>Search</button><img alt="" style="height:30px;display:none" id="managerLoading" src="img/ajax-loader.gif"><br/><br/>
		                                                  <span id=ManagerResult></span>
		                                                </div>
                                                       </div>
                                                       </div>
                                                      </div>
                                                      <div class="modal-footer">
                                                        <button class="btn " id="frm_cancel" data-dismiss="modal" aria-hidden="true">Cancel</button>
                                                      </div>
                                                    </div>
                                              </div>	<!-- /controls -->			
										</div> <!-- /control-group -->
										
                                        <div class="control-group">											
											<label class="control-label" >Start Date</label>
											<div class="controls">
												<input type="date" class="span4" name="frm_startDate" id="frm_startDate"  autocomplete="off" required="required">
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										 <div class="control-group">											
											<label class="control-label" >End Date</label>
											<div class="controls">
												<input type="date" class="span4" name="frm_endDate" id="frm_endDate"  required="required" autocomplete="off">
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										 <br />
										<div class="control-group">
										<label class="control-label" ></label>
											<div class="controls">
											<button type="submit" class="btn btn-primary">Create Activity</button> 
											
											</div>
										</div> <!-- /form-actions -->
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
<%
}
%>
<%@ include file="footer.jsp" %>
<script src="js/manager.js"></script> 