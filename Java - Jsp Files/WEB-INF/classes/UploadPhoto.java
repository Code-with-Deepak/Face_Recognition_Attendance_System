import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.MultipartConfig;

public class UploadPhoto extends HttpServlet{
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException
    {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession(); 
        String regno = (String)session.getAttribute("regno");
        Part filePart = request.getPart("file");
        InputStream image = null;
        image = filePart.getInputStream(); 
        byte[] bytes = new byte[image.available()];
        image.read(bytes);

        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/buspass","root","");
            PreparedStatement ps = con.prepareStatement("UPDATE `students` SET `Photo`=? WHERE `RegNo`=?");          
            ps.setBytes(1,bytes);
            ps.setString(2,regno);
            ps.executeUpdate(); 
            session.setAttribute("succ","Image Uploaded SuccessFully");
            response.sendRedirect("/FaceRecog/profile.jsp");
        }
        catch(Exception e)
        {
            out.print("Error : "+e.getMessage());
        }      
    }
}