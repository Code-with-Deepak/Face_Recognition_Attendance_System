<%@ page import="java.sql.*"%>
<%
String fname = request.getParameter("fname");
String email = request.getParameter("email");
String pass = request.getParameter("pass");
String dept = request.getParameter("dpt");
String year = request.getParameter("year");
String regno = request.getParameter("rollno");
String mob = request.getParameter("mbl");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E - BusPass Attendance Monitoring System - SignUp</title>
    <link rel="stylesheet" href="./src/index-signup.css">
    <link rel="stylesheet" href="./src/signup3.css">
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
                <form action="user-signup.jsp" method="POST">
                    <div class="signup-box">
                        <div class="signup-content">
                            <input type="hidden" name="fname" value="<%=fname%>">
                            <input type="hidden" name="email" value="<%=email%>">
                            <input type="hidden" name="password" value="<%=pass%>">
                            <input type="hidden" name="dept" value="<%=dept%>">
                            <input type="hidden" name="year" value="<%=year%>">
                            <input type="hidden" name="regno" value="<%=regno%>">
                            <input type="hidden" name="mob" value="<%=mob%>">
                            <input type="text" name="street" id="street" placeholder="Door No , Area" required>
                            <input type="text" name="city" id="city" placeholder="Town/City" required>
                            <input type="text" name="pincode" id="pincode" placeholder="Pincode" required>
                            <select name="bpoint" id="bpoint" required>
                                <option value="">Boarding Point - Fees</option>
                                <option value="N/A">N/A</option>
                            <%
                            try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/buspass","root","");
                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT * FROM `boarding`");
                                while(rs.next()){ %>
                                        <option value="<% out.print(rs.getString(2)); %>"><% out.print(rs.getString(2)+"-"+rs.getInt(3)); %></option>
                                <% }
                            }
                            catch(Exception e)
                            {
                                out.print(e.getMessage());
                            }
                            %>
                        </select>
                        </div>
                        <div class="signup-button">
                            <input type="submit" value="Sign Up">
                        </div>
                    </div>
                </form>
        
         </div>
            
    
    </section>
    
     
</body>
</html>