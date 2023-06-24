<%@ page import="java.sql.*" %>
<% String id = (String)session.getAttribute("id");
if(id == null)
{
    session.setAttribute("error","Session Expired Please Login Again !!!");
    response.sendRedirect("admin.jsp");
}
String date = request.getParameter("date");
%>
<%
    String Lh = request.getParameter("lh");
    if(Lh!=null){
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/buspass","root","");
    Statement stmt = con.createStatement();
    int rs = stmt.executeUpdate("DELETE FROM `timetable` where `LH`='"+Lh+"'");
    response.sendRedirect("./timetable.jsp");
}
catch(Exception e)
{
    out.print(e.getMessage());
} }
else{
    out.print("Wrong value passed");
}%>
<a href="javascript:history.back()">Go Back</a>