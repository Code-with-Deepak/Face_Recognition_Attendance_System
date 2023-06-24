<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/buspass","root","");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM `admin`");
    while(rs.next())
    {
        if(id.equals(rs.getString(1)) && pass.equals(rs.getString(4))){
            session.setAttribute("id",id);
            response.sendRedirect("adminHome.jsp");
        }       
        else
        {
            session.setAttribute("error","Error : Incorrect RegisterNo or Password");
            response.sendRedirect("admin.jsp");
        }
        
    }
}
catch(Exception e)
{
    out.print(e.getMessage());
}
%>