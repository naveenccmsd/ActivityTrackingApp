<%@page import="java.sql.ResultSet"%>
<%@page import="com.ccmsd.dao.ActivityDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% request.setAttribute("pageNow", "dashboard"); %>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<%
ActivityDAO ad=new ActivityDAO();
ResultSet res=ad.getActivityDetail(session.getAttribute("employeeID").toString());
ResultSet res1=ad.getNewRequest(session.getAttribute("employeeID").toString());
res.next();res1.next();
%>
<div class="main">

	<div class="main-inner">
		<div class="container">

			<div class="row">
				<div class="span12">
					<div class="widget">
						<div class="widget-header">
							<i class="icon-bookmark"></i>
							<h3>Dashboard</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content">
							<div class="shortcuts">
								<a href="javascript:;" class="shortcut" style="background:#34BFF9;"> 
									<i class="shortcut-icon icon-user" style="color:#fff;float:left;margin-left:10%;font-size:75px;"></i> 
									<span class="shortcut-label" style="color:#fff;float:right;margin-right:10%;font-size:15px;margin-top:10%;font-weight:bold;"><span style="font-size:30px"><%=res1.getInt("new_request") %></span> <br /> New Requests !</span>
								</a> 
								<a href="javascript:;" class="shortcut" style="background:#1AAF07;"> 
									<i class="shortcut-icon  icon-hand-right" style="color:#fff;float:left;margin-left:10%;font-size:75px;"></i> 
									<span class="shortcut-label" style="color:#fff;float:right;margin-right:10%;font-size:15px;margin-top:10%;font-weight:bold;"><span style="font-size:30px"><%=res.getInt("completed") %></span> <br />Completed Task !</span>
								</a> 
								<a href="javascript:;" class="shortcut" style="background:#F5A608;"> 
									<i class="shortcut-icon icon-time" style="color:#fff;float:left;margin-left:10%;font-size:75px;"></i> 
									<span class="shortcut-label" style="color:#fff;float:right;margin-right:10%;font-size:15px;margin-top:10%;font-weight:bold;"><span style="font-size:30px"><%=res.getInt("Created") %></span> <br />In Progress !</span>
								</a> 
								<a href="javascript:;" class="shortcut" style="background:#EC5616;"> 
									<i class="shortcut-icon icon-thumbs-down" style="color:#fff;float:left;margin-left:10%;font-size:75px;"></i> 
									<span class="shortcut-label" style="color:#fff;float:right;margin-right:10%;font-size:15px;margin-top:10%;font-weight:bold;"><span style="font-size:30px"><%=res.getInt("withdrawn") %></span> <br />Pending Task !</span>
								</a> 
							</div>
							<!-- /shortcuts -->
						</div>
						<!-- /widget-content -->
					</div>
					<!-- /widget -->

				</div>
				<!-- /span6 -->
				<div class="span6">
					<div class="widget widget-nopad">
						<div class="widget-header">
							<i class="icon-list-alt"></i>
							<h3>My Calendar</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content">
							<div id='calendar'></div>
						</div>
						<!-- /widget-content -->
					</div>
					<!-- /widget -->
				</div>

				<div class="span6">
					<div class="widget widget-nopad">
						<div class="widget-header">
							<i class="icon-list-alt"></i>
							<h3>Feedback Form</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content" style="padding:5%">
							<form action="mailto:<%=com.ccmsd.constants.Config.getMessage("adminEmail") %>" enctype="text/plain" method="GET">
							<label><b>Feedback Comments</b></label>
							<input type="hidden" name="subject" value="Feedback" />
							<textarea style="width:100%" name="body" rows="5"></textarea>
							<button class="btn btn-sucess" onclick="submitfeedback()">Submit</button>
							<script type="text/javascript">
							function submitfeedback()
							{
								
							}
							</script>
							</form>
						</div>
						<!-- /widget-content -->
					</div>
					<!-- /widget -->
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /main-inner -->
</div>
<!-- /main -->
<%@ include file="footer.jsp"%>
<script>     

      /*   var lineChartData = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
				{
				    fillColor: "rgba(220,220,220,0.5)",
				    strokeColor: "rgba(220,220,220,1)",
				    pointColor: "rgba(220,220,220,1)",
				    pointStrokeColor: "#fff",
				    data: [65, 59, 90, 81, 56, 55, 40]
				},
				{
				    fillColor: "rgba(151,187,205,0.5)",
				    strokeColor: "rgba(151,187,205,1)",
				    pointColor: "rgba(151,187,205,1)",
				    pointStrokeColor: "#fff",
				    data: [28, 48, 40, 19, 96, 27, 100]
				}
			]

        };
 */
      //  var myLine = new Chart(document.getElementById("area-chart").getContext("2d")).Line(lineChartData);


        

        $(document).ready(function() {
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        var calendar = $('#calendar').fullCalendar({
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
          },
          selectable: false,
          selectHelper: true,
          select: function(start, end, allDay) {
            var title = prompt('Event Title:');
            if (title) {
              calendar.fullCalendar('renderEvent',
                {
                  title: title,
                  start: start,
                  end: end,
                  allDay: allDay
                },
                true // make the event "stick"
              );
            }
            calendar.fullCalendar('unselect');
          },
          editable: true,
          events: [
            <% 
            ResultSet rs=ad.getActivityByUserID(session.getAttribute("employeeID").toString());
            while(rs.next())
            {
            %>
            {
              title: '<%=rs.getString("cts_taskName") %>',
              start: new Date("<%=rs.getString("cts_startDate") %>"),
              end: new Date("<%=rs.getString("cts_endDate") %>"),
              url:"viewActivityByID.jsp?ActivityID=<%=rs.getString("cts_taskID") %>"
            },            
            <%
           	}
            %>
          ]
        });
      });
    </script>
<!-- /Calendar -->
