/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.AnswerQuestion;
import Model.Group_member;
import Model.StAssignmentOnWeb;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
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
                aq.setAcc_id(aq.getAcc_id());
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
                        aq.setAcc_id(aq.getAcc_id());
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
                        aq.setAcc_id(aq.getAcc_id());
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
        for (AnswerQuestion a : ansList) {
            AnswerQuestion.updateScore(a);
        }

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
