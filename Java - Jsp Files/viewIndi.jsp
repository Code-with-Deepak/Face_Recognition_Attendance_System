<%@ page import="java.sql.*" %>
<% String id = (String)session.getAttribute("id");
if(id == null)
{
    session.setAttribute("error","Session Expired Please Login Again !!!");
    response.sendRedirect("admin.jsp");
}
String date = request.getParameter("date");
String regno = request.getParameter("regno");
%>
<html>
    <head>
        <title>Face Attendance Monitoring System - User Home</title>
        <link rel="stylesheet" href="./src/index-signup.css">
        <style>
            .atten-tbl th{
                border: 3px solid darkcyan;
                padding: 15px 20px;
                background-color: rgb(204, 204, 204);
                font-size: 14px;
            }
            .atten-tbl td{
                border: 3px solid rgb(5, 179, 179);
                text-align: center;
                padding: 5px 10px;
                font-size: 12px;
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
                    <li><a href="adminHome.jsp">Home</a></li>
                    <li><a href="students.jsp">Students</a></li>  
                    <li><a href="teachers.jsp">Teachers</a></li>  
                    <li><a href="logout.jsp">Logout</a></li>                 
                </ul>
            </div>
        </nav><hr><br>
        <div class="atten-tbl"><center>
            <table border="0" width="50%">
                <tr>
                    <th colspan="12" style="background-color: rgb(204, 204, 204);">Students Report for <%=regno%></th>
                </tr>
                <tr>
                    <th>S.no</th>
                    <th>Register No</th>
                    <th>Date</th>
                    <th>Period_1</th>
                    <th>Period_2</th>
                    <th>Period_3</th>
                    <th>Period_4</th>
                    <th>Period_5</th>
                    <th>Period_6</th>
                    <th>Period_7</th>
                    <th>Period_8</th>
                    <th>Period_9</th>
                </tr> <%
                 try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/buspass","root","");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM `attendance` WHERE `Date`='"+date+"'");
                    int i = 1;
                    while(rs.next())
                    {
                        %>
                        <tr>
                            <td><% out.print(i); %></td>
                            <td><% out.print(rs.getString(1)); %></td>
                            <td><% out.print(rs.getString(2)); %></td>
                            <% if(rs.getInt(3) == 1) { %> 
                                <td style="background-color: rgb(144, 194, 144);"><% out.print(rs.getInt(3)); %></td>
                            <% } %>
                            <% if(rs.getInt(4) == 1) { %> 
                                <td style="background-color: rgb(144, 194, 144);"><% out.print(rs.getInt(3)); %></td>
                            <% } %>
                            <% if(rs.getInt(5) == 1) { %> 
                                <td style="background-color: rgb(144, 194, 144);"><% out.print(rs.getInt(3)); %></td>
                            <% } %>
                            <% if(rs.getInt(6) == 1) { %> 
                                <td style="background-color: rgb(144, 194, 144);"><% out.print(rs.getInt(3)); %></td>
                            <% } %>
                            <% if(rs.getInt(7) == 1) { %> 
                                <td style="background-color: rgb(144, 194, 144);"><% out.print(rs.getInt(3)); %></td>
                            <% } %>
                            <% if(rs.getInt(8) == 1) { %> 
                                <td style="background-color: rgb(144, 194, 144);"><% out.print(rs.getInt(3)); %></td>
                            <% } %>
                            <% if(rs.getInt(9) == 1) { %> 
                                <td style="background-color: rgb(144, 194, 144);"><% out.print(rs.getInt(3)); %></td>
                            <% } %>
                            <% if(rs.getInt(10) == 1) { %> 
                                <td style="background-color: rgb(144, 194, 144);"><% out.print(rs.getInt(3)); %></td>
                            <% } %>
                            <% if(rs.getInt(11) == 1) { %> 
                                <td style="background-color: rgb(144, 194, 144);"><% out.print(rs.getInt(3)); %></td>
                            <% } %>
                        </tr>
                        <%      i++ ;                  
                    }
                }
                catch(Exception e)
                {
                    out.print(e.getMessage());
                } %>
            </table>        </center>
        </div>
    </body>
</html>


