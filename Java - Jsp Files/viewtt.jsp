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
                padding: 15px 20px;
                background-color: rgb(204, 204, 204);
                font-size: 14px;
            }
            .atten-tbl td{
                border: 3px solid rgb(5, 179, 179);
                text-align: center;
                padding: 5px 10px;
                font-size: 14px;
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
            <a href="adminHome.jsp"><img src="./src/logo.png" ></a>
            <div class="nav-links" id="nav-links">
            
                <ul>
                    <li><a href="adminHome.jsp">Home</a></li>
                    <li><a href="students.jsp">Students</a></li>
                    <li><a href="teachers.jsp">Teachers</a></li>
                    <li><a href="logout.jsp">Logout</a></li>                 
                </ul>
            </div>
        </nav><hr><br>
        <%
        int flag = 0;
        String Lh = request.getParameter("lh");
        %>
        <div class="atten-tbl" width="80%"><center>
            <table border="0" class="table table-striped" width="50%">
                <tr>
                    <th colspan="10" style="background-color: rgb(204, 204, 204);">Time table of Lecture Hall - <% out.print(Lh); %></th>
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
                    ResultSet rs = stmt.executeQuery("SELECT * FROM `timetable` where `LH`='"+Lh+"'");
                    while(rs.next())
                    {
                        flag = 1;
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
                    }
                    if(flag == 0){
                        %>
                        <tr><td colspan="10">No Records Found <a href="uploadtt.jsp">Upload TT here</a></td></tr>
                        <%
                    }
                }
                catch(Exception e)
                {
                    out.print(e.getMessage());
                } %>
            </table>
            <hr>
            <% if(flag==1) { %>
            <form style="margin :auto;" action="deletett.jsp" method="post">
                <input type="hidden" value="<% out.print(Lh); %>" name="lh">
                <input class="btn-new" type="submit" value="Delete">
            </form>
            <% } %>
        </center>
        </div>
    </body>
</html>


