<%
    String status=(String)request.getAttribute("status");
    String error=(String)request.getAttribute("error");
    if(status != null)
    {
    	//out.print(message);
%>
    <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
        <strong><%=status %></strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
        </button>
   </div>
<%    		
    }
    else if(error != null)
    {
%>
    <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
        <strong><%=error %></strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
        </button>
   </div>
<%    		
    }
%>