<%@ page import="java.sql.*" %>
<% String regno = (String)session.getAttribute("regno");
if(regno == null)
{
    session.setAttribute("error","Session Expired Please Login Again !!!");
    response.sendRedirect("index.jsp");
}
%>
<html>
    <head>
        <title>E - Bus Pass Monitoring System - Profile</title>
        <link rel="stylesheet" href="./src/index-signup.css">
        <style>  
        .myphoto{
            margin-left: 50px;
            background-color: rgb(235, 235, 235);
            padding: 20px;
            position: absolute;
            width: 90%;
            float: left;
        }
        .myphoto img{
            border-radius: 90px;
            width: 200px;
            height: 200px;
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
            display: none;
            border: 2px solid #00854A;
            position: absolute;
            width: 30%;
            left: 50%;
            top: 50%;
            color: #00854A;
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
        }
        .close{
            background-color: red;
            color: white ;
            border: none;
            padding: 5px;
            cursor: pointer;
            float: right;
        }
        h1{
            color: #00854A;
            padding: 10px;
            text-align: center;
        }
    table{
    padding: 50px;
    border: 2px solid darkcyan;
}
th{
    padding-right: 40px;
    float: left;
    padding: 5px;
}
tr{
    border: 2px solid darkcyan;
}
td{
    color: #00854A;
    font-weight: bold;
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
                    <li><a href="contact.html">Contact</a></li>
                    
                </ul>
            </div>
        </nav><hr><br>
        <center><%
            String succ = (String)session.getAttribute("succ");
            if(succ != null ){ %>
                <p style="background-color: #00854A; padding: 5px; color: white; font-weight: bold;">
            <% out.print(succ); %> </p> <%
            session.removeAttribute("succ");}
            %></center>
        <div class="myphoto">
            <h1>My Profile</h1>
            <br>
            <%
            String roll = (String)session.getAttribute("roll");
            String name = "";
            String email = "";
            String mob = "";
            String dept ="";
            int year =0;
            String addr ="";
            int pin = 0;
            String bpoint ="";
            String city ="";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/buspass","root","");
                Statement stmt = con.createStatement();
                String sqlquery = "SELECT * FROM `students` WHERE `RegNo`='"+regno+"'";
                ResultSet rs = stmt.executeQuery(sqlquery);
                while(rs.next())
                {
                    name = rs.getString(1);
                    dept = rs.getString(3);
                    year = rs.getInt(4);
                    email = rs.getString(6);
                    mob = rs.getString(7);
                    addr = rs.getString(8);
                    pin = rs.getInt(10);
                    bpoint = rs.getString(11);
                    city = rs.getString(9);

                }
                    %>
                <table align="center">
                    <tr>
                        <td>
                           <center><img src="myPhoto.jsp?regno=<%=regno%>"></center></td><td>
                            <form action="http://localhost:5000/trainer" method="POST">
                                <input type="hidden" name="regno" value="<%=regno%>">
                                <input type="submit" value="Train Face">
                                </form></td>
                    </tr>
                    <tr>
                        <th>Name</th>
                        <td><% out.print(name);%></td>
                    </tr>
                    <tr>
                        <th>Register No</th>
                        <td><% out.print(regno);%></td>
                    </tr>
                    <tr>
                        <th>Department</th>
                        <td><% out.print(dept);%></td>
                    </tr>
                    <tr>
                        <th>Year</th>
                        <td><% out.print(year);%></td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td><% out.print(email);%></td>
                    </tr>
                    <tr>
                        <th>Mobile</th>
                        <td><% out.print(mob);%></td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td><% out.print(addr);%></td>
                    </tr>
                    <tr>
                        <th>City</th>
                        <td><% out.print(city);%></td>
                    </tr>
                    <tr>
                        <th>Pincode</th>
                        <td><% out.print(pin);%></td>
                    </tr>
                    <tr>
                        <th>Boarding-Point</th>
                        <td><% out.print(bpoint);%></td>
                    </tr>
                </table><% 
            }
            catch(Exception e){
                out.print(e.getMessage());
            } %>  
            <input type="submit" value="Add/Edit Profile" onclick="eprofie()">
            <input type="submit" value="Edit Details" onclick="edetails()">       
        </div>
        <div class="eprofile" id="eprofile">
            <h2>File Chooser<button class="close" onclick="document.getElementById('eprofile').style.display = 'none'">&#10008;</button></h2>
            <form action="/UploadPhoto" enctype="multipart/form-data" method="POST">
                <input type="file" name="file">  
                <input type="submit" value="Upload">              
            </form>
            
        </div>
        <script>
            function eprofie(){
                document.getElementById("eprofile").style.display = "block";
            }
        </script>
    </body>
</html>


