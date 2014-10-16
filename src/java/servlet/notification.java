/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.Notification;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Orarmor
 */
public class notification extends HttpServlet {

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
        HttpSession ss = request.getSession();
        String nt = request.getParameter("nt");
        Account ac = (Account) ss.getAttribute("ac");
        List<Notification> noti = null;
        if (nt.equalsIgnoreCase("Announcement")) {
            noti = Notification.getAnnounce(ac.getAcc_id());
            Notification.seen(ac.getAcc_id(), "announce");
        } else if (nt.equalsIgnoreCase("Assignment")) {
            noti = Notification.getAssignment(ac.getAcc_id());
            Notification.seen(ac.getAcc_id(), "assignment");
        } else if (nt.equalsIgnoreCase("Alert")) {
            noti = Notification.getAlert(ac.getAcc_id());
            Notification.seen(ac.getAcc_id(), "alert");
        } else if (nt.equalsIgnoreCase("Score")) {
            noti = Notification.getScore(ac.getAcc_id());
            Notification.seen(ac.getAcc_id(), "score");
        }

        ss.setAttribute("nt", nt);
        ss.setAttribute("noti", noti);
        getServletContext().getRequestDispatcher("/notification.jsp").forward(request, response);

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
