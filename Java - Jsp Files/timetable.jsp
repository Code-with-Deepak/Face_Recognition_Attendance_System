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
                    <li><a href="adminHome.jsp">Home</a></li>
                    <li><a href="students.jsp">Students</a></li>
                    <li><a href="teachers.jsp">Teachers</a></li>
                    <li><a href="logout.jsp">Logout</a></li>                 
                </ul>
            </div>
        </nav><hr><br>
        <div class="atten-tbl" width="80%"><center>
            <a class="ancor" href="uploadtt.jsp">Upload Time-Table</a><br>
            <table border="0" style="margin-top: 20px;" class="table table-striped" width="50%">
                <tr>
                    <th colspan="2" style="background-color: rgb(204, 204, 204);">Department to LH info</th>
                </tr>
                <tr>
                    <th>Department</th>
                    <th>LH No</th>
                </tr> <%
                 try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/buspass","root","");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM `lhtodept`");
                    while(rs.next())
                    {
                        %>
                        <tr>
                            <td><% out.print(rs.getString(1)); %></td>
                            <td><a href="viewtt.jsp?lh=<%out.print(rs.getString(2));%>">View - <% out.print(rs.getString(2)); %></a></td>
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


