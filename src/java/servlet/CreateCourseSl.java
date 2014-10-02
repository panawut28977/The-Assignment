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
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Orarmor
 */
public class CreateCourseSl extends HttpServlet {

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
        Account acc = (Account) ss.getAttribute("ac");
        String name = request.getParameter("name");
        String term = request.getParameter("term");
        String termYear = request.getParameter("term-year");
        Course c = new Course();
        c.setName(name);
        c.setTerm(Integer.parseInt(term));
        c.setYear(Integer.parseInt(termYear));
        c.setCourse_code(Course.generateCode());
        c.setCourse_link("dontknowlink/" + c.getCourse_code());
        int insert_id = Course.createCourse(c);
        Course course = new Course(insert_id);
        AccountCourse accCourse = new AccountCourse();
        accCourse.setCourse(course);
        accCourse.setRole("TH");
        accCourse.setStatus("approved");
        Date d = new Date();
        Timestamp t = new Timestamp(d.getTime());
        accCourse.setApproved_date(t);
        AccountCourse.joinCourse(accCourse, acc.getAcc_id());
        getServletContext().getRequestDispatcher("/setCourseSession?cId=" + insert_id).forward(request, response);
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
