package net.viralpatel.servlets;
 
import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class TestServlet extends HttpServlet {
     
 
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        //content type must be set to text/event-stream
        response.setContentType("text/event-stream");   
 
        //encoding must be set to UTF-8
        response.setCharacterEncoding("UTF-8");
 
        PrintWriter writer = response.getWriter();
 
        for(int i=0; i<10; i++) {
 
            writer.write("data: "+ System.currentTimeMillis() +"\n\n");
 
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        writer.close();
    }
}