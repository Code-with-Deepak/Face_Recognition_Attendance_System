<%@ page import="java.sql.*,java.util.Date,java.text.*" %>
<% String regno = (String)session.getAttribute("regno");
if(regno == null)
{
    session.setAttribute("error","Session Expired Please Login Again !!!");
    response.sendRedirect("index.jsp");
}
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
                font-size: 14px;
            }
            .atten-tbl td{
                border: 3px solid rgb(5, 179, 179);
                text-align: center;
                padding: 5px 10px;
                font-size: 12px;
            } 
        </style>
    </head>
    <body>
        <nav>
            <a href="userHome.jsp"><img src="./src/logo.png" ></a>
            <div class="nav-links" id="nav-links">
            
                <ul>
                    <li><a href="userHome.jsp">Home</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li><a href="timetablestudent.jsp">Time-Table</a></li>
                    <li><a href="logout.jsp">Logout</a></li>                 
                </ul>
            </div>
        </nav><hr><br>
        <div class="atten-tbl"><center>
            <table border="0">
                <tr>
                    <th colspan="12" style="background-color: rgb(204, 204, 204);">Attendance Report</th>
                </tr>
                <tr>
                    <th>S.no</th>
                    <th>Date</th>
                    <th>Day</th>
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
                    ResultSet rs = stmt.executeQuery("SELECT * FROM `attendance` WHERE `RegNo`='"+regno+"'");
                    int i = 1;
                    while(rs.next())
                    {
                        %>
                        <tr>
                            <td><% out.print(i); %></td>
                            <td><% out.print(rs.getString(2)); %></td>
                            <%
                            SimpleDateFormat formatter = new SimpleDateFormat("yyy-MM-dd");
                            Date date = formatter.parse(rs.getString(2));
                            Format f = new SimpleDateFormat("EEEE");      
                            String str = f.format(date); 
                            %>
                            <td><% out.print(str); %></td>
                            <% if(rs.getInt(3) == 1) { %> 
                            <td style="background-color: rgb(0,204,10);"><% out.print(rs.getInt(3)); %></td>
                            <% }
                            else{
                                %>
                                <td style="background-color: red;"><% out.print(rs.getInt(3)); %></td> <%
                            } %>

                            <% if(rs.getInt(4) == 1) { %> 
                            <td style="background-color: rgb(0,204,10);"><% out.print(rs.getInt(4)); %></td>
                            <% }
                            else{
                                %>
                                <td style="background-color: red;"><% out.print(rs.getInt(4)); %></td> <%
                            } %>
                            <% if(rs.getInt(5) == 1) { %> 
                            <td style="background-color: rgb(0,204,10);"><% out.print(rs.getInt(5)); %></td>
                            <% }
                            else{
                                %>
                                <td style="background-color: red;"><% out.print(rs.getInt(5)); %></td> <%
                            } %>
                            <% if(rs.getInt(6) == 1) { %> 
                            <td style="background-color: rgb(0,204,10);"><% out.print(rs.getInt(6)); %></td>
                            <% }
                            else{
                                %>
                                <td style="background-color: red;"><% out.print(rs.getInt(6)); %></td> <%
                            } %>
                            <% if(rs.getInt(7) == 1) { %> 
                            <td style="background-color: rgb(0,204,10);"><% out.print(rs.getInt(7)); %></td>
                            <% }
                            else{
                                %>
                                <td style="background-color: red;"><% out.print(rs.getInt(7)); %></td> <%
                            } %>
                            <% if(rs.getInt(8) == 1) { %> 
                            <td style="background-color: rgb(0,204,10);"><% out.print(rs.getInt(8)); %></td>
                            <% }
                            else{
                                %>
                                <td style="background-color: red;"><% out.print(rs.getInt(8)); %></td> <%
                            } %>
                            <% if(rs.getInt(9) == 1) { %> 
                            <td style="background-color: rgb(0,204,10);"><% out.print(rs.getInt(9)); %></td>
                            <% }
                            else{
                                %>
                                <td style="background-color: red;"><% out.print(rs.getInt(9)); %></td> <%
                            } %>
                            <% if(rs.getInt(10) == 1) { %> 
                            <td style="background-color: rgb(0,204,10);"><% out.print(rs.getInt(10)); %></td>
                            <% }
                            else{
                                %>
                                <td style="background-color: red;"><% out.print(rs.getInt(10)); %></td> <%
                            } %>
                            <% if(rs.getInt(11) == 1) { %> 
                            <td style="background-color: rgb(0,204,10);"><% out.print(rs.getInt(11)); %></td>
                            <% }
                            else{
                                %>
                                <td style="background-color: red;"><% out.print(rs.getInt(11)); %></td> <%
                            } %>
                        </tr>
                        <%      i++ ;                  
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


