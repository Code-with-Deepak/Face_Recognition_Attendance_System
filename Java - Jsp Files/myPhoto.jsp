<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*"%>
<%
byte[] imgData = null ;
byte[] noData = null ;
String regno = request.getParameter("regno");
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buspass","root","");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT Photo FROM `students` WHERE `RegNo`='"+regno+"'");
    if(rs.next())
    {
        FileInputStream fin = new FileInputStream("C:/Tomcat/webapps/ROOT/FaceRecog/src/profile.png");    
    OutputStream o = response.getOutputStream();
    response.setContentType("image/jpg");
        Blob image = rs.getBlob("Photo");        
        imgData = image.getBytes(1,(int)image.length());
        noData = fin.readAllBytes();
        if(imgData.length != 0){
        o.write(imgData);
        }
        else{ 
            o.write(noData);
        }
        o.flush();
        o.close();
    }
    
}
catch(Exception e)
{
    out.print("Error : "+e.getMessage());
}

%>