/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.AccountCourse;
import Model.Assignment;
import Model.StAssignmentFile;
import Model.StAssignmentOnWeb;
import Model.UserScore;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
 * @author longd29
 */
public class userscore extends HttpServlet {

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
        Long cId = (Long) ss.getAttribute("cId");
        String remaintTimeSt = "";
        AccountCourse yourCourse = (AccountCourse) (ac.getCourseList().get(cId));
        if (yourCourse.getRole().equalsIgnoreCase("ST")) {
            //fully_score คะแนนเต็มของทุกงานรวมกัน
            //mark คะแนนที่ได้
            //max_mark คะแนนทงานรวมทั้งหมดแล้วควรได้เท่าไหร่ รวมถึงงานที่ไม่ได้ส่งด้วย
            //max_sent_mark คะแนนเต็มของงานทั้งหมดที่ส่งเป็นเท่าไหร่
            //miss_score คะแนนที่พลาดเนื่องจากไม่ได้ส่ง
            int sent = 0, leftover = 0, miss_am = 0;
            double fully_score = 0, mark = 0, max_mark = 0, max_sent_mark = 0, miss_score = 0;
            List<Assignment> courseAssignment = yourCourse.getCourse().getAssignment();
            Map<Integer, StAssignmentFile> stf = new HashMap<>();
            Map<Integer, StAssignmentOnWeb> stow = new HashMap<>();
            if (yourCourse.getRole().equalsIgnoreCase("ST")) {
                for (Assignment assignment : courseAssignment) {
//                    System.out.println(assignment);
                    fully_score += assignment.getFully_mark();
                    remaintTimeSt = Assignment.remainingTimeforSend(assignment, ac.getAcc_id());
                    if (remaintTimeSt.equalsIgnoreCase("sent")) {
                        sent++;
                        max_mark += assignment.getFully_mark();
                        max_sent_mark += assignment.getFully_mark();
                    } else if (remaintTimeSt.equalsIgnoreCase("miss")) {
                        miss_am++;
                        miss_score += assignment.getFully_mark();
                        max_mark += assignment.getFully_mark();
                    } else {
                        leftover++;
                    }

                    if (assignment.getAss_type().equalsIgnoreCase("file")) {
                        StAssignmentFile nstf = null;
                        if (assignment.getTotal_member() == 1) {
                            nstf = StAssignmentFile.getStAmBbyAmIDAndAccId(assignment.getAm_id(), ac.getAcc_id());
                        } else {
                            nstf = StAssignmentFile.getStAmBbyAmIDAndAccId(assignment.getAm_id(), ac.getAcc_id(), true);
                        }
                        if (nstf != null) {
                            stf.put(assignment.getAm_id(), nstf);
                        }
                    } else {
                        StAssignmentOnWeb nstow = null;
                        if (assignment.getTotal_member() == 1) {
                            nstow = StAssignmentOnWeb.getStAmByAmIDAndAccId(assignment.getAm_id(), ac.getAcc_id());
                        } else {
                            nstow = StAssignmentOnWeb.getStAmByAmIDAndAccId(assignment.getAm_id(), ac.getAcc_id(), true);
                        }
                        if (nstow != null) {
                            stow.put(assignment.getAm_id(), nstow);
                        }
                    }
                }

            }

            Iterator loopf = stf.entrySet().iterator();
            Iterator loopw = stow.entrySet().iterator();
            while (loopf.hasNext()) {
                Map.Entry mapEntry = (Map.Entry) loopf.next();
                StAssignmentFile f = (StAssignmentFile) mapEntry.getValue();
                if (f.getLasted_send_date() != null) {
                    mark += f.getScore();
                }
            }

            while (loopw.hasNext()) {
                Map.Entry mapEntry = (Map.Entry) loopw.next();
                StAssignmentOnWeb w = (StAssignmentOnWeb) mapEntry.getValue();
                if (w.getLasted_send_date() != null) {
                    mark += w.getScore();
                }
            }
//        for (StAssignmentFile f : stf) {
//            if(f.getLasted_send_date() != null){
//                mark += f.getScore();
//            }
//        }
//        for (StAssignmentOnWeb w : stow) {
//            if(w.getLasted_send_date() != null){
//                mark += w.getScore();
//            }
//        }
            System.out.println(stf.size());
            System.out.println(stow.size());
            ss.setAttribute("stf", stf);
            ss.setAttribute("stow", stow);
            ss.setAttribute("miss_am", miss_am);
            ss.setAttribute("total_sent_am", sent);
            ss.setAttribute("leftover_am", leftover);
            ss.setAttribute("total_mark", mark);
            ss.setAttribute("max_mark", max_mark);
            ss.setAttribute("max_sent_mark", max_sent_mark);
            ss.setAttribute("miss_score", miss_score);
            ss.setAttribute("fully_score", fully_score);
        } else {
            List<Account> listStudent = yourCourse.getCourse().getListStudent();
            List<Account> listStudentScore = new ArrayList<>();
            List<Assignment> listAm = yourCourse.getCourse().getAssignment();
            List<UserScore> usList = null;
            //loop ดึงนักเรียนทั้งหมดออกมาเพื่อ set ค่า userscore ให้กับทุกคนเพราะปกติแล้วมันจะเป้น null ไม่ได้ดึงมาให้
            UserScore u = null;
            for (Account account : listStudent) {
                String acc_role = AccountCourse.getAccountRole(account.getAcc_id(), Integer.parseInt(cId + ""));
                if (acc_role.equalsIgnoreCase("ST")) {
                    usList = new ArrayList<>();
                    String accName = account.getFirstname() + " " + account.getLastname();
//                System.out.println(u.getFullname()); 
                    //จะ set score ให้กับแต่ละคนต้องรู้ว่าในคอร์สของคนนั้นมีวิชาไรอยุ่บ้างเลยต้องลูบทุกวิชา
                    for (Assignment assignment : listAm) {
                        u = new UserScore();
                        u.setFullname(accName);
                        u.setAm_id(assignment.getAm_id());
                        u.setAm_name(assignment.getName());
                        u.setFull_mark(assignment.getFully_mark());
                        //ทำการดึงคะแนนของงานมาใส่ใน userscore แต่ต้อง check ว่าเป็นงานประเภทไหนก่อนถึงจะใช้ method ถูก
                        if (assignment.getAss_type().equalsIgnoreCase("file")) {
                            StAssignmentFile stf = new StAssignmentFile();
                            //เช็คต่อว่าเป็นงานเดี่ยวหรือกลุ่ม
                            if (assignment.getTotal_member() > 1) {
                                stf = StAssignmentFile.getStAmBbyAmIDAndAccId(assignment.getAm_id(), account.getAcc_id(), true);
                            } else {
                                stf = StAssignmentFile.getStAmBbyAmIDAndAccId(assignment.getAm_id(), account.getAcc_id());
                            }

                            // ถ้างานยังไม่มีส่งให้เซ็ต am_id เปน default มาให้
                            if (stf == null) {
                                stf = new StAssignmentFile();
                                stf.setAm_id(u.getAm_id());
                            }
                            u.setStf(stf);
                            //เช็คว่างานนั้นเคยส่งมั้ย ถ้าส่งไปล้วให้ไปคิดว่าเวลาส่งมัน ontime หรือ late
//                            System.out.println("am_id : " + assignment.getAm_id() + " / acc_id : " + account.getAcc_id()  + " /score: " + score + "/" + sent_status);
                        } else {
                            StAssignmentOnWeb stow = new StAssignmentOnWeb();
                            if (assignment.getTotal_member() > 1) {
                                stow = StAssignmentOnWeb.getStAmByAmIDAndAccId(assignment.getAm_id(), account.getAcc_id(), true);
                            } else {
                                stow = StAssignmentOnWeb.getStAmByAmIDAndAccId(assignment.getAm_id(), account.getAcc_id());
                            }

                            // ถ้างานยังไม่มีส่งให้เซ็ต am_id เปน default มาให้
                            if (stow == null) {
                                stow = new StAssignmentOnWeb();
                                stow.setAm_id(u.getAm_id());
                            }
                            u.setStof(stow);
//                            System.out.println("am_id : " + assignment.getAm_id() + " / acc_id : " + account.getAcc_id()  + " /score: " + score + "/" + sent_status);
                        }
                        u.setAss_type(assignment.getAss_type());
                        usList.add(u);
                    }
//                    System.out.println(usList);
                    account.setListStudentScore(usList);
                    listStudentScore.add(account);
                }
            }

            ss.setAttribute("listStudentScore", listStudentScore);
            System.out.println("list"+listStudentScore);
        }
        getServletContext().getRequestDispatcher("/course.jsp?tab=score").forward(request, response);
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
