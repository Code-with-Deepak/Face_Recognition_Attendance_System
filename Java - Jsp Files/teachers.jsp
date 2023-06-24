<%@ page import="java.sql.*" %>
<% String id = (String)session.getAttribute("id");
if(id == null)
{
    session.setAttribute("error","Session Expired Please Login Again !!!");
    response.sendRedirect("admin.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E - BusPass Attendance Monitoring System - SignUp</title>
    <link rel="stylesheet" href="./src/index-signup.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,600;0,700;1,200&display=swap" rel="stylesheet">

</head>
<body>
    <section class="home">
        <nav>
            <a href="index.jsp"><img src="./src/logo.png" ></a>
            <div class="nav-links" id="nav-links">
            
                <ul>
                    <li><a href="adminHome.jsp">Home</a></li>
                    <li><a href="manageTeacher.jsp">Manage Teachers</a></li>
                    
                </ul>
            </div>
        </nav>
        <center><%
            String succ = (String)session.getAttribute("succ");
            if(succ != null ){ %>
                <p style="background-color: green; padding: 5px; color: white; font-weight: bold;">
            <% out.print(succ); %> </p> <%
            session.removeAttribute("succ");}
            %>
        </center>
        <div class="signup-column">
            
               <div class="signup-h">
                <h2>Add Teachers</h2>
               </div>

               <div class="signup-container1">
                  <center>Fill up the details present Below</center>  
                </div>
               
                <div class="signup-box">
                    
                    <form action="mail.jsp" name="frm" onsubmit="return vali()" method="post">
                        <div class="signup-content">
                            <input type="text" name="fname" id="fname" placeholder="Name">
                            <input type="email" name="email" id="email" placeholder="Email" required>
                            <input type="text" name="regno" id="regno" placeholder="Teacher ID" required>
                            <input type="password" name="pass" value="123" required>
                            <select name="dpt" id="dpt" required>
                                <option value="">Department</option>
                                <option value="IT">IT</option>
                                <option value="ECE">ECE</option>
                                <option value="EEE">EEE</option>
                                <option value="CSE">CSE</option>
                                <option value="BT">BT</option>
                                <option value="FT">FT</option>
                            </select>
                        </div>
                        <div class="signup-button">
                            <input type="submit" value="Next">
                        </div>   
                    </form>
                   
                
                 </div>
        
         </div>
            
    
    </section>
    
     <script>
         function vali(){
             var cpass = document.forms["frm"]["confirm-password"].value;
             var pass = document.forms["frm"]["password"].value;
             if(pass == cpass)
             return true;
             else{
                 alert("Password And Confirm Password Does Not Match !");
                 return false;
             }
             
         }
     </script>
</body>
</html>