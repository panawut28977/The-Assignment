/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.AccountCourse;
import Model.Assignment;
import Model.Group_member;
import Model.Notification;
import Model.StAssignmentFile;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
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
public class updateScoreStAmFile extends HttpServlet {

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
        double score = Double.parseDouble(request.getParameter("score"));
        HttpSession ss = request.getSession();
        StAssignmentFile stf = (StAssignmentFile) ss.getAttribute("sa");
        int result = StAssignmentFile.updateScore(score, stf.getSt_am_id());
        Account ac = (Account) ss.getAttribute("ac");
        int cId = Integer.parseInt(ss.getAttribute("cId") + "");
        Assignment a = (Assignment) ss.getAttribute("curAm");

        if (result > 0) {
            Notification n = new Notification();
            n.setAcc_id(ac.getAcc_id());
            n.setCourse_id(cId);
            n.setType("score");
            //Assignment# 1 ( INT206 Software Development Process II ) <b9/10
            String content = "<b>"+ a.getName() +"</b> assignment have new score update " + score + "/" + a.getFully_mark() ;
            n.setText(content);

            List<Integer> listac = new ArrayList<>();
            if (a.getTotal_member() > 1) {
                Group_member g = Group_member.getMemberById(stf.getG_id());
                String accIdList[] = g.getAcc_id().split(",");
                List<Account> gAm = new ArrayList<>();
                for (String accId : accIdList) {
                    listac.add(Integer.parseInt(accId));
                }
            } else {
                listac.add(stf.getAcc_id());
            }
            Notification.announce(n, listac);

            request.setAttribute("msg", 5);
            request.setAttribute("am_id", stf.getAm_id());
            getServletContext().getRequestDispatcher("/informpage.jsp").forward(request, response);
        } else {
            System.out.println("can not update assignment score.");
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
