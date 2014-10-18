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
public class setCourseSession extends HttpServlet {

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
        Long cId = Long.parseLong(request.getParameter("cId"));
        HttpSession ss = request.getSession();
        Account a = (Account) ss.getAttribute("ac");
        int leftover = 0;
        if (a.getCourseList().get(cId) != null) {
            List<Assignment> amList = Assignment.getAmByCourseIDNoSetCourse(Integer.parseInt(cId + ""));
            String st = "";
            for (Assignment assignment : amList) {
//            System.out.println(assignment.getDue_date());
                st = Assignment.remainingTimeforSend(assignment, a.getAcc_id());
                if (st.equalsIgnoreCase("ontime") || st.equalsIgnoreCase("hurryup") || st.equalsIgnoreCase("late")) {
                    leftover++;
                } else {
                    System.out.print(st + "/");
                }
            }
        }
        ss.setAttribute("leftoverInCourse", leftover);
        ss.setAttribute("cId", cId);

        String nexturl = request.getParameter("nexturl");
        if (nexturl == null) {
            response.sendRedirect("CourseAnnounce");
        } else {
            response.sendRedirect(nexturl);
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
