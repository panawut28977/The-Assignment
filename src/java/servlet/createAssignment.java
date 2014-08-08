/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Assignment;
import Model.Course;
import Model.MultipleChoice;
import Model.Question;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Orarmor
 */
public class createAssignment extends HttpServlet {

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
        File f = new File(getServletContext().getRealPath("/") + "\\file\\assignment_file");
//        System.out.println("check dir " +f.exists());
        MultipartRequest m = new MultipartRequest(request, f.getPath(), "UTF-8");
        Integer cId = (int) ((long) ss.getAttribute("cId"));
        String name = m.getParameter("amName");
        String description = m.getParameter("description");
        String ass_type = m.getParameter("AmType");
        Date due_date = null;
        try {
            due_date = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).parse(m.getParameter("due_date"));
        } catch (ParseException ex) {
            Logger.getLogger(createAssignment.class.getName()).log(Level.SEVERE, null, ex);
        }
        int total_member = Integer.parseInt(m.getParameter("total_member"));
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
//        Date parsedDate;
//        Timestamp due_date = null;
//        try {
//            parsedDate = dateFormat.parse(m.getParameter("due_date"));
//            due_date = new Timestamp(parsedDate.getTime());
//
//        } catch (ParseException ex) {
//            Logger.getLogger(createAssignment.class.getName()).log(Level.SEVERE, null, ex);
//        }
        Assignment a = new Assignment();
        a.setName(name);
        a.setDescription(description);
        a.setTotal_member(total_member);
        a.setAss_type(ass_type);
        a.setCourse(new Course(cId));
        a.setDue_date(due_date);
        String url = "";
        int key = Assignment.createAmInfo(a);
        if (ass_type.equalsIgnoreCase("file")) {
            a.setPath_file(m.getFilesystemName("file"));
//            url = "/assignment.jsp?tab=AllAssignment&&amId=" + key;
        } else {
            String[] seqno = m.getParameterValues("seqno");
            String q_type = null;
            List<Question> qlist = new ArrayList<Question>();
            for (int i = 0; i < seqno.length; i++) {
                q_type = m.getParameter(seqno[i] + "q_type");
                if (q_type.equalsIgnoreCase("multiple_choice")) {
                    String q_no = m.getParameter(seqno[i] + "q_no");
                    String qtext = m.getParameter(seqno[i] + "qtext");
                    String qcategory = m.getParameter(seqno[i] + "qcategory");
                    String[] ans = m.getParameterValues(seqno[i] + "c");
                    String[] ctext = m.getParameterValues(seqno[i] + "ctext");
                    String score = m.getParameter(seqno[i] + "score");
                    MultipleChoice mul = new MultipleChoice();
                    //set question info
                    mul.setAss_id(key);
                    mul.setInstruction(null);
                    mul.setQ_no(Integer.parseInt(q_no));
                    mul.setQ_type(q_type);
                    //set multiple choice info
                    mul.setQ_text(qtext);
                    mul.setQ_category(qcategory);
                    mul.setQ_choice_list(Arrays.toString(ctext));
                    mul.setQ_answer_list(Arrays.toString(ans));
                    mul.setQ_score(Double.parseDouble(score));
                    qlist.add(mul);
                } else if (q_type.equalsIgnoreCase("tfQuestion")) {
                    String q_no = m.getParameter(seqno[i] + "q_no");
                    String qtext = m.getParameter(seqno[i] + "qtext");
                    String ans = m.getParameter(seqno[i] + "c_ans");
                    String qcategory = m.getParameter(seqno[i] + "qcategory");
                    String score = m.getParameter(seqno[i] + "score");
                    MultipleChoice mul = new MultipleChoice();
                    //set question info
                    mul.setAss_id(key);
                    mul.setInstruction(null);
                    mul.setQ_no(Integer.parseInt(q_no));
                    mul.setQ_type(q_type);
                    //set tf choice info
                    mul.setQ_text(qtext);
                    mul.setQ_category(qcategory);
                    mul.setQ_choice_list("[true,false]");
                    mul.setQ_answer_list(ans);
                    mul.setQ_score(Double.parseDouble(score));
                    qlist.add(mul);
                }
            }
//                System.out.println(qlist);
        }
//        getServletContext().getRequestDispatcher(url).forward(request, response);

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
