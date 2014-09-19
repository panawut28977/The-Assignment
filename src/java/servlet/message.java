/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.AccountCourse;
import Model.Message;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Orarmor
 */
public class message extends HttpServlet {

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
        Account a = (Account) ss.getAttribute("ac");
        Map<Long, AccountCourse> courseList = a.getCourseList();
        Iterator i = courseList.entrySet().iterator();
        Map<Message, Account> yourTeacher = new LinkedHashMap<>();
        Map<Message, Account> yourStudent = new LinkedHashMap<>();
        //teacherAddedId เกบไอดีของอาจารย์ที่แอดคาเข้า yourTeacher ไปแล้ว
        List<Integer> teacherAddedId = new ArrayList<>();
        List<Integer> studentAddedId = new ArrayList<>();

        while (i.hasNext()) {
            Map.Entry mapEntry = (Map.Entry) i.next();
            List<Account> tInCourse = AccountCourse.getTeacherCourse(Integer.parseInt(mapEntry.getKey() + ""),a.getAcc_id());
            for (Account account : tInCourse) {
                if (!teacherAddedId.contains(account.getAcc_id())) {
                    teacherAddedId.add(account.getAcc_id());
                    Message isAllSeen = new Message();
                    isAllSeen.setIsAllSeen(Message.isAllSeen(a.getAcc_id(), account.getAcc_id()));
                    yourTeacher.put(isAllSeen, account);
                }
            }

            if (a.getAccount_type().equalsIgnoreCase("TH")) {
                List<Account> sInCourse = AccountCourse.getStudentCourse(Integer.parseInt(mapEntry.getKey() + ""),a.getAcc_id());
                for (Account account : sInCourse) {
                    if (!studentAddedId.contains(account.getAcc_id())) {
                        studentAddedId.add(account.getAcc_id());
                        Message isAllSeen = new Message();
                        isAllSeen.setIsAllSeen(Message.isAllSeen(a.getAcc_id(), account.getAcc_id()));
                        yourStudent.put(isAllSeen, account);
                    }
                }
            }
        }

        System.out.println(yourStudent);
        System.out.println("===");
        System.out.println(yourTeacher);
        ss.setAttribute("yourStudent", yourStudent);
        ss.setAttribute("youTeacher", yourTeacher);

            request.setAttribute("msg", "nopvmsg");
        String url = "/message.jsp";
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
