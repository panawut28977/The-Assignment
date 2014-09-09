/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.AccountCourse;
import Model.Assignment;
import Model.StAssignmentFile;
import Model.StAssignmentOnWeb;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static jdk.nashorn.internal.objects.NativeArray.map;

/**
 *
 * @author longd29
 */
public class userscore extends HttpServlet {

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
        Account ac = (Account) ss.getAttribute("ac");
        Long cId = (Long) ss.getAttribute("cId");
        int sent = 0, leftover = 0, miss = 0;
        String remaintTimeSt = "";
        double fully_mark = 0, mark = 0;
        AccountCourse yourCourse = (AccountCourse) (ac.getCourseList().get(cId));
        List<Assignment> courseAssignment = yourCourse.getCourse().getAssignment();
        Map<Integer, StAssignmentFile> stf = new HashMap<>();
        Map<Integer, StAssignmentOnWeb> stow = new HashMap<>();
        if (yourCourse.getRole().equalsIgnoreCase("ST")) {
            for (Assignment assignment : courseAssignment) {
                fully_mark += assignment.getFully_mark();
                remaintTimeSt = Assignment.remainingTimeforSend(assignment, ac.getAcc_id());
                if (remaintTimeSt.equalsIgnoreCase("sent")) {
                    sent++;
                } else if (remaintTimeSt.equalsIgnoreCase("miss")) {
                    miss++;
                } else {
                    leftover++;
                }

                if (assignment.getAss_type().equalsIgnoreCase("file")) {
                    StAssignmentFile nstf = null;
                    if (assignment.getTotal_member() == 1) {
                        nstf = StAssignmentFile.getStAmBbyAmIDAndAccId(assignment.getAm_id(), ac.getAcc_id());
                    } else {
                        nstf = StAssignmentFile.getStAmBbyAmIDAndAccId(assignment.getAm_id(), ac.getAcc_id(), true);
                    }
                    if (nstf != null) {
                        stf.put(assignment.getAm_id(), nstf);
                    }
                } else {
                    StAssignmentOnWeb nstow = null;
                    if (assignment.getTotal_member() == 1) {
                        nstow = StAssignmentOnWeb.getStAmByAmIDAndAccId(assignment.getAm_id(), ac.getAcc_id());
                    } else {
                        nstow = StAssignmentOnWeb.getStAmByAmIDAndAccId(assignment.getAm_id(), ac.getAcc_id(), true);
                    }
                    if (nstow != null) {
                        stow.put(assignment.getAm_id(), nstow);
                    }
                }
            }

        }

        int total_score = 0;
        Iterator loopf = stf.entrySet().iterator();
        Iterator loopw = stow.entrySet().iterator();
        while (loopf.hasNext()) {
            Map.Entry mapEntry = (Map.Entry) loopf.next();
            StAssignmentFile f = (StAssignmentFile) mapEntry.getValue();
            if (f.getLasted_send_date() != null) {
                total_score += f.getScore();
            }
        }

        while (loopw.hasNext()) {
            Map.Entry mapEntry = (Map.Entry) loopw.next();
            StAssignmentOnWeb w = (StAssignmentOnWeb) mapEntry.getValue();
            if (w.getLasted_send_date() != null) {
                total_score += w.getScore();
            }
        }
//        for (StAssignmentFile f : stf) {
//            if(f.getLasted_send_date() != null){
//                total_score += f.getScore();
//            }
//        }
//        for (StAssignmentOnWeb w : stow) {
//            if(w.getLasted_send_date() != null){
//                total_score += w.getScore();
//            }
//        }
        System.out.println(stf.size());
        System.out.println(stow.size());
        ss.setAttribute("stf", stf);
        ss.setAttribute("stow", stow);
        ss.setAttribute("total_score", total_score);
        ss.setAttribute("miss", miss);
        ss.setAttribute("total_sent_am", sent);
        ss.setAttribute("leftover_am", leftover);
        ss.setAttribute("fully_mark", fully_mark);
        response.sendRedirect("course.jsp?tab=score");
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
