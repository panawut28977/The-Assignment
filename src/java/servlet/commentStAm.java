/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.AccountCourse;
import Model.Assignment;
import Model.Comment;
import Model.Notification;
import Model.StAssignmentFile;
import Model.StAssignmentOnWeb;
import java.io.IOException;
import java.io.PrintWriter;
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
public class commentStAm extends HttpServlet {

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
        String text = request.getParameter("text");
        Assignment am = (Assignment) ss.getAttribute("curAm");
        Integer cId = (int) ((long) ss.getAttribute("cId"));
        Account ac = (Account) ss.getAttribute("ac");
        Comment c = new Comment();
        c.setAcc_id(ac);
        c.setText(text);
        int st_am_id = 0;

        List<Integer> listac = new ArrayList<>();
        if (am.getAss_type().equalsIgnoreCase("file")) {
            StAssignmentFile saf = (StAssignmentFile) ss.getAttribute("sa");
            st_am_id = saf.getSt_am_id();
            System.out.println(st_am_id);

            //หา member id ที่จะ notify
            if (am.getTotal_member() > 1) {
                if (ac.getAccount_type().equalsIgnoreCase("TH")) {
                    //ถ้าเป็นอาจารที่คอมเม้นงานไฟล์แบบกลุ่มนักเรียน notify ไปที่กลุ่มนักเรียน
                    List<Account> gAm = (List<Account>) (ss.getAttribute("gAm"));
                    for (Account account : gAm) {
                        listac.add(account.getAcc_id());
                    }
                } else {
                    //ถ้าเป็นนักเรียนที่คอมเม้นงานไฟล์แบบกลุ่มนักเรียน notify ไปที่กลุ่มนักเรียนของตัวเองและอาจารย์ ยกเว้นตัวเอง
                    List<Account> gAm = (List<Account>) (ss.getAttribute("gAm"));
                    for (Account account : gAm) {
                        if (account.getAcc_id() != ac.getAcc_id()) {
                            listac.add(account.getAcc_id());
                        }
                    }
                    List<Integer> taId = AccountCourse.getTeacherIdCourse(cId, ac.getAcc_id());
                    for (Integer integer : taId) {
                        listac.add(integer);
                    }
                    System.out.println("listac:" + listac);
                }
            } else {
                if (ac.getAccount_type().equalsIgnoreCase("TH")) {
                    //ถ้าเป็นอาจารย์ที่คอมเม้นงานไฟล์เดี่ยวนักเรียน notify ไปที่ตัวนักเรียน
                    listac.add(saf.getAcc_id());
                } else {
                    //ถ้าเป็นนักเรียนที่คอมเม้นงานไฟล์เดี่ยวให้ notify ไปที่อาจารย์
                    List<Integer> taId = AccountCourse.getTeacherIdCourse(cId, ac.getAcc_id());
                    for (Integer integer : taId) {
                        listac.add(integer);
                    }
                }
            }
        } else {
            // st ass on web
            StAssignmentOnWeb saw = (StAssignmentOnWeb) ss.getAttribute("sa");
            st_am_id = saw.getSt_am_id();
            System.out.println(st_am_id);

            //หา member id ที่จะ notify
            if (am.getTotal_member() > 1) {
//                List<Account> gAm = (List<Account>) (ss.getAttribute("gAm"));
//                for (Account account : gAm) {
//                    listac.add(account.getAcc_id());
//                }
//                
                if (ac.getAccount_type().equalsIgnoreCase("TH")) {
                    //ถ้าเป็นอาจารที่คอมเม้นงานเวบแบบกลุ่มนักเรียน notify ไปที่กลุ่มนักเรียน
                    List<Account> gAm = (List<Account>) (ss.getAttribute("gAm"));
                    for (Account account : gAm) {
                        listac.add(account.getAcc_id());
                    }
                } else {
                    //ถ้าเป็นนักเรียนที่คอมเม้นงานบนเวบแบบกลุ่มนักเรียน notify ไปที่กลุ่มนักเรียนของตัวเองและอาจารย์ ยกเว้นตัวเอง 
                    List<Account> gAm = (List<Account>) (ss.getAttribute("gAm"));
                    for (Account account : gAm) {
                        if (account.getAcc_id() != ac.getAcc_id()) {
                            listac.add(account.getAcc_id());
                        }
                    }
                    List<Integer> taId = AccountCourse.getTeacherIdCourse(cId, ac.getAcc_id());
                    for (Integer integer : taId) {
                        listac.add(integer);
                    }
                    System.out.println("listac:" + listac);
                }

            } else {
                if (ac.getAccount_type().equalsIgnoreCase("TH")) {
                    //ถ้าเป็นอาจารย์ที่คอมเม้นงานไฟล์เดี่ยวนักเรียน notify ไปที่ตัวนักเรียน
                    listac.add(saw.getAcc_id());
                } else {
                    //ถ้าเป็นนักเรียนที่คอมเม้นงานไฟล์เดี่ยวให้ notify ไปที่อาจารย์
                    List<Integer> taId = AccountCourse.getTeacherIdCourse(cId, ac.getAcc_id());
                    for (Integer integer : taId) {
                        listac.add(integer);
                    }
                }
            }
        }

        Notification n = new Notification();
        n.setAcc_id(ac.getAcc_id());
        n.setCourse_id(cId);
        n.setType("assignment");
//        String content = "<p><b>" + ac.getFirstname() + " " + ac.getLastname() + "</b>  tell you something in your <b>" + am.getName() + "</b> work.</p>\n";
        String content = "<span class=\"text-muted\"> <span class=\"glyphicon glyphicon-comment\"></span> commented in assignment of student. </span>";
        n.setText(content);
        n.setLink("routeCommentStAm?am_id=" + am.getAm_id() + "&&cId=" + cId + "&&st_am_id=" + st_am_id);
//        if (ac.getAccount_type().equalsIgnoreCase("TH")) {
//            n.setLink("sendAssignment?am_id=" + am.getAm_id() + "&&cId=" + cId);
//        } else {
//            n.setLink("checkAssignment?tab=AllAssignment&&st_am_id=" + st_am_id);
//        }
//        List<Integer> listac = AccountCourse.getStudentIdCourse(cId, ac.getAcc_id());
        Notification.announce(n, listac);
        System.out.println("update : " + Comment.addToStComment(c, st_am_id, am.getAss_type()));
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
