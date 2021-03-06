/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.AccountCourse;
import Model.AnswerQuestion;
import Model.Assignment;
import Model.Course;
import Model.Group_member;
import Model.Notification;
import Model.StAmFileList;
import Model.StAssignmentFile;
import Model.StAssignmentOnWeb;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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
public class uploadAssignmentOnWeb extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        List<AnswerQuestion> ansList = new ArrayList<>();
        HttpSession ss = request.getSession();
        int cId = Integer.parseInt(((Long) ss.getAttribute("cId")) + "");
        Course c = Course.getCourseByID(cId);
        Account ac = (Account) ss.getAttribute("ac");
        Assignment a = (Assignment) ss.getAttribute("curAm");
        Group_member g = null;
        if (a.getTotal_member() >= 1) {
            g = (Group_member) ss.getAttribute("g");
        }
        StAssignmentOnWeb reqsa = (StAssignmentOnWeb) ss.getAttribute("sa");

        //ไปดึง student assignment มาใหม่จะได้ชัวว่า lasted sent date มันไม่มี เพราะมีโอกาสที่จะส่งงานตอนที่ lasted ยังไม่มี พร้อมกัน
        StAssignmentOnWeb sa = StAssignmentOnWeb.getStAmInfo(reqsa.getSt_am_id());

        String[] seqno = request.getParameterValues("seqno");
        String q_type = null;
        String instruction = null;
        AnswerQuestion aq = null;
        for (int i = 0; i < seqno.length; i++) {
            q_type = request.getParameter(seqno[i] + "q_type");
            int q_id = Integer.parseInt(request.getParameter(seqno[i] + "q_id"));
            if (q_type.equalsIgnoreCase("multiple_choice") || q_type.equalsIgnoreCase("tfQuestion")) {
                aq = new AnswerQuestion();
                String ans[] = request.getParameterValues(seqno[i] + "answer");
                aq.setSt_am_id(sa.getSt_am_id());
                aq.setQ_id(q_id);
                aq.setQ_order(0);
                aq.setAcc_id(q_id);
                aq.setG_id(q_id);
                StringBuilder stans = new StringBuilder("[");
                for (String string : ans) {
                    stans.append(string + ",");
                }
                stans.deleteCharAt(stans.length() - 1);
                stans.append("]");
                aq.setAnswer(stans.toString());
                ansList.add(aq);
            } else if (q_type.equalsIgnoreCase("matchWord")) {
                String ans[] = request.getParameterValues(seqno[i] + "answer");
                for (int j = 0; j < ans.length; j++) {
                    aq = new AnswerQuestion();
                    aq.setSt_am_id(sa.getSt_am_id());
                    aq.setQ_id(q_id);
                    aq.setQ_order(j + 1);
                    aq.setAnswer(ans[j]);
                    ansList.add(aq);
                }
            } else if (q_type.equalsIgnoreCase("explain")) {
                String ans = request.getParameter(seqno[i] + "answer");
                aq = new AnswerQuestion();
                aq.setSt_am_id(sa.getSt_am_id());
                aq.setQ_id(q_id);
                aq.setQ_order(0);
                aq.setAnswer(ans);
                ansList.add(aq);
            } else if (q_type.equalsIgnoreCase("fillBlank")) {
                String ans[] = request.getParameterValues(seqno[i] + "answer");
                for (int x = 0; x < ans.length; x++) {
                    aq = new AnswerQuestion();
                    aq.setSt_am_id(sa.getSt_am_id());
                    aq.setQ_id(q_id);
                    aq.setQ_order(x + 1);
                    aq.setAnswer(ans[x]);
                    ansList.add(aq);
                    System.out.println(aq);
                }
            } else if (q_type.equalsIgnoreCase("instruction")) {
                System.out.println("Do nothing.");
            }
        }

        if (sa.getLasted_send_date() != null) {
            System.out.println("updated student answer");
            for (AnswerQuestion ans : ansList) {
                AnswerQuestion.updateAns(ans);
            }
        } else {
            if (a.getTotal_member() > 1) {
                System.out.println("send new assignment group");
                AnswerQuestion.setAnswerList(ansList, 0, g.getG_id());
            } else {
                System.out.println("send new assignment individual");
                AnswerQuestion.setAnswerList(ansList, ac.getAcc_id(), 0);
            }
        }

        //update lasted send date in stamfile
        Date d = new Date();
        sa.setLasted_send_date(d);
        StAssignmentOnWeb.updateLastedSend(sa);

        Notification n = new Notification();
        n.setAcc_id(ac.getAcc_id());
        n.setCourse_id(cId);
        n.setType("assignment");
//        String content = "<p><b>" + ac.getFirstname() + " " + ac.getLastname() + "</b>  has sent or updated <b>" + a.getName() + "</b> assignment ("+c.getName()+").</p>\n";
//        n.setText(content);
        String content = "<span class=\"text-muted\"> <span class=\"glyphicon glyphicon-send\"></span> sent or update his/her \"" + a.getName() + "\" assignment in </span>";
        n.setText(content);
        n.setLink("routeCheckStAm?st_am_id=" + sa.getSt_am_id() + "&&cId=" + cId + "&&am_id=" + a.getAm_id());
        List<Integer> listac = AccountCourse.getTeacherIdCourse(cId, ac.getAcc_id());
        Notification.announce(n, listac);

        request.setAttribute("msg", 4);
        getServletContext().getRequestDispatcher("/informpage.jsp?am_id=" + a.getAm_id()).forward(request, response);
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
