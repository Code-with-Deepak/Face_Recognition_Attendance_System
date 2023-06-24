<%

session.removeAttribute("regno");
session.removeAttribute("id");
session.setAttribute("succ","Logged out Successfully");
response.sendRedirect("index.jsp");
%>