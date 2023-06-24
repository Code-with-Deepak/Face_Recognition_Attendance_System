<%@ page import="java.sql.*" %>
<% String id = (String)session.getAttribute("id");
if(id == null)
{
    session.setAttribute("error","Session Expired Please Login Again !!!");
    response.sendRedirect("admin.jsp");
}
String date = request.getParameter("date");
%>
<html>
    <head>
        <title>E - Bus Pass Monitoring System - User Home</title>
        <link rel="stylesheet" href="./src/index-signup.css">
        
        <style>
            .atten-tbl th{
                border: 3px solid darkcyan;
                padding: 15px 50px;
                background-color: rgb(204, 204, 204);
                font-size: 20px;
            }
            .atten-tbl td{
                border: 3px solid rgb(5, 179, 179);
                text-align: center;
                padding: 5px 20px;
                font-size: 18px;
            } 
            .mailsent{
                background-color: green;
                color: white;
                text-align: center;
                padding: 5px;
            }
            .mailsent a{
                text-decoration: none;
                padding: 5px;
                color: white;
                background-color: black;
            }
            .btn-new{
                
                padding: 10px;
                margin-top: 15%;
                width: 40%;
            }
            .btn-new a{
                background-color: green;
                text-decoration: none;
                padding: 20px;
                color: white;
            }
            .btn-new a:hover{
                background-color: black;
            }
        </style>
    </head>
    <body>
        <nav>
            <a href="userHome.jsp"><img src="./src/logo.png" ></a>
            <div class="nav-links" id="nav-links">
            
                <ul>
                    <li><a href="teacherHome.jsp">Home</a></li>
                    <li><a href="logout.jsp">Logout</a></li>                 
                </ul>
            </div>
        </nav><hr><br>
        <div class="atten-tbl" width="90%"><center>
            <table border="0" class="table table-striped" width="100%">
                <tr>
                    <th colspan="8" style="background-color: rgb(204, 204, 204);">Students Detail</th>
                </tr>
                <tr>
                    <th>Name</th>
                    <th>Register No</th>
                    <th>Department</th>
                    <th>Year</th>
                    <th>Mobile</th>
                    <th>Photo</th>
                    <th>Attendance</th>
                </tr> <%
                String dept = (String)session.getAttribute("dept");
                out.print("dept="+dept);
                 try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/buspass","root","");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM `students` WHERE `Department` LIKE '%"+dept+"%'");
                    while(rs.next())
                    {
                        %>
                        <tr>
                            <td><% out.print(rs.getString(1)); %></td>
                            <td><% out.print(rs.getString(2)); %></td>
                            <td><% out.print(rs.getString(3)); %></td>
                            <td><% out.print(rs.getInt(4)); %></td>
                            <td><% out.print(rs.getString(7)); %></td>
                            <td><img src="http://localhost:8080/FaceRecog/myPhoto.jsp?regno=<% out.print(rs.getString(2)); %>" width="50px" height="50px"></td>
                            <td><a class="btn-new" href="./viewIndi.jsp?regno=<% out.print(rs.getString(2)); %>">View</a></td>
                        </tr>
                        <%                  
                    }
                }
                catch(Exception e)
                {
                    out.print(e.getMessage());
                } %>
            </table>
        </center>
        </div>
    </body>
</html>


