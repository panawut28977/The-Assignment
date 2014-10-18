/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.AccountCourse;
import Model.Course;
import Model.ImportedStudent;
import Model.Notification;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
                if (c.getStatus().equalsIgnoreCase("open")) {
                    AccountCourse member = new AccountCourse();
                    member.setCourse(c);
                    member.setRole("ST");
                    member.setStatus("waiting");
                    int result = AccountCourse.joinCourse(member, ac.getAcc_id());
                    System.out.println("result :" + result);
                    if (result > 0) {
                        request.setAttribute("msg", "1");
                        Notification n = new Notification();
                        n.setAcc_id(ac.getAcc_id());
                        n.setCourse_id(c.getCourse_id());
                        n.setType("alert");
                        //Assignment# 1 ( INT206 Software Development Process II ) <b9/10
//                        String content = "<b>\"" + ac.getFirstname() + " " + ac.getLastname() + "\"</b> request to join in <b>" + c.getName() + "</b>   ";
                        String content = "<span class=\"text-muted\"> request to join in </span>";
                        n.setText(content);

                        String nexturl = "course.jsp?tab=request";
                        String queryStringText = URLEncoder.encode(nexturl, "UTF-8");
                        String link = "setCourseSession?cId=" + c.getCourse_id() + "&&nexturl=" + queryStringText;
                        n.setLink(link);
                        List<Integer> listac = AccountCourse.getTeacherIdCourse(c.getCourse_id(), ac.getAcc_id());
                        Notification.announce(n, listac);

                        //checking auto 
                        if (ImportedStudent.isExistInStudentList(c.getCourse_id(), ac.getEmail())) {
                            getServletContext().getRequestDispatcher("/approvesl?acc_id=" + ac.getAcc_id() + "&&course_id=" + c.getCourse_id()).include(request, response);
                        }

                    } else {
                        request.setAttribute("msg", "2");
                    }
                } else {
                    request.setAttribute("msg", "11");
                }
                getServletContext().getRequestDispatcher("/informpage.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "You need to sign in before !");
            ss.setAttribute("continuelink", "linkjoin?course_code=" + code);
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
