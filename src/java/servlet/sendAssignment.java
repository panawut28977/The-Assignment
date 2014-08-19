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
import java.io.IOException;
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
public class sendAssignment extends HttpServlet {

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
        int am_id = Integer.parseInt(ss.getAttribute("am_id") + "");
        String cId = ss.getAttribute("cId") + "";
        Assignment a = Assignment.getAmByAmID(am_id);
        String url = "";
        ss.setAttribute("curAm", a);
         Group_member g = null;
        if (Group_member.isInGroup(ac.getAcc_id(), am_id) < 1 && a.getTotal_member() != 1) {
            response.sendRedirect("selectPeople?am_id=" + am_id + "&&cId=" + cId);
        } else {
            if (a.getTotal_member() == 1) {
                System.out.println("individual work");
            } else {
                g = Group_member.getGroupByMember(ac.getAcc_id(), am_id);
                String accIdList[] = g.getAcc_id().split(",");
                List<Account> gAm = new ArrayList<>();
                for (String accId : accIdList) {
                    gAm.add(Account.getNameByID(Integer.parseInt(accId)));
                }
                ss.setAttribute("gAm", gAm);
                
            }
            
            if (a.getAss_type().equalsIgnoreCase("file")) {
                StAssignmentFile sa = StAssignmentFile.getStAmBbyAmIDAndGID(am_id,g.getG_id());
                ss.setAttribute("sa", sa);
                url = "/uploadAssignment.jsp?tab=AllAssignment";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            } else {
                url = "/onwebAssignment.jsp?tab=AllAssignment";
                getServletContext().getRequestDispatcher(url).forward(request, response);
            }
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
        HttpSession ss = request.getSession();
        ss.setAttribute("am_id", request.getParameter("am_id"));
        if (request.getParameter("cId") != null) {
            Long cId = Long.parseLong(request.getParameter("cId"));
            ss.setAttribute("cId", cId);
        }
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
