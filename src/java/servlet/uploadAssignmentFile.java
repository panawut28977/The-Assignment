/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.StAmFileList;
import Model.StAssignmentFile;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.MyFileRenamePolicy;

/**
 *
 * @author Orarmor
 */
public class uploadAssignmentFile extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession ss = request.getSession();
        Account ac = (Account)ss.getAttribute("ac");
        StAssignmentFile saf = (StAssignmentFile)ss.getAttribute("sa");
        File f = new File(getServletContext().getRealPath("/") + "\\file\\student_assignment_file");
        MyFileRenamePolicy mf = new MyFileRenamePolicy();
        MultipartRequest m = new MultipartRequest(request, f.getPath(),(5 * 1024 * 1024),"UTF-8" , mf);
        
        //add data to stamfilelist
        StAmFileList safl = new StAmFileList();
        safl.setList_id(saf.getList_id());
        safl.setPath_file(m.getFilesystemName("file"));
        Date d = new Date();
        safl.setSend_date(d);
        safl.setSend_acc_id(ac.getAcc_id());
        StAmFileList.setAmFile(safl);
        
        
        //update lasted send date in stamfile
        saf.setLasted_send_date(d);
        StAssignmentFile.updateLastedSend(saf);
        ss.setAttribute("sa", saf);
        
        request.setAttribute("msg", 3);
        getServletContext().getRequestDispatcher("/informpage.jsp?am_id="+saf.getAm_id()).forward(request, response);
        
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
