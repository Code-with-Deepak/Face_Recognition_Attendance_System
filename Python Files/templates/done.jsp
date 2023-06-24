<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Face Recognition Based Attendance System </title>
    <style>
        .logs{
        background-color: black;
        color : white;
        padding: 30px;
        }
    </style>
</head>
    <h3>Server Logs</h3>
    <div class="logs">
        <p>
            Shutting down Camera......<br>
            GET /end HTTP/1.1" 200 - <br>
            GET /video HTTP/1.1" 200 - <br>
            * Debugger is active! <br>
            * Debugger PIN: 108-935-878<br>
            Camera Shutdown Detected ...... <br>
            Securing Database connectivity.......<br>
            You Are Safe ! 
        </p>
    </div>
<body>
</body>
</html>

<%
response.sendRedirect('http://localhost:8080/FaceRecog/userHome.jsp');
%>