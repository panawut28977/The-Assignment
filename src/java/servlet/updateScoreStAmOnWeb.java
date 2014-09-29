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
import Model.Group_member;
import Model.Notification;
import Model.StAssignmentOnWeb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
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
public class updateScoreStAmOnWeb extends HttpServlet {

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
        List<AnswerQuestion> ansList = new ArrayList<>();
        StAssignmentOnWeb sa = (StAssignmentOnWeb) ss.getAttribute("sa");
        Account ac = (Account) ss.getAttribute("ac");
        int cId = Integer.parseInt(ss.getAttribute("cId") + "");
        Assignment a = (Assignment) ss.getAttribute("curAm");
        String[] seqno = request.getParameterValues("seqno");
        String q_type = null;
        String instruction = null;
        AnswerQuestion aq = null;
        int total_score = 0;
        for (int i = 0; i < seqno.length; i++) {
            q_type = request.getParameter(seqno[i] + "q_type");
            int q_id = Integer.parseInt(request.getParameter(seqno[i] + "q_id"));
            aq = new AnswerQuestion();
            if (sa.getG_id() > 0) {
                aq.setAcc_id(0);
                aq.setG_id(sa.getG_id());
            } else {
                aq.setAcc_id(sa.getAcc_id());
                aq.setG_id(0);
            }
            if (q_type.equalsIgnoreCase("multiple_choice") || q_type.equalsIgnoreCase("tfQuestion")) {
                String score = request.getParameter(seqno[i] + "score");
                aq.setSt_am_id(sa.getSt_am_id());
                aq.setQ_id(q_id);
                aq.setQ_order(0);
                aq.setScore(Double.parseDouble(score));
                total_score += Double.parseDouble(score);
                ansList.add(aq);
            } else if (q_type.equalsIgnoreCase("matchWord")) {
                String score[] = request.getParameterValues(seqno[i] + "score");
                for (int j = 0; j < score.length; j++) {
                    aq = new AnswerQuestion();
                    if (sa.getG_id() > 0) {
                        aq.setAcc_id(0);
                        aq.setG_id(sa.getG_id());
                    } else {
                        aq.setAcc_id(sa.getAcc_id());
                        aq.setG_id(0);
                    }
                    aq.setSt_am_id(sa.getSt_am_id());
                    aq.setQ_id(q_id);
                    aq.setQ_order(j + 1);
                    aq.setScore(Double.parseDouble(score[j]));
                    total_score += Double.parseDouble(score[j]);
                    ansList.add(aq);
                }
            } else if (q_type.equalsIgnoreCase("explain")) {
                String score = request.getParameter(seqno[i] + "score");
                aq.setSt_am_id(sa.getSt_am_id());
                aq.setQ_id(q_id);
                aq.setQ_order(0);
                aq.setScore(Double.parseDouble(score));
                total_score += Double.parseDouble(score);
                ansList.add(aq);
            } else if (q_type.equalsIgnoreCase("fillBlank")) {
                String score[] = request.getParameterValues(seqno[i] + "score");
                for (int x = 0; x < score.length; x++) {
                    aq = new AnswerQuestion();
                    if (sa.getG_id() > 0) {
                        aq.setAcc_id(0);
                        aq.setG_id(sa.getG_id());
                    } else {
                        aq.setAcc_id(sa.getAcc_id());
                        aq.setG_id(0);
                    }
                    aq.setSt_am_id(sa.getSt_am_id());
                    aq.setQ_id(q_id);
                    aq.setQ_order(x + 1);
                    aq.setScore(Double.parseDouble(score[x]));
                    total_score += Double.parseDouble(score[x]);
                    ansList.add(aq);
                }
            } else if (q_type.equalsIgnoreCase("instruction")) {
                System.out.println("Do nothing.");
            }
        }
        sa.setScore(total_score);
        StAssignmentOnWeb.updateScore(sa);
        for (AnswerQuestion ans : ansList) {
            AnswerQuestion.updateScore(ans);
        }

        Notification n = new Notification();
        n.setAcc_id(ac.getAcc_id());
        n.setCourse_id(cId);
        n.setType("score");
        //Assignment# 1 ( INT206 Software Development Process II ) <b9/10
        Date d = new Date();
        Timestamp now = new Timestamp(d.getTime());
        String content = "<h4>" + a.getName() + "  <small class='text-muted'>" + a.getCourse().getName() + "</small><small class='pull-right'>" + util.Util.formatTime(now + "") + "</small><br/><br/>You have new score update " + total_score + "/" + a.getFully_mark() + "</h4>";
        n.setText(content);

        List<Integer> listac = new ArrayList<>();
        if (a.getTotal_member() > 1) {
            Group_member g = Group_member.getMemberById(sa.getG_id());
            String accIdList[] = g.getAcc_id().split(",");
            List<Account> gAm = new ArrayList<>();
            for (String accId : accIdList) {
                listac.add(Integer.parseInt(accId));
            }
        } else {
            listac.add(sa.getAcc_id());
        }
        Notification.announce(n, listac);

        request.setAttribute("msg", 6);
        getServletContext().getRequestDispatcher("/informpage.jsp?am_id=" + sa.getAm_id()).forward(request, response);
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
