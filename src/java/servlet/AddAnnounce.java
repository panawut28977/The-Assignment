/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import Model.Account;
import Model.AccountCourse;
import Model.Announcement;
import Model.Notification;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author JenoVa
 */
public class AddAnnounce extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        HttpSession ss = request.getSession();
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Account ac = (Account)ss.getAttribute("ac");
        int cId = Integer.parseInt((Long)ss.getAttribute("cId") + "");
        Announcement a = new Announcement();
        a.setAn_acc(ac);
        a.setTitle(title);
        a.setContent(content);
        a.setCourse(Integer.parseInt(ss.getAttribute("cId")+""));
        int rs = Announcement.add(a);
        Notification n = new Notification();
        n.setAcc_id(ac.getAcc_id());
        n.setCourse_id(cId);
        n.setType("announce");
//        n.setText(title+"<br/>"+content);
        n.setText(content);
        
        //select people you want to notify
        List<Integer> listac = AccountCourse.getStudentIdCourse(cId, ac.getAcc_id());
        Notification.announce(n,listac);
        out.write(rs);
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
