$("#modal_search").click(function(){
	var modal_empID=$("#modal_empID").val();
	$.ajax({
	      url: 'manager.jsp?employeeID='+modal_empID,
	      data: {},
	      error: function() {
	        // $('#info').html('<p>An error has occurred</p>');
	    	  $("#managerLoading").css("display","none");
	    	  $("#modalEmployeeResult").html("<p><font color='red'>An error has occurred</font></p>");
	    	  
	      },
	      beforeSend: function(xhr ) {
		         $("#managerLoading").css("display","inline");
		      },
	      dataType: 'text',
	      success: function(data) {
	    	  $("#managerLoading").css("display","none");
	    	  $("#modalEmployeeResult").html(data);
	      },
	      type: 'GET'
	   });
});
function addComment(activityID,updatedBY,updatedBYName)
{
	var newComment=$("#newComment").val();
	if(newComment=="" || newComment==null)
		{
		return null;
		}
	var dt = new Date();
	var cdate=dt.getFullYear()+"-"+dt.getMonth()+"-"+dt.getDate();
	var time = dt.getHours() + dt.getMinutes() + dt.getSeconds();
	var msgElement='<li class="from_user left"> <a href="#" class="avatar"><img src="img/message_avatar1.png"/></a>';
	msgElement=msgElement+'<div class="message_wrap"> <span class="arrow"></span>';
	msgElement=msgElement+'<div class="info"> <a class="name">'+updatedBYName+'</a> <span class="time">'+cdate+'</span>';
	msgElement=msgElement+'<span class="time" id="'+time+'"><i class="icon-time"></i></span>';
	msgElement=msgElement+'<div class="options_arrow">';
	msgElement=msgElement+'</div></div>';
	msgElement=msgElement+'<div class="text">'+newComment; 
	msgElement=msgElement+'</div></div></li>';
	
	$.ajax({
	      url: 'comment.jsp?addnewComment=true&taskID='+activityID+'&newComment='+newComment+'&updatedBY='+updatedBY,
	      data: {},
	      error: function() {
	        // $('#info').html('<p>An error has occurred</p>'); 
	    	  $("#"+time).html("<font color='red'>error</font>");
	      },
	      beforeSend: function(xhr ) {
	    	  $("#message_body").prepend(msgElement);
	    	  $("#newComment").val("");
		      },
	      dataType: 'text',
	      success: function(data) {
	    	  if(data==1)
	    		  {
	    		  $("#"+time).html("<i class='icon-ok btn-success'></i>");
	    		  }
	    	  else
	    		  {
	    		  $("#"+time).html("<i class='icon-remove btn-danger'></i>");
	    		  }
	      },
	      type: 'GET'
	   });
}
function addReply()
{
	var commentID=$("#commentID").val();
	var updateID=$("#updateID").val();
	var updateName=$("#updateName").val();
	var newReply=$("#newReply").val();
	if(newReply=="" || newReply==null)
		{
		return null;
		}
	var dt = new Date();
	var cdate=dt.getFullYear()+"-"+dt.getMonth()+"-"+dt.getDate();
	var time = dt.getHours() + dt.getMinutes() + dt.getSeconds();
	var msgElement='<li class="by_myself right"> <a href="#" class="avatar"><img src="img/message_avatar1.png"/></a>';
	msgElement=msgElement+'<div class="message_wrap"> <span class="arrow"></span>';
	msgElement=msgElement+'<div class="info"> <a class="name">'+updateName+'</a> <span class="time">'+cdate+'</span>';
	msgElement=msgElement+'<span class="time" id="'+time+'"><i class="icon-time"></i></span>';
	msgElement=msgElement+'<div class="options_arrow">';
	msgElement=msgElement+'</div></div>';
	msgElement=msgElement+'<div class="text">'+newReply; 
	msgElement=msgElement+'</div></div></li>';
	$("#"+commentID).append(msgElement);
	$("#closeModal").click();
	$.ajax({
	      url: 'comment.jsp?addnewReply=true&commentID='+commentID+'&newReply='+newReply+'&updatedBY='+updateID,
	      data: {},
	      error: function() {
	        // $('#info').html('<p>An error has occurred</p>'); 
	    	  $("#"+time).html("<font color='red'>error</font>");
	      },
	      beforeSend: function(xhr ) {
	    	  $(commentID).append(msgElement);
	    	  $("#newReply").val("");
		      },
	      dataType: 'text',
	      success: function(data) {
	    	  if(data==1)
	    		  {
	    		  $("#"+time).html("<i class='icon-ok btn-success'></i>");
	    		  }
	    	  else
	    		  {
	    		  $("#"+time).html("<i class='icon-remove btn-danger'></i>");
	    		  }
	      },
	      type: 'GET'
	   });
}
function popupreply(commentID,updateID,updateName)
{
	$("#commentID").val(commentID);
	$("#updateID").val(updateID);
	$("#updateName").val(updateName);
	$("#ModalpopReply").click();
}
function addAssignment(empID,empName)
{
	var taskID=$("#taskID").html();
	var employeeID=$("#employeeID").html();
	var tbdy=$("#asignmentTable tbody").html();
	var textra="<tr>";
	textra=textra+"<td>"+empID+"</td>";
	textra=textra+"<td>"+empName+"</td>";
	textra=textra+"<td>In Progress</td>";
	textra=textra+"<td class='td-actions' id='td-actions"+empID+"'>";
	textra=textra+"<a href='javascript:;' class='btn btn-small btn-success' onclick=\"completeAssignment("+taskID+",'"+empID+"')\"><i class='btn-icon-only icon-ok'> </i></a>";
	textra=textra+"<a href='javascript:;' class='btn btn-danger btn-small' onclick=\"withdrawAssignment("+taskID+",'"+empID+"')\"><i class='btn-icon-only icon-remove'> </i></a>";
	textra=textra+"<img  style=\"height:30px;display:none\" id=\"approveLoading"+empID+"\" src=\"img/ajax-loader.gif\">";
    textra=textra+"</td></tr>";
	$.ajax({
	      url: 'manager.jsp?addAssignment=true&empID='+empID+'&taskId='+taskID+'&loginID='+employeeID,
	      data: {},
	      error: function() {
	        // $('#info').html('<p>An error has occurred</p>');
	    	  $("#managerLoading").css("display","none");
	    	  $("#modalEmployeeResult").html("<p><font color='red'>An error has occurred</font></p>");
	    	  
	      },
	      beforeSend: function(xhr ) {
		         $("#managerLoading").css("display","inline");
		      },
	      dataType: 'text',
	      success: function(data) {
	    	  $("#managerLoading").css("display","none");
	    	  if(data==1)
	    		  {
	    	  $("#asignmentTable tbody").html(tbdy+textra);
	    	  $("#frm_cancel").click();
	    		  }
	    	  else if(data==3)
	    		  {
	    		  alert("Employee already added to this activity");
	    		  }
	    	  else
	    		  {
	    		  alert(2);
	    		  alert("some error occured..contact Admin");
	    		  }
	      },
	      type: 'GET'
	   });
	
   
}
function completeAssignment(taskID,empID)
{
	$.ajax({
	      url: 'manager.jsp?completeAssignment=true&taskID='+taskID+'&empID='+empID,
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
	    	  $("#td-actions"+empID).html(data);
	      },
	      type: 'GET'
	   });
}
function withdrawAssignment(taskID,empID)
{
	$.ajax({
	      url: 'manager.jsp?withdrawAssignment=true&taskID='+taskID+'&empID='+empID,
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
	    	  $("#td-actions"+empID).html(data);
	      },
	      type: 'GET'
	   });
}
