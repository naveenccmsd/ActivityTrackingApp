$("#findManager").click(function(){
	var managerID=$("#managerID").val();
	$.ajax({
	      url: 'manager.jsp?managerID='+managerID,
	      data: {},
	      error: function() {
	        // $('#info').html('<p>An error has occurred</p>');
	    	  $("#managerLoading").css("display","none");
	    	  $("#ManagerResult").html("<p><font color='red'>An error has occurred</font></p>");
	    	  
	      },
	      beforeSend: function(xhr ) {
		         $("#managerLoading").css("display","inline");
		      },
	      dataType: 'text',
	      success: function(data) {
	    	  $("#managerLoading").css("display","none");
	    	  $("#ManagerResult").html(data);
	      },
	      type: 'GET'
	   });
});
function setManagerID(str)
{
	$("#frm_managerID").val(str);
	$("#hidden_frm_managerID").val(str);
	$("#frm_cancel").click();
}
function changeRole(str)
{
	var role="";
	if(str=="0"){role="User";}
	if(str=="1"){role="Manager";}
	if(str=="9"){role="Admin";}
	$("#frm_employeeRole").val(str);
	$("#tmp_employeerole").html(role);
}
function validation()
{
	var ret=true;
	if($("#frm_managerID").val()=="None")
	{
		alert("Please select Your Manager...Please select Admin and send manager approval mail to admin If your manager id not listed ");
		ret=false;
	}
	return ret;
}
$("#frm_employeeID").click(function(){
	var managerID=$("#managerID").val();
	$.ajax({
	      url: 'manager.jsp?managerID='+managerID,
	      data: {},
	      error: function() {
	        // $('#info').html('<p>An error has occurred</p>');
	    	  $("#managerLoading").css("display","none");
	    	  $("#ManagerResult").html("<p><font color='red'>An error has occurred</font></p>");
	    	  
	      },
	      beforeSend: function(xhr ) {
		         $("#managerLoading").css("display","inline");
		      },
	      dataType: 'text',
	      success: function(data) {
	    	  $("#managerLoading").css("display","none");
	    	  $("#ManagerResult").html(data);
	      },
	      type: 'GET'
	   });
});

function approveUser(empID)
{
	$.ajax({
	      url: 'manager.jsp?approveUser='+empID,
	      data: {},
	      error: function() {
	        // $('#info').html('<p>An error has occurred</p>');
	    	  $("#approveLoading"+empID).css("display","none");
	    	  $("#td-actions"+empID).html("<p><font color='red'>An error has occurred.Please contact Admin</font></p>");
	    	  
	      },
	      beforeSend: function(xhr ) {
		         $("#approveLoading"+empID).css("display","inline");
		      },
	      dataType: 'text',
	      success: function(data) {
	    	  $("#approveLoading").css("display","none");
	    	  $("#td-actions"+empID).html(data);
	      },
	      type: 'GET'
	   });
}
function Activity_validation()
{
	var start=$("#frm_startDate").val();
	var end=$("#frm_endDate").val();
	var s=new Date(start);
	var e=new Date(end);
	var diff = new Date(e - s);
	// get days
	var days = diff/1000/60/60/24;
	if(days>=0)
	{
	return true;
	}
	else
	{
	alert("Please validate Start and End date");
	return false;
	}
	return false;
}