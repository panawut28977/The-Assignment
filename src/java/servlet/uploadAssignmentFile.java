/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.AccountCourse;
import Model.Assignment;
import Model.Course;
import Model.Notification;
import Model.StAmFileList;
import Model.StAssignmentFile;
import Model.TestDriver;
import com.crocodoc.Crocodoc;
import static com.crocodoc.Crocodoc.apiToken;
import com.crocodoc.CrocodocDocument;
import com.crocodoc.CrocodocException;
import com.crocodoc.CrocodocSession;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.lucene.analysis.th.ThaiAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import util.DocumentFunction;
import util.MyFileRenamePolicy;
import util.lucenceFunction;

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
        Integer cId = Integer.parseInt(((Long) ss.getAttribute("cId")) + "");
        Course c = Course.getCourseByID(cId);
        Account ac = (Account) ss.getAttribute("ac");
        Assignment a = (Assignment) ss.getAttribute("curAm");
        StAssignmentFile saf = (StAssignmentFile) ss.getAttribute("sa");
        File f = new File(getServletContext().getRealPath("/") + "\\file\\student_assignment_file");
        MyFileRenamePolicy mf = new MyFileRenamePolicy();
        MultipartRequest m = new MultipartRequest(request, f.getPath(), (5 * 1024 * 1024), "UTF-8", mf);

        //add data to stamfilelist
        StAmFileList safl = new StAmFileList();
        safl.setList_id(saf.getList_id());
        safl.setPath_file(m.getFilesystemName("file"));
        safl.setSend_acc_id(ac.getAcc_id());
//        String[] allowedExt = {"xls", "xlsx","doc","docx","jpe","jpeg","ppt","pptx","png","pdf","zip","rar"};
        String[] allowedExt = {"xls", "xlsx", "doc", "docx", "pdf"};
        String ext = m.getParameter("extFile");
        int safv_id = 0;
        if (Arrays.asList(allowedExt).contains(ext)) {
            String apiToken = "mGye5pCBUTgkhI7Zl0QL3oPJ";
            Crocodoc.setApiToken(apiToken);
            String fileurl = getServletContext().getRealPath("/") + "\\file\\student_assignment_file\\" + m.getFilesystemName("file");
            System.out.print("  Uploading... ");
            String uuid = null;
            File file = new File(fileurl);
            try {
                uuid = CrocodocDocument.upload(file);
                System.out.println("success :)");
                System.out.println("  UUID is " + uuid);
                safl.setUuid(uuid);
                safv_id = StAmFileList.setAmFile(safl);
            } catch (CrocodocException e) {
                System.out.println("failed :(");
                System.out.println("  Error Code: " + e.getCode());
                System.out.println("  Error Message: " + e.getMessage());
            }

            try {
                Map<String, Object> status = CrocodocDocument.status(uuid);

                if (!status.containsKey("error")) {
                    System.out.println("success :)");
                    System.out.println("  File status is " + status.get("status"));
                    Boolean isViewable = (Boolean) status.get("viewable");
                    System.out.println("  File " + (isViewable ? "is" : "is not")
                            + " viewable.");
                } else {
                    System.out.println("failed :(");
                    System.out.println("  Error Message: " + status.get("error"));
                }
            } catch (CrocodocException e) {
                System.out.println("failed :(");
                System.out.println("  Error Code: " + e.getCode());
                System.out.println("  Error Message: " + e.getMessage());
            }

            Date d = new Date();
            saf.setLasted_send_date(d);
            StAssignmentFile.updateLastedSend(saf);
            ss.setAttribute("sa", saf);

            //setting index
            lucenceFunction.settingIndexer(getServletContext().getRealPath("/") + "\\file\\student_assignment_file\\", safl.getPath_file(), Long.parseLong(cId + ""), saf.getAm_id(), saf.getSt_am_id(), safv_id);
            //end setting
        } else {
            safl.setUuid("0");
            safv_id = StAmFileList.setAmFile(safl);
            Date d = new Date();
            saf.setLasted_send_date(d);
            StAssignmentFile.updateLastedSend(saf);
            ss.setAttribute("sa", saf);
        }

        Notification n = new Notification();
        n.setAcc_id(ac.getAcc_id());
        n.setCourse_id(cId);
        n.setType("assignment");
//        String content = "<p><b>" + ac.getFirstname() + " " + ac.getLastname() + "</b>  has sent or updated <b>" + a.getName() + "</b> assignment (" + c.getName() + ").</p>\n";
//        n.setText(content);
        String content = "<span class=\"text-muted\"> <span class=\"glyphicon glyphicon-send\"></span> sent or update his/her \"" + a.getName() + "\" assignment in </span>";
        n.setText(content);
        n.setLink("routeCheckStAm?st_am_id=" + saf.getSt_am_id() + "&&cId=" + cId + "&&am_id=" + a.getAm_id());
        List<Integer> listac = AccountCourse.getTeacherIdCourse(cId, ac.getAcc_id());
        Notification.announce(n, listac);

        request.setAttribute("msg", 3);
        getServletContext().getRequestDispatcher("/informpage.jsp?am_id=" + saf.getAm_id()).forward(request, response);

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
