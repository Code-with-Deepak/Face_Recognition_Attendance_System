<%@ page import="java.sql.*" %>
<% String id = (String)session.getAttribute("id");
if(id == null)
{
    session.setAttribute("error","Session Expired Please Login Again !!!");
    response.sendRedirect("admin.jsp");
}
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
            .take{
                margin-top: 10%;
            }
            input[type=submit]{
                background-color: green;
                color: white;
                border: none;
                padding: 13px;
                cursor: pointer;
            }
            input[type=date]{
                border: 1px solid green;
                color: green;
                padding: 10px;

            }
        </style>
    </head>
    <body>
        <nav>
            <a href="userHome.jsp"><img src="./src/logo.png" ></a>
            <div class="nav-links" id="nav-links">
            
                <ul>
                    <li><a href="adminHome.jsp">Home</a></li>
                    <li><a href="students.jsp">View Students</a></li>
                    <li><a href="teachers.jsp">View Teachers</a></li>
                    <li><a href="timetable.jsp">View TimeTable</a></li>                    
                    <li><a href="teachertocourse.jsp">Courses</a></li>
                    <li><a href="logout.jsp">Logout</a></li>                 
                </ul>
            </div>
        </nav><hr><br>
        <%
        String mail = (String)session.getAttribute("mailit");
        if(mail!=null){
            %> <div class="mailsent">
                <a href="mailto:<%=mail%>">Click to Send Mail</a>
            </div><%
            session.removeAttribute("mailit");
        }
        %>
        <center>
                <form action="view.jsp" >
                   <input type="date" name="date" required>
                    <input type="submit" value="View Student Attendance">
                </form>
                <form action="http://localhost:5000" class="take">
                    <input type="submit" value="Take Attendance">
                </form>
        </center>
        </div>
    </body>
</html>


