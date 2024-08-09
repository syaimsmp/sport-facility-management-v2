<%
    String status=(String)request.getAttribute("status");
    String error=(String)request.getAttribute("error");

%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Toastr -->
<link rel="stylesheet" href="/plugins/toastr/toastr.min.css">
   
<!-- Toastr -->
<script src="/plugins/toastr/toastr.min.js"></script>
<script defer>
        
        if('<%=status %>' != "null")
        {
        toastr.success('<%=status %>')
        }
        else if('<%=error %>' != "null"){
        toastr.error('<%=error %>');
        }

</script>