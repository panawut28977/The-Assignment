/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Assignment;
import Model.Course;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Orarmor
 */
public class createAssignment extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession ss = request.getSession();
        File f = new File(getServletContext().getRealPath("/") + "\\file\\assignment_file");
//        System.out.println("check dir " +f.exists());
        MultipartRequest m = new MultipartRequest(request, f.getPath(),"UTF-8");
        Integer cId = (int) ((long) ss.getAttribute("cId"));
        String name = m.getParameter("amName");
        String description = m.getParameter("description");
        String ass_type = m.getParameter("AmType");
        Date due_date = null;
        try {
            due_date = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).parse(m.getParameter("due_date"));
        } catch (ParseException ex) {
            Logger.getLogger(createAssignment.class.getName()).log(Level.SEVERE, null, ex);
        }
        int total_member = Integer.parseInt(m.getParameter("total_member"));
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
//        Date parsedDate;
//        Timestamp due_date = null;
//        try {
//            parsedDate = dateFormat.parse(m.getParameter("due_date"));
//            due_date = new Timestamp(parsedDate.getTime());
//
//        } catch (ParseException ex) {
//            Logger.getLogger(createAssignment.class.getName()).log(Level.SEVERE, null, ex);
//        }
        Assignment a = new Assignment();
        a.setName(name);
        a.setDescription(description);
        a.setTotal_member(total_member);
        a.setAss_type(ass_type);
        a.setCourse(new Course(cId));
        a.setDue_date(due_date);
        String url = "";
        if (ass_type.equalsIgnoreCase("file")) {
            a.setPath_file(m.getFilesystemName("file"));
            int key = Assignment.createAmInfo(a);
            url = "/assignment.jsp?tab=AllAssignment&&amId="+key;
        } else {
//            Map m = request.getParameterMap();
        }
       getServletContext().getRequestDispatcher(url).forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
