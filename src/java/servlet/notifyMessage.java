/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.Message;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
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
public class notifyMessage extends HttpServlet {

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
        response.setContentType("text/event-stream");
        response.setCharacterEncoding("UTF-8");
        PrintWriter writer = response.getWriter();
        HttpSession ss = request.getSession();
        Account ac = (Account) ss.getAttribute("ac");
        //current notification
        List<Integer> curUnseenList = (List<Integer>) ss.getAttribute("notificationMsg");
        //get new notificastion
        List<Integer> unseenList = Message.getUnseenMsgId(ac.getAcc_id());
        if (curUnseenList == null) {
            System.out.println("if");
            int total = unseenList.size();

            writer.write("event:totalUnseen\n");
            writer.write("data:" + total + "\n\n");

            //set session
            ss.setAttribute("totalUnseen", total);
            ss.setAttribute("notificationMsg", unseenList);
        } else {
            System.out.println("else");
            int totalNewMsg = 0;
            boolean newNoti = false;
            //check current and new notification
            if (unseenList != null) {
                for (Integer integer : unseenList) {
                    if (!curUnseenList.contains(integer)) {
                        totalNewMsg++;
                        newNoti = true;
                    }
                }
            }
            System.out.println("newNoti: " + newNoti);
            if (newNoti || (unseenList.size() < curUnseenList.size())) {
                int total = unseenList.size();
                writer.write("event:totalUnseen\n");
                writer.write("data:" + total + "\n\n");

                if (totalNewMsg > 0) {
                    writer.write("event:totalNewMsg\n");
                    writer.write("data:" + totalNewMsg + "\n\n");
                }

                ss.setAttribute("totalUnseen", total);
                ss.setAttribute("totalNewMsg", totalNewMsg);
                ss.setAttribute("notificationMsg", unseenList);
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
