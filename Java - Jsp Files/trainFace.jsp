<% String regno = (String)session.getAttribute("regno");
%>
<form action="http://localhost:5000/trainer" method="POST">
<input type="hidden" name="regno" value="<%=regno%>">
<input type="submit" >
</form>