/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import Model.Account;
import Model.EmailService;
import Model.ForgotSession;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Shinomiya
 */
public class ForgotPasswordMobile extends HttpServlet {

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
        String email = request.getParameter("email");
        Account ac = Account.getAccountByEmail(email);
        if (ac != null) {
            ForgotSession fp = new ForgotSession(ac.getAcc_id());
            fp.setForgotSession();
//            String resetlink = "http://assignment.sit.kmutt.ac.th" + getServletContext().getContextPath() + "/ViewResetPassword?ss=" + fp.getSession();
            String resetlink = "http://assignment.sit.kmutt.ac.th" + getServletContext().getContextPath() + "/ViewResetPassword?ss=" + fp.getSession();
            System.out.println(resetlink);
            //send link reset email;
            String resetEmail = ac.getEmail();
            String title = "The Assignment : Forgot your The Assignment password ?";
            String content = "The Assignment received a request to reset the password for your account. To reset your password, click on the link below or copy and paste the URL into your browser.\n"
                    + "\n"
                    + resetlink                                                                          
                    + "\n\n"
                    + "Please do not reply to this message; is was send from unmonitored email address.This message is a service email related to your use of The Assignment.\n"
                    + "\n"
                    + "Best regards,\n"
                    + "The Assignment Team.\n\n ";
            EmailService.getInstance().send(resetEmail, title, content);
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
