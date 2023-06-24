<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%

String email = request.getParameter("email");
String id = request.getParameter("regno");
String pass = request.getParameter("pass");
String name = request.getParameter("fname");
String dept = request.getParameter("dpt");
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/buspass","root","");
    PreparedStatement ps = con.prepareStatement("INSERT INTO `teachers`(Id,Name,Email,Password,Dept) VALUES(?,?,?,?,?)");
    ps.setString(1,id);
    ps.setString(2,name);
    ps.setString(3,email);
    ps.setString(4,pass);
    ps.setString(5,dept);
    ps.executeUpdate();
    session.setAttribute("succ","Teacher Added Successfully to Database");
    response.sendRedirect("teachers.jsp");
}
catch(Exception e)
{
    out.print(e.getMessage());
}
%>