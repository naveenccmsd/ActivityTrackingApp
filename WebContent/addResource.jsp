<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% request.setAttribute("pageNow", "resource"); %>
<% request.setAttribute("resource", "add"); %>
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
	      				<h3>Create Account</h3>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
						
						
						
						<div class="tabbable">
							<div class="tab-content">
								<div class="tab-pane active" id="formcontrols">
								<form id="creat_account" class="form-horizontal" method="post" action="RegisterController" onsubmit="return validation()">
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
											<label class="control-label" >Employee ID</label>
											
                                            <div class="controls">
                                               <div class="input-prepend input-append">
                                                  <span class="add-on"><span class=" icon-user"></span></span>
                                                  <input class="span2" name="frm_employeeID" type="number" autocomplete="off" required="required">
                                                </div>
                                              </div>	<!-- /controls -->			
										</div> <!-- /control-group -->
										 <div class="control-group">											
											<label class="control-label">Email Address</label>
											
                                            <div class="controls">
                                               <div class="input-prepend input-append">
                                                  <span class="add-on"><span class="icon-envelope"></span></span>
                                                  <input class="span2" name="frm_employeeEmail" type="text" autocomplete="off" required="required">
                                                   <span class="add-on">@cognizant.com</span></span>
                                                </div>
                                              </div>	<!-- /controls -->			
										</div> <!-- /control-group -->
										
										<div class="control-group">											
											<label class="control-label" >Password</label>
											<div class="controls">
												<input type="password" name="frm_employeePassword" class="span4"  value="" autocomplete="off" required="required">
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										<div class="control-group">											
											<label class="control-label" >Employee Name</label>
											<div class="controls">
												<input type="text" name="frm_employeeName" class="span4" value="" autocomplete="off" required="required">
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										<div class="control-group">											
											<label class="control-label" >Phone/Vnet Number</label>
											<div class="controls">
												<input type="number" name="frm_employeePhone" class="span4" value="" autocomplete="off" >
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										<div class="control-group">											
											<label class="control-label" >Mobile Number</label>
											<div class="controls">
												<input type="number" name="frm_employeeMobile" class="span4" value="" autocomplete="off">
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
                                      
                                          <div class="control-group">											
											<label class="control-label" name="frm_employeeRole1" for="radiobtns">Role</label>
											
                                            <div class="controls">
                                              <div class="btn-group">
                                              <input type="hidden" name="frm_employeeRole" id="frm_employeeRole" value="0" />
                                              <a class="btn btn-primary" href="javascript:;"><i class="icon-user icon-white"></i> <span id="tmp_employeerole">User</span></a>
                                              <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                                              <ul class="dropdown-menu">
                                                <li><a href="javascript:;" onclick="changeRole(0)"><i class="icon-pencil"></i>User</a></li>
                                                <li><a href="javascript:;" onclick="changeRole(1)"><i class="icon-trash"></i> Manager</a></li>
                                                <li class="divider"></li>
                                                <li><a href="javascript:;" onclick="changeRole(9)"><i class="i"></i> Make Admin</a></li>
                                              </ul>
                                            </div>
                                              </div>	<!-- /controls -->			
										</div> <!-- /control-group -->
                                        
                                        <div class="control-group">											
											<label class="control-label" >Reports To </label>
											
                                            <div class="controls">
                                               <div class="input-append">
                                                  <input class="span2 m-wrap"  disabled type="text"  id="frm_managerID" value="None" required="required">
                                                  <input type="hidden" name="frm_managerID" id="hidden_frm_managerID" value="None" />
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
											<label class="control-label" >Project ID</label>
											<div class="controls">
												<input type="Text" class="span4" name="frm_projectID" value="" autocomplete="off">
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										 <br />
										<div class="control-group">
										<label class="control-label" ></label>
											<div class="controls">
											<button type="submit" class="btn btn-primary">Create Account</button> 
											
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

<%@ include file="footer.jsp" %>
<script src="js/manager.js"></script> 