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
import java.io.IOException;
import java.io.PrintWriter;
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
public class comment extends HttpServlet {

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
        Assignment am = (Assignment)ss.getAttribute("am");
        Integer cId = (int) ((long) ss.getAttribute("cId"));
        Account ac = (Account) ss.getAttribute("ac");
        Comment c = new Comment();
        c.setAcc_id(ac);
        c.setText(text);
        
        Notification n = new Notification();
        n.setAcc_id(ac.getAcc_id());
        n.setCourse_id(cId);
        n.setType("assignment");
        String content = "<span class=\"text-muted\"> <span class=\"glyphicon glyphicon-comment\"></span> commented in \"" + am.getName()+ "\" assignment.</span>";
//        String content = "<p><b>" + ac.getFirstname()+ " " + ac.getLastname()+ "</b>  comment in <b>" + am.getName()+ "</b> assignment.</p>\n";
        n.setText(content);
        n.setLink("assignment.jsp?ct=allAm&&tab=AllAssignment&&amId="+am.getAm_id()+"&&cId="+cId+"");

        List<Integer> listac = AccountCourse.getMemberIdCourse(cId, ac.getAcc_id());
        Notification.announce(n, listac);
        
        out.write(""+Comment.add(c,am.getAm_id()));
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
