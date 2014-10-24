/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.TrippleDes;

/**
 *
 * @author Orarmor
 */
public class Register extends HttpServlet {

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
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String accType = request.getParameter("type");
        Account a = new Account();
        a.setAccount_type(accType);
        a.setEmail(email);
        a.setFirstname(firstname);
        a.setLastname(lastname);
//        String encodedBytes="";
//        try {
//            encodedBytes = Base64.getEncoder().encodeToString(password.getBytes("utf-8"));
//            System.out.println("encodedBytes " + encodedBytes);
//        } catch (UnsupportedEncodingException ex) {
//            Logger.getLogger(TestDriver.class.getName()).log(Level.SEVERE, null, ex);
//        }
        TrippleDes td;
        try {
            td = new TrippleDes();
            a.setPassword(td.encrypt(password));
        } catch (Exception ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
        a.setProfile_pic("img/avatar.jpg");
        int result = Account.register(a);
        String url = "";
        String msg = "";
        if (result > 0) {
            url = "/META-INF/page/registerStatus.jsp";
        } else {
            url = "/register.jsp?rg=" + accType;
            request.setAttribute("msg", "มีบางอย่างผิดพลาด กรุณาตรวจสอบข้อมูลอีกครั้ง");
        }
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
