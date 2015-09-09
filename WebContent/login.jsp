<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% request.setAttribute("pageNow", "login"); %>
<%@ include file="header.jsp" %>
    
<div class="account-container">
	
	<div class="content clearfix">
		
		<form action="LoginController" method="post">
		
			<h1>Member Login</h1>		
			
			<div class="login-fields">
				
				<p>Please provide your details</p>
				
				<div class="field">
					<label for="username">Username</label>
					<input type="number" id="username" name="username" value="" placeholder="Employee Id" class="login username-field" autocomplete="off" />
				</div> <!-- /field -->
				
				<div class="field">
					<label for="password">Password:</label>
					<input type="password" id="password" name="password" value="" placeholder="Password" class="login password-field"/>
				</div> <!-- /password -->
				
			</div> <!-- /login-fields -->
			
			<div class="login-actions">
				
				<span class="login-checkbox">
					<input id="Field" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
					<!-- <label class="choice" for="Field">Keep me signed in</label> -->
				</span>
				<input type="submit" class="button btn btn-success btn-large" value="Sign In" />			
				
			</div> <!-- .actions -->
			<div class="login-error">
			<% 
				if(request.getAttribute("error")!=null)
					{
						out.println(request.getAttribute("error"));
					}
			%>
			</div>
		</form>
		
	</div> <!-- /content -->
	
</div> <!-- /account-container -->



<div class="login-extra">
	<a href="mailto:<%=com.ccmsd.constants.config.getMessage("adminEmail") %>?subject=Reset Application password">Reset Password</a>
</div> <!-- /login-extra -->

