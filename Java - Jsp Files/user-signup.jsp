<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
String fname = request.getParameter("fname");
String email = request.getParameter("email");
String pass = request.getParameter("password");
String dept = request.getParameter("dept");
String year = request.getParameter("year");
String regno = request.getParameter("regno");
String mob = request.getParameter("mob");
String address = request.getParameter("street");
String city = request.getParameter("city");
String pin = request.getParameter("pincode");
String bpoint = request.getParameter("bpoint");

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/buspass","root","");
    PreparedStatement ps = con.prepareStatement("INSERT INTO `students`(`Name`, `RegNo`, `Department`, `Year`, `Password`, `Email`, `Mobile`, `Address`, `City`, `Pincode`, `Boarding-point`) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
    ps.setString(1,fname);
    ps.setString(2,regno);
    ps.setString(3,dept);
    ps.setInt(4,Integer.parseInt(year));
    ps.setString(5,pass);
    ps.setString(6,email);
    ps.setString(7,mob);
    ps.setString(8,address);
    ps.setString(9,city);
    ps.setString(10,pin);
    ps.setString(11,bpoint);
    ps.executeUpdate();
    session.setAttribute("succ","RegNo : "+regno+" is Registered Successfully :)");
    response.sendRedirect("index.jsp");
}
catch(Exception e)
{
    String errmsg = e.getMessage();
    if(errmsg.contains("Duplicate entry"))
    {
        session.setAttribute("error","User Already Registered !!!");
        response.sendRedirect("index.jsp");
    } 
    else{
        out.print(e.getMessage());
    }
}
%>