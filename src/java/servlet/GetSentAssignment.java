/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.AccountCourse;
import Model.Assignment;
import Model.Group_member;
import Model.StAssignmentFile;
import Model.StAssignmentOnWeb;
import java.io.IOException;
import java.util.ArrayList;
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
public class GetSentAssignment extends HttpServlet {

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
        Account ac = (Account) ss.getAttribute("ac");
        int am_id = Integer.parseInt(request.getParameter("am_id"));
        String cId = ss.getAttribute("cId") + "";
        String url = "/SentAssignment.jsp?tab=AllAssignment";
        //set am
        Assignment a = Assignment.getAmByAmID(am_id);

        //ลิสของผู้ใช้ทั้งหมดในคอร์สนั้น
        List<Account> allAcc = AccountCourse.getMemberInCourse(Integer.parseInt(cId));
        List<Integer> allAccId = new ArrayList<>();
        for (Account account : allAcc) {
            allAccId.add(account.getAcc_id());
        }
        //ลิสของผู้ใช้ที่มีค่าในกรุ๊ปแล้ว
        List<Integer> accId = new ArrayList<>();
        //ลิสของผู้ใช้ที่เหลือที่ยังไม่มีค่าใน St am file (ยังไม่เคยเปิดงานจะไม่มีค่าใน st am file) ใช้กับงานกลุ่ม
        List<Integer> leftAccId = new ArrayList<>();
        Group_member gm = null;

        int sent = 0;
        int left = 0;
        int total = 0;
        int checked = 0;
        if (a.getAss_type().equalsIgnoreCase("file")) {
            List<StAssignmentFile> sentList = new ArrayList<StAssignmentFile>();
            List<StAssignmentFile> leftList = new ArrayList<StAssignmentFile>();
            List<StAssignmentFile> stF = StAssignmentFile.getStAmByAmId(am_id);

            for (StAssignmentFile sa : stF) {
                if (sa.getLasted_send_date() != null) {
                    sentList.add(sa);
                    sent++;
                    total++;
                } else {
                    leftList.add(sa);
                    left++;
                }

                if (sa.getChecked_time() != null) {
                    checked++;
                }

                //ดึงคนที่มีกลุ่มมาเก็บลง accId
                if (a.getTotal_member() > 1) {
                    gm = Group_member.getMemberById(sa.getG_id());
                    String accList[] = gm.getAcc_id().split(",");
                    for (String string : accList) {
                        accId.add(Integer.parseInt(string));
                    }
                } else {
                    accId.add(sa.getAcc_id());
                }
            }

            //logic สำหรับคิดว่ามีใครเหลืออีกบ้างที่ยังไม่มีกลุ่ม หรือไม่เคยกดเข้างานเลยสักครั้ง
            for (Integer id : allAccId) {
                if ((!accId.contains(id)) && !(AccountCourse.isTeacher(Integer.parseInt(cId), id))) {
                    left++;
                    leftAccId.add(id);
                }
            }
            request.setAttribute("sentList", sentList);
            request.setAttribute("leftList", leftList);
        } else {
            List<StAssignmentOnWeb> sentList = new ArrayList<StAssignmentOnWeb>();
            List<StAssignmentOnWeb> leftList = new ArrayList<StAssignmentOnWeb>();
            List<StAssignmentOnWeb> saw = StAssignmentOnWeb.getStAmByAmId(am_id);
            for (StAssignmentOnWeb sa : saw) {
                if (sa.getLasted_send_date() != null) {
                    sentList.add(sa);
                    sent++;
                    total++;
                } else {
                    leftList.add(sa);
                    left++;
                }

                if (sa.getChecked_time() != null) {
                    checked++;
                }

                //ดึงคนที่มีกลุ่มมาเก็บลง accId
                if (a.getTotal_member() > 1) {
                    gm = Group_member.getMemberById(sa.getG_id());
                    String accList[] = gm.getAcc_id().split(",");
                    for (String string : accList) {
                        accId.add(Integer.parseInt(string));
                    }
                } else {
                    accId.add(sa.getAcc_id());
                }
            }
            //logic สำหรับคิดว่ามีใครเหลืออีกบ้างที่ยังไม่มีกลุ่ม หรือไม่เคยกดเข้างานเลยสักครั้ง
            for (Integer id : allAccId) {
                if (!accId.contains(id) && !(AccountCourse.isTeacher(Integer.parseInt(cId), id))) {
                    left++;
                    leftAccId.add(id);
                }
            }
            request.setAttribute("sentList", sentList);
            request.setAttribute("leftList", leftList);
        }
        request.setAttribute("leftAccId", leftAccId);
        request.setAttribute("sent", sent);
        request.setAttribute("left", left);
        request.setAttribute("total", total);
        request.setAttribute("checked", checked);
        ss.setAttribute("curAm", a);
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
