<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E - BusPass Attendance Monitoring System - Home</title>
    <link rel="stylesheet" href="./src/index-signup.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,600;0,700;1,200&display=swap" rel="stylesheet">

</head>
<body>
    <section class="home">
        <nav>
            <a href="index.jsp"><img src="./src/logo.png" ></a>
            <div class="nav-links" id="nav-links">
            
                <i class="fa fa-times" onclick="hideMenu()"></i>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="contact.html">Contact</a></li>
                    
                </ul>
            </div>
            <i class="fa fa-bars"  onclick="showMenu()"></i>
            <li class="signup-btn"><a href="admin.jsp">Admin</a></li>
            <li class="signup-btn"><a href="teacherlogin.jsp">Teacher</a></li>
            <li class="signup-btn"><a href="signup.html" >Sign Up</a></li>
        </nav>
        <center><%
            String succ = (String)session.getAttribute("succ");
            if(succ != null ){ %>
                <p style="background-color: green; padding: 5px; color: white; font-weight: bold;">
            <% out.print(succ); %> </p> <%
            session.removeAttribute("succ");}
            %>
        </center>
        <center><%
            String err = (String)session.getAttribute("error");
            if(err != null){ %>
                <p style="background-color: rgb(226, 0, 0); padding: 5px; color: white; font-weight: bold;">
            <% out.print(err); %> </p> <%
            session.removeAttribute("error");}
            %>
        </center>
        <div class="row">
            <div class="column1">
                <div class="wallpaper">
                    <img src="./src/wall.png" alt="wallpaper">
                </div>
                <div class="wallpaper-content">
                    <p>Online FaceRecognition.Get started quickly and make your <br> way to get the Attendance.Together let's make this work.</p>

                </div>
                <div class="gts-btn">
                    <input type="submit" onclick="callSignUp()" value="Get started">
                </div>
            </div>
             <div class="column2">
                <div class="login-container">
                                        <h2>Login</h2>
                <form action="loginVali.jsp" method="POST">
                    <div class="login-content">
                        <input type="text" name="regno" id="regno" placeholder="Register No">
                        <input type="password" name="pass" id="passowrd" placeholder="Password">
                    </div>
                    <div class="login-btn">
                        <input type="submit" value="Log In">
                    </div>
                    <center><a href="fpass.jsp">Forgot Password ?</a></center>
                    
                </form>
                </div>
             </div>
    
            
            
        </div>
    </section>
    
     <!-----javascript to togle----->
     <script>
        var navLinks = document.getElementById("nav-links");
        function showMenu(){
            navLinks.style.right="0";
        }
        function hideMenu(){
            navLinks.style.right="-200px";
        }
        function callSignUp(){
            location.href = 'signup.html';
        }
    </script>
</body>
</html>