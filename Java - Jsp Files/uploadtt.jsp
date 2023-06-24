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
            input{
            border:2px solid #00854A;
            border-radius: 4px;
            margin-top: 20px;
            margin-left: 45px;
            background-color: transparent;
            font-weight: bold;
            color: #00854A;
            position: initial;
            cursor: pointer;
            padding: 10px;
        }
        input:hover{
            background-color: #00854A;
            color: white;
        }
        #eprofile{
            border: 2px solid #00854A;
            width: 30%;
            left: 50%;
            top: 50%;
            color: #00854A;
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
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
        <center>
        <div class="eprofile" id="eprofile">
            <h2>File Chooser</h2>
            <h6>Please choose file only from D: Drive</h6>
            <form action="./uploadtttodb.jsp" method="POST">
                <input type="file" name="file" accept=".csv">  
                <input type="submit" value="Upload">              
            </form>
            
        </div>
    </center>
    </body>
</html>


