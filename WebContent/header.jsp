<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Activity Tracking App</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css">
<link href="css/fonts-googleapis.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/pages/dashboard.css" rel="stylesheet" type="text/css">
<link href="css/pages/signin.css" rel="stylesheet" type="text/css">
<link href="css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/pages/faq.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="js/html5.js"></script>
    <![endif]-->
<script src="js/jquery-1.7.2.min.js"></script> 
<link href="css/hard.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="index.jsp">Activity tracking App </a>
     <%
     if (session.getAttribute("employeeID") == null)
     {
     %>
      <div class="nav-collapse">
				<ul class="nav pull-right">
					
					<li class="">						
						<a href="addResource.jsp" class="">
							Don't have an account?
						</a>
						
					</li>
					
					<li class="">						
						<a href="mailto:<%=com.ccmsd.constants.Config.getMessage("adminEmail") %>?subject=Issue with Activity tracking App" class="">
							<i class="icon-chevron-left"></i>
							Report issue
						</a>
						
					</li>
				</ul>
				
			</div><!--/.nav-collapse -->
     <%
     }
     else{
     %>
      <div class="nav-collapse">
        <ul class="nav pull-right">
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-user"></i>
                            <span id="employeeName" style="sisplay:none"><%=session.getAttribute("employeeName") %></span>
                            <span id="employeeID" style="display:none"><%=session.getAttribute("employeeID") %></span>
                             <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <!-- <li><a href="javascript:;">Profile</a></li> -->
              <li><a href="logout.jsp">Logout</a></li>
            </ul>
          </li>
        </ul>
       <!--  <form class="navbar-search pull-right">
          <input type="text" class="search-query" placeholder="Search">
        </form> -->
      </div>
      <!--/.nav-collapse --> 
      <%
     }
      %>
     	
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>
<!-- /navbar -->
<%
if(session.getAttribute("employeeID") == null)
{
	if(!request.getAttribute("pageNow").equals("login") && !request.getAttribute("pageNow").equals("resource"))
	{
		response.sendRedirect("login.jsp");
	}
	else if(request.getAttribute("pageNow").equals("resource"))
	{
		if(!request.getAttribute("resource").equals("add"))
		{
			response.sendRedirect("login.jsp");
		}
	}
}
%>