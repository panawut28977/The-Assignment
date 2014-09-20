/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.AccountCourse;
import Model.Course;
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
public class linkjoin extends HttpServlet {

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
        String code = request.getParameter("course_code");
        HttpSession ss = request.getSession();
        Account ac = (Account) ss.getAttribute("ac");
        Course c = Course.getCourseByCode(code);
        String url = "";
        if (ac != null) {
            if (!code.equals("")) {
                AccountCourse member = new AccountCourse();
                member.setCourse(c);
                member.setRole("ST");
                member.setStatus("waiting");
                int result = AccountCourse.joinCourse(member, ac.getAcc_id());
                System.out.println("result :"+result);
                if (result > 0) {
                    request.setAttribute("msg", "1");
                } else {
                    request.setAttribute("msg", "2");
                }
                getServletContext().getRequestDispatcher("/informpage.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "You need to sign in before !");
            ss.setAttribute("continuelink", "linkjoin?course_code="+code);
            getServletContext().getRequestDispatcher("/META-INF/page/tmplogin.jsp").forward(request, response);
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