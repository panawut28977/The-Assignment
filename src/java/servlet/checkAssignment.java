/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.Assignment;
import Model.Group_member;
import Model.StAmFileList;
import Model.StAssignmentFile;
import com.crocodoc.Crocodoc;
import com.crocodoc.CrocodocDocument;
import static com.crocodoc.CrocodocExamples.apiToken;
import com.crocodoc.CrocodocException;
import com.crocodoc.CrocodocSession;
import java.io.IOException;
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
public class checkAssignment extends HttpServlet {

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
        Account account = (Account) ss.getAttribute("ac");
        int st_am_id = Integer.parseInt(request.getParameter("st_am_id"));
        String cId = ss.getAttribute("cId") + "";
        String url = "/CheckAssignment.jsp?tab=AllAssignment";

        String apiToken = "mGye5pCBUTgkhI7Zl0QL3oPJ";
        Crocodoc.setApiToken(apiToken);
        Assignment a = (Assignment) ss.getAttribute("curAm");
        Group_member g = null;
        Account send_acc = null;
        if (a.getAss_type().equalsIgnoreCase("file")) {
            StAssignmentFile stF = StAssignmentFile.getStAm(st_am_id);
            List<StAmFileList> safv = StAmFileList.getSafvByListId(stF.getList_id());
            System.out.print("  Creating... ");
            String sessionKey = null;
            try {
                sessionKey = CrocodocSession.create(safv.get(0).getUuid());
                System.out.println("success :)");
                System.out.println("  The session key is " + sessionKey + ".");
            } catch (CrocodocException e) {
                System.out.println("failed :(");
                System.out.println("  Error Code: " + e.getCode());
                System.out.println("  Error Message: " + e.getMessage());
            }
            System.out.println(sessionKey);
            if (a.getTotal_member() > 1) {
//                g = Group_member.getGroupByMember(ac.getAcc_id(), am_id);
            }else{
                send_acc = Account.getAccountByID(stF.getAcc_id());
                request.setAttribute("send_acc", send_acc);
            }
            ss.setAttribute("sa", stF);
            ss.setAttribute("sessionKey", sessionKey);
        } else {

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
