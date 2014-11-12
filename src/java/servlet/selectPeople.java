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
import Model.WorkAndGroup;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
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
public class selectPeople extends HttpServlet {

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
        //5 connections
        Assignment a = Assignment.getAmByAmID(request.getParameter("am_id"));
        Account ac = (Account) ss.getAttribute("ac");
        int cId = 0;
        if (request.getAttribute("cId") != null) {
            cId = Integer.parseInt(request.getAttribute("cId") + "");
        } else {
            cId = Integer.parseInt(ss.getAttribute("cId") + "");
        }

        if (Group_member.isInGroup(ac.getAcc_id(), a.getAm_id()) == 1) {
            request.setAttribute("msg", "joined");
        }

        //1 connections
        List<Group_member> gList = Group_member.getAllGroup(a.getAm_id());
        StringBuilder temp = new StringBuilder(" ");
        for (Group_member group_member : gList) {
            temp.append("," + group_member.getAcc_id());
        }
        temp.deleteCharAt(0);
        temp.deleteCharAt(0);
        String accList[] = temp.toString().split(",");
//1 connections
        Map<AccountCourse, Account> allMember = AccountCourse.getMemberInCourseWithRole(cId);
        Iterator loopa = allMember.entrySet().iterator();
        List<Account> noGMember = new ArrayList<>();
        while (loopa.hasNext()) {
            Map.Entry mapEntry = (Map.Entry) loopa.next();
            if (((AccountCourse) mapEntry.getKey()).getRole().equalsIgnoreCase("ST")) {
                Account m = (Account) mapEntry.getValue();
//                System.out.println(m);
                if (!Arrays.asList(accList).contains(m.getAcc_id() + "")) {
                    noGMember.add(m);
                }
            }
        }
        //1 connections
        Map<Integer, Account> allAccount = Account.getNameByListID(temp.toString());
        //>10 connections
        List<WorkAndGroup> wag = WorkAndGroup.memberToWorkGroup(gList, a, allAccount);
        request.setAttribute("noGMember", noGMember);
        request.setAttribute("am", a);
        request.setAttribute("gList", gList);
        request.setAttribute("wag", wag);
        ss.setAttribute("am_id", a.getAm_id());
        String url = ""; 
 
        url = "/groupWork.jsp?tab=AllAssignment";
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
        HttpSession ss = request.getSession();
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
