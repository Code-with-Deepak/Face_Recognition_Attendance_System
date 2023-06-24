<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
String regno = request.getParameter("regno");
String pass = request.getParameter("pass");

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/buspass","root","");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM `students` WHERE `RegNo`='"+regno+"'");
    if(rs.next())
    {
        if(pass.equals(rs.getString(5))){
            session.setAttribute("regno",regno);
            response.sendRedirect("userHome.jsp");
        }       
        else
        {
            session.setAttribute("error","Error : Incorrect RegisterNo or Password");
            response.sendRedirect("index.jsp?regno="+rs.getString(2)+"pass="+pass);
        }
        
    }
    else{
        session.setAttribute("error","User Not Exist Plz Register");
        response.sendRedirect("index.jsp");
    }
}
catch(Exception e)
{
    out.print(e.getMessage());
}
%>