/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.AccountCourse;
import Model.Course;
import Model.Notification;
import com.google.gson.Gson;
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
 * @author Shinomiya
 */
public class joinCourseMobile extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("accID"));
        Account a = Account.getAccountByID(id);
        String code = request.getParameter("code");
        Course c = Course.getCourseByCode(code);
        String url = "";
        if (!code.equals("")) {
            AccountCourse member = new AccountCourse();
            member.setCourse(c);
            member.setRole("ST");
            member.setStatus("waiting");
            int result = AccountCourse.joinCourse(member, a.getAcc_id());
            if (result > 0) {
                request.setAttribute("msg", "1");
                Notification n = new Notification();
                n.setAcc_id(a.getAcc_id());
                n.setCourse_id(c.getCourse_id());
                int cID = c.getCourse_id();
                Course course = Course.getCourseByID(cID);
                
                n.setType("alert");
                //Assignment# 1 ( INT206 Software Development Process II ) <b9/10
                String content = "<h4><b>\"" + a.getFirstname() + " " + a.getLastname() + "\"</b> request to join in <b>" + c.getName() + "</b></h4>";
                n.setText(content);

                List<Integer> listac = AccountCourse.getTeacherIdCourse(c.getCourse_id(), a.getAcc_id());
                Notification.announce(n, listac);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(new Gson().toJson("Join Course Successful !"));
            } else {
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(new Gson().toJson("Invalid Course Code"));
            }
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
