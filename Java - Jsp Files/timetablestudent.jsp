<%@ page import="java.sql.*" %>
<% String id = (String)session.getAttribute("regno");
if(id == null)
{
    session.setAttribute("error","Session Expired Please Login Again !!!");
    response.sendRedirect("index.jsp");
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
                padding: 15px 20px;
                background-color: rgb(204, 204, 204);
                font-size: 20px;
            }
            .atten-tbl td{
                border: 3px solid rgb(5, 179, 179);
                text-align: center;
                padding: 5px 10px;
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
            .ancor{
                background-color: green;
                text-decoration: none;
                color: white;
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <nav>
            <a href="adminHome.jsp"><img src="./src/logo.png" ></a>
            <div class="nav-links" id="nav-links">
            
                <ul>
                    <li><a href="userHome.jsp">Home</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li><a href="timetablestudent.jsp">Time-Table</a></li>
                    <li><a href="logout.jsp">Logout</a></li>                 
                </ul>
            </div>
        </nav><hr><br>
        <div class="atten-tbl" width="50%"><center>
            <table border="0" style="margin-top: 20px;" class="table table-striped" width="10%">
                <tr>
                    <th colspan="10" style="background-color: rgb(204, 204, 204);">Time table of your Lecture Hall</th>
                </tr>
                <tr>
                    <th>Day</th>
                    <th>Period 1</th>
                    <th>Period 2</th>
                    <th>Period 3</th>
                    <th>Period 4</th>
                    <th>Period 5</th>
                    <th>Period 6</th>
                    <th>Period 7</th>
                    <th>Period 8</th>
                    <th>Period 9</th>
                </tr> <%
                 try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/buspass","root","");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * from timetable join lhtodept on timetable.LH = lhtodept.LH join students on lhtodept.dept = students.Department");
                    while(rs.next())
                    {
                        %>
                        <tr>
                            <td><% out.print(rs.getString(1)); %></td>
                            <td><% out.print(rs.getString(2)); %></td>
                            <td><% out.print(rs.getString(3)); %></td>
                            <td><% out.print(rs.getString(4)); %></td>
                            <td><% out.print(rs.getString(5)); %></td>
                            <td><% out.print(rs.getString(6)); %></td>
                            <td><% out.print(rs.getString(7)); %></td>
                            <td><% out.print(rs.getString(8)); %></td>
                            <td><% out.print(rs.getString(9)); %></td>
                            <td><% out.print(rs.getString(10)); %></td>
                        </tr>
                        <% 
                        rs.next();                 
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


