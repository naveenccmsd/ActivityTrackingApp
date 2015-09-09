<div class="subnavbar">

<%
if (session.getAttribute("employeeID") != null)
     {
	boolean isManagerAccess=false;
	if(session.getAttribute("employeeRole").equals(1) || session.getAttribute("employeeRole").equals(9) )
	{
		isManagerAccess=true;
		request.setAttribute("isManagerAccess","true");
	}
	else
	{
		request.setAttribute("isManagerAccess","false");
	}
     %>
     <div class="subnavbar-inner">
    <div class="container">  
      <ul class="mainnav">
        <li <% if(request.getAttribute("pageNow").equals("dashboard")){ %> class="active" <% } %>><a href="home.jsp"><i class="icon-dashboard"></i><span>Dashboard</span> </a> </li>
        <li class="dropdown <% if(request.getAttribute("pageNow").equals("activity")){ %> active <% } %>"  ><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-search"></i><span>Track Activity</span> <b class="caret"></b> </a>
        	<ul class="dropdown-menu">
           <% if(isManagerAccess) { %> <li><a href="addActivity.jsp">Add Activity</a></li> <% } %>
            <li><a href="viewActivity.jsp?frm_activityID=0&loginUser=true">Assign Activity </a></li>
            <li><a href="viewActivity.jsp?frm_activityID=0">View Activity</a></li>
          </ul>
         </li>
        <li class="dropdown <% if(request.getAttribute("pageNow").equals("resource")){ %> active <% } %>"  ><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-user-md"></i><span>Resource management</span> <b class="caret"></b> </a>
        	<ul class="dropdown-menu">
            <li><a href="addResource.jsp">Add Resource</a></li>
            <li><a href="viewResource.jsp">View Resource </a></li>
            <li><a href="viewResource.jsp?frm_employeeID=&pendingApprove">Pending Request</a></li>
          </ul>
         </li>
        <!-- <li><a href="shortcodes.html"><i class="icon-code"></i><span>Shortcodes</span> </a> </li> -->
        <li class="dropdown <% if(request.getAttribute("pageNow").equals("help")){ %> active <% } %>"><a href="help.jsp"> <i class="icon-info-sign"></i><span>Help</span> <b class="caret"></b></a>
          <!-- <ul class="dropdown-menu">
            <li><a href="icons.html">Icons</a></li>
            <li><a href="faq.html">FAQ</a></li>
            <li><a href="pricing.html">Pricing Plans</a></li>
            <li><a href="login.html">Login</a></li>
            <li><a href="signup.html">Signup</a></li>
            <li><a href="error.html">404</a></li>
          </ul> -->
        </li>
      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
<% } %>
</div>
<!-- /subnavbar -->

