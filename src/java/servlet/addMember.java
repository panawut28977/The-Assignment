/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.Assignment;
import Model.Group_member;
import Model.StAssignmentFile;
import Model.StAssignmentOnWeb;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Orarmor
 */
public class addMember extends HttpServlet {

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
        String am_id = "" + ss.getAttribute("am_id");
        String acc_id = request.getParameter("acc_id");
        Assignment a = Assignment.getAmByAmID(am_id);
        String url = "";
        if (Group_member.isInGroup(ac.getAcc_id(), a.getAm_id()) < 1) {
            Group_member g = new Group_member();
            g.setAcc_id(acc_id);
            g.setAm_id(Integer.parseInt(am_id));
            g.setG_no(Group_member.getlastedGNo(Integer.parseInt(am_id)) + 1);
            int g_id = Group_member.addMember(g);
            if (a.getAss_type().equalsIgnoreCase("file")) {
                StAssignmentFile stF = new StAssignmentFile();
                stF.setAcc_id(ac.getAcc_id());
                stF.setAm_id(Integer.parseInt(am_id));
                stF.setG_id(g_id);
                stF.setList_id(StAssignmentFile.getLastedListId() + 1);
                StAssignmentFile.setAm(stF);
            } else {
                StAssignmentOnWeb stw = new StAssignmentOnWeb();
                stw.setAcc_id(ac.getAcc_id());
                stw.setAm_id(Integer.parseInt(am_id));
                stw.setG_id(g_id);
                StAssignmentOnWeb.setAm(stw);
            }
        }
        url = "sendAssignment?am_id=" + am_id;
        response.sendRedirect(url);
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
