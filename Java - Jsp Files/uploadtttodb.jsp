<%@ page import="java.io.*,java.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.opencsv.CSVReader" %>
<% String id = (String)session.getAttribute("id");
if(id == null)
{
    session.setAttribute("error","Session Expired Please Login Again !!!");
    response.sendRedirect("admin.jsp");
}
String date = request.getParameter("date");
%>
<html>
<%
String file = request.getParameter("file");
try{
    String csvPath = "D:\\"+file;
    File f = new File(csvPath);
    Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/buspass","root","");

    String sql = "INSERT INTO timetable VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement statement = connection.prepareStatement(sql);

    String data[];
    int cnt = 0;
    CSVReader reader = new CSVReader(new FileReader(csvPath)); 
    while((data = reader.readNext())!=null) {
        if(cnt != 0){
        out.println(data[0] + " " + data[10]);
        String day = data[0];
        String Period_1 = data[1];
        String Period_2 = data[2];
        String Period_3 = data[3];
        String Period_4 = data[4];
        String Period_5 = data[5];
        String Period_6 = data[6];
        String Period_7 = data[7];
        String Period_8 = data[8];
        String Period_9 = data[9];
        String lh = data[10];

        statement.setString(1, day);
        statement.setString(2, Period_1);
        statement.setString(3, Period_2);
        statement.setString(4, Period_3);
        statement.setString(5, Period_4);
        statement.setString(6, Period_5);
        statement.setString(7, Period_6);
        statement.setString(8, Period_7);
        statement.setString(9, Period_8);
        statement.setString(10, Period_9);
        statement.setString(11, lh);        
        statement.executeUpdate();
        }
        cnt++;
    }
    connection.close();
    response.sendRedirect("./timetable.jsp");
    
}catch(Exception e){
    if(e.getMessage().contains("(The system cannot find the file specified)")){
        out.print("Only choose files from D: Drive");
        %> <a href="javascript:history.back()">Try From D drive</a> <%
    }
    else{
        out.print(e);
    }
    
}
%>