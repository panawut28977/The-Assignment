/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import Model.Account;
import Model.AccountCourse;
import Model.Assignment;
import Model.Course;
import Model.Notification;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
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
public class approvesl extends HttpServlet {

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
        Account ac = (Account) ss.getAttribute("ac");
        PrintWriter out = response.getWriter();
        int acc_id = Integer.parseInt(request.getParameter("acc_id"));
        int course_id = Integer.parseInt(request.getParameter("course_id"));
        int result = AccountCourse.approve(acc_id, course_id) == true ? 1 : 0;
        System.out.println("result:" + result);
        if (result > 0) {
            Notification n = new Notification();
            n.setAcc_id(ac.getAcc_id());
            n.setCourse_id(course_id);
            n.setType("alert");
            //Assignment# 1 ( INT206 Software Development Process II ) <b9/10
//            String content = "Your request to join <b>\""+Course.getCourseNameByID(course_id)+"\"</b> is approved";
            String content = "<span class=\"text-muted\"> <span class=\"glyphicon glyphicon-ok-sign\"></span> your request to join is approved </span>";
            n.setText(content);
            n.setLink("setCourseSession?cId="+course_id);
            List<Integer> listac = new ArrayList<>();
            listac.add(acc_id);
            Notification.announce(n, listac);
        }
        out.write(result + "");
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
