/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.AccountCourse;
import Model.AnswerQuestion;
import Model.Assignment;
import Model.Group_member;
import Model.Question;
import Model.StAssignmentFile;
import Model.StAssignmentOnWeb;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
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
            //auto checking all assignment that is not checking
            //search not checking assignment
            Date now = new Date();
            Date lateDate = a.getLate_date();
            if (StAssignmentOnWeb.isNotCheckingExist(am_id) && now.getTime() > lateDate.getTime()) {
                System.out.println("auto checking");
                List<StAssignmentOnWeb> notchcksa = StAssignmentOnWeb.getNotCheckingStAmByAmId(am_id);
                for (StAssignmentOnWeb stAssignmentOnWeb : notchcksa) {
                    int used_id = 0;
                    System.out.println("st_am_id: " + stAssignmentOnWeb.getSt_am_id());
                    for (Question q : a.getQuestionList()) {
                        double score = 0;
                        ArrayList<AnswerQuestion> stanswer = AnswerQuestion.getStAMQuestion(stAssignmentOnWeb.getSt_am_id(), q.getQ_id());
                        if (q.getQ_type().equalsIgnoreCase("multiple_choice") || q.getQ_type().equalsIgnoreCase("tfQuestion")) {
                            String anslist = null;
                            if (q.getQ_type().equalsIgnoreCase("tfQuestion")) {
                                anslist = q.getQ_answer_list();
                            } else {
                                anslist = q.getQ_answer_list().substring(1, q.getQ_answer_list().length() - 1);
                            }
                            String stans = stanswer.get(0).getAnswer().substring(1, stanswer.get(0).getAnswer().length() - 1);

                            String[] anslistsp = null;
                            String[] stanssp = null;

                            if (anslist.indexOf(",") != -1) {
                                anslistsp = anslist.split(",");
                            } else {
                                anslistsp = new String[1];
                                anslistsp[0] = anslist;
                            }

                            if (stans.indexOf(",") != -1) {
                                stanssp = stans.split(",");
                            } else {
                                stanssp = new String[1];
                                stanssp[0] = stans;
                            }
                            double scoreperchoice = q.getQ_score() / anslistsp.length;
                            if (anslistsp.length == stanssp.length) {
                                for (int i = 0; i < anslistsp.length; i++) {
                                    System.out.println(anslistsp[i] + "/" + stanssp[i]);
                                    if (anslistsp[i].equalsIgnoreCase(stanssp[i])) {
                                        score = scoreperchoice;
                                    }
                                }
                            }
                            System.out.println("q_no: " + q.getQ_no() + " score:" + score);
                            //update score
                            //....
//                            if(q.getQ_category().equalsIgnoreCase("one")){
//                                
//                            }else if(q.getQ_category().equalsIgnoreCase("multiple")){
//                                
//                            }else if(q.getQ_category().equalsIgnoreCase("tf")){
//                                
//                            }
                        } else if (q.getQ_type().equalsIgnoreCase("explain")) {
                            //cannot checking
                        } else if (q.getQ_type().equalsIgnoreCase("matchWord")) {
                            if (q.getQ_id() != used_id) {
                                String listans = "";
                                for (int i = 0; i < a.getQuestionList().size() - 1; i++) {
                                    Question tmp = a.getQuestionList().get(i);
                                    if (q.getQ_id() == tmp.getQ_id()) {
                                        listans += "," + tmp.getQ_answer();
                                    }
                                }
                                String[] listansNoshuffle = listans.split(",");
                                for (int j = 0; j < stanswer.size(); j++) {
                                    if (!listansNoshuffle[j].equalsIgnoreCase("")) {
                                        if (listansNoshuffle[j].equalsIgnoreCase(stanswer.get(j).getAnswer())) {
                                            score = q.getQ_score();
                                        }
                                    }
                                }
                                System.out.println("q_no" + q.getQ_no() + "score:" + score);
                            }
                            used_id = q.getQ_id();
                        } else if (q.getQ_type().equalsIgnoreCase("fillBlank")) {

                        }
                    }
                    System.out.println("-----");
                }
            }

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
