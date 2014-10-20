/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Course;
import Model.ImportedStudent;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DocumentFunction;
import util.MyFileRenamePolicy;

/**
 *
 * @author Orarmor
 */
public class ImportStudentList extends HttpServlet {

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
        Integer cId = Integer.parseInt(((Long) ss.getAttribute("cId")) + "");
        Course c = Course.getCourseByID(cId);
        File f = new File(getServletContext().getRealPath("/") + "/file/import_student_list");
        MyFileRenamePolicy mf = new MyFileRenamePolicy();
        MultipartRequest m = new MultipartRequest(request, f.getPath(), (5 * 1024 * 1024), "UTF-8", mf);
        String fileurl = getServletContext().getRealPath("/") + "/file/import_student_list/" + m.getFilesystemName("file");
        Map<Boolean, List<ImportedStudent>> exStudentList = DocumentFunction.readStudentXlsxFile(fileurl, cId);

//        System.out.println(exStudentList); 
//        System.out.println("false:" + exStudentList.get(false));
//        System.out.println("true:" + exStudentList.get(true));
        int rowadded = 0;
        if (exStudentList.get(true) != null) {
            ImportedStudent.deleteCourseStudentList(cId);
            List<ImportedStudent> strow = (List<ImportedStudent>) exStudentList.get(true);
            rowadded = ImportedStudent.setStudentList(strow);
            request.setAttribute("rowadded", rowadded);
        } else if (exStudentList.get(false) != null) {
            request.setAttribute("msg", "Cannot update students list.");
        }

        getServletContext().getRequestDispatcher("/course.jsp?tab=request").forward(request, response);

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
