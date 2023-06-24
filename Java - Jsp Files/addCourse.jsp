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
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/buspass","root","");
    PreparedStatement ps = con.prepareStatement("INSERT INTO coursetoteacher(teacher_id,CourseCode,CourseName) VALUES(?,?,?)");
    ps.setString(1,request.getParameter("tid"));
    ps.setString(2,request.getParameter("cc"));
    ps.setString(3,request.getParameter("cn"));
    ps.executeUpdate();
    response.sendRedirect("./teachertocourse.jsp");
}
catch(Exception e)
{
    out.print(e.getMessage());
} %>