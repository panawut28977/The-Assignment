/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.StAssignmentFile;
import com.crocodoc.Crocodoc;
import com.crocodoc.CrocodocException;
import com.crocodoc.CrocodocSession;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Orarmor
 */
public class anotherAmFile extends HttpServlet {

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
        HttpSession ss = request.getSession(false);
        String uuid = request.getParameter("uuid");
        String safv_id = request.getParameter("safv_id");
        String apiToken = "mGye5pCBUTgkhI7Zl0QL3oPJ";
        Crocodoc.setApiToken(apiToken);
        System.out.print("Creating... ");
        String sessionKey = null;
        try {
            sessionKey = CrocodocSession.create(uuid);
            System.out.println("success :)");
            System.out.println("  The session key is " + sessionKey + ".");
        } catch (CrocodocException e) {
            System.out.println("failed :(");
            System.out.println("  Error Code: " + e.getCode());
            System.out.println("  Error Message: " + e.getMessage());
        }
        System.out.println(sessionKey);
        ss.setAttribute("sessionKey", sessionKey);
        request.setAttribute("safv_id", safv_id);

        //update session
        StAssignmentFile stF = (StAssignmentFile) ss.getAttribute("sa");
        stF = StAssignmentFile.getStAm(stF.getSt_am_id());
        ss.setAttribute("sa", stF);
        getServletContext().getRequestDispatcher("/CheckAssignment.jsp?tab=AllAssignment").forward(request, response);
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
