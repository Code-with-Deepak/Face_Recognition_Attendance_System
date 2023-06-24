<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
String fname = request.getParameter("fname");
String email = request.getParameter("email");
String pass = request.getParameter("password");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E - BusPass Attendance Monitoring System - SignUp</title>
    <link rel="stylesheet" href="./src/index-signup.css">
    <link rel="stylesheet" href="./src/signup2.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,600;0,700;1,200&display=swap" rel="stylesheet">

</head>
<body>
    <section class="home">
        <nav>
            <a href="index.jsp"><img src="./src/logo.png" ></a>
            <div class="nav-links" id="nav-links">
            
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="contact.html">Contact</a></li>
                    
                </ul>
            </div>
        </nav>
        <div class="signup-column">
            
               <div class="signup-h">
                <h2>Sign Up</h2>
               </div>

               <div class="signup-container">
                <div class="steps">
                    <p class="circle1">1</p>
                    <div class="hr-line"></div>
                    <p class="circle2">2</p>
                    <div class="hr-line"></div>
                    <p class="circle3">3</p>
                   </div>
               </div>
               <div class="signup-container1">
                <div class="steps1">
                <pre >Personal            College             Address</pre>
               </div>
                </div>
                <form action="signup3.jsp" method="POST">
                    <div class="signup-box">
                        <div class="signup-content">
                            <input type="hidden" name="fname" value="<%=fname%>">
                            <input type="hidden" name="email" value="<%=email%>">
                            <input type="hidden" name="pass" value="<%=pass%>">
                            <select name="dpt" id="dpt" required>
                                <option value="">Department</option>
                                <%
                                try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/buspass","root","");
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = stmt.executeQuery("SELECT * FROM `lhtodept`");
                                    while(rs.next())
                                    {
                                     %>
                                     <option value='<% out.print(rs.getString("Dept")); %>'><% out.print(rs.getString("Dept")); %></option>
                                     <%   
                                    }
                                }
                                catch(Exception e)
                                {
                                    out.print(e.getMessage());
                                }  
                                %>
                            </select>
                            <select name="year" id="year" required>
                                <option value="">Year</option>
                                <option value="1">1st</option>
                                <option value="2">2nd</option>
                                <option value="3">3rd</option>
                                <option value="4">4th</option>
                            </select>                            
                            <input type="text" name="rollno" id="rollno" placeholder="Register No" required>
                            <input type="phone" name="mbl" id="mbl" placeholder="Mobile Number" required>
                        </div>
                        <div class="signup-button">
                            <input type="submit" value="Next">
                        </div>
                    </div>
                </form>
        
         </div>
            
    
    </section>
    
    <script>
        function myfunction(){
            location.replace("signup3.html");
        }
        function prev(){
            location.replace("signup.html");
        }
    </script>
</body>
</html>