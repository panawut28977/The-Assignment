/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.AccountCourse;
import Model.Assignment;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Orarmor
 */
public class routeCommentStAm extends HttpServlet {

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
        String url = "";
        String am_id = request.getParameter("am_id");
        String cId = request.getParameter("cId");
        String st_am_id = request.getParameter("st_am_id");
        HttpSession ss = request.getSession();
        Account ac = (Account) ss.getAttribute("ac");
        ss.setAttribute("cId", cId);
        if (ac.getAccount_type().equalsIgnoreCase("TH")) {
            String accCourse = AccountCourse.getAccountRole(ac.getAcc_id(), Integer.parseInt(cId));
            if (accCourse.equalsIgnoreCase("TH")) {
                Assignment a = Assignment.getAmByAmID(am_id);
                ss.setAttribute("curAm", a);
                response.sendRedirect("checkAssignment?tab=AllAssignment&&st_am_id=" + st_am_id + "&&cId=" + cId);
            } else {
                request.setAttribute("msg", 12);
                request.getRequestDispatcher("/informpage.jsp").forward(request, response);
            }

        } else {
            response.sendRedirect("sendAssignment?am_id=" + am_id + "&&cId=" + cId);
        }
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
