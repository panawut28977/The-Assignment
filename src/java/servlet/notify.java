/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.Notification;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Orarmor
 */
public class notify extends HttpServlet {

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

        System.out.println("notify");
        //current notification
        Map<Integer, String> curNoti = (Map<Integer, String>) ss.getAttribute("notification");
        //get new notificastion
        Map<Integer, String> noti = Notification.getNotify(ac.getAcc_id());
        System.out.println("noti :" + noti);
        if (curNoti == null) {
            System.out.println("if");
            Iterator i = noti.entrySet().iterator();
            int cAnn = 0, cAlert = 0, cAm = 0, cScore = 0, total = 0;
            while (i.hasNext()) {
                Entry entry = (Entry) i.next();
                if ((entry.getValue() + "").equalsIgnoreCase("announce")) {
                    cAnn++;
                } else if ((entry.getValue() + "").equalsIgnoreCase("alert")) {
                    cAlert++;
                } else if ((entry.getValue() + "").equalsIgnoreCase("score")) {
                    cAm++;
                } else if ((entry.getValue() + "").equalsIgnoreCase("assignment")) {
                    cScore++;
                }
                // if สำหรับเช็คว่าสำกับ obj เดิมมั้ย
            }
            total = cAnn + cAlert + cAm + cScore;
            Gson g = new Gson();

            writer.write("event:cAnn\n");
            writer.write("data:" + cAnn + "\n\n");

            writer.write("event:cAlert\n");
            writer.write("data:" + cAlert + "\n\n");

            writer.write("event:cScore\n");
            writer.write("data:" + cScore + "\n\n");

            writer.write("event:cAm\n");
            writer.write("data:" + cAm + "\n\n");

            writer.write("event:cTotal\n");
            writer.write("data:" + total + "\n\n");

            //set session
            ss.setAttribute("cAnn", cAnn);
            ss.setAttribute("cAlert", cAlert);
            ss.setAttribute("cScore", cScore);
            ss.setAttribute("cAm", cAm);
            ss.setAttribute("cTotal", total);
            ss.setAttribute("notification", noti);
        } else {
            System.out.println("else");
            boolean newNoti = false;
            //check current and new notification
            int cNewAnn = 0, cNewAm = 0, cNewAlert = 0, cNewScore = 0;
            if (noti != null) {
                Iterator i = noti.entrySet().iterator();
                while (i.hasNext()) {
                    Entry entry = (Entry) i.next();
                    if (!curNoti.containsKey(entry.getKey())) {
                        String type = (String) entry.getValue();
                        //นับ notify ที่มาใหม่ว่าเป้นของประเภทอะไรเท่าไหร่
                        if (type.equalsIgnoreCase("announce")) {
                            cNewAnn++;
                        } else if (type.equalsIgnoreCase("alert")) {
                            cNewAlert++;
                        } else if (type.equalsIgnoreCase("score")) {
                            cNewAm++;
                        } else if (type.equalsIgnoreCase("assignment")) {
                            cNewScore++;
                        }
                        newNoti = true;
                    }
                    //if สำหรับเช็คว่าสำกับ obj เดิมมั้ย
                }
            }
            System.out.println("newNoti: " + newNoti);
            if (newNoti) {
                Iterator i = noti.entrySet().iterator();
                int cAnn = 0, cAlert = 0, cAm = 0, cScore = 0, total = 0;
                while (i.hasNext()) {
                    Entry entry = (Entry) i.next();
                    if ((entry.getValue() + "").equalsIgnoreCase("announce")) {
                        cAnn++;
                    } else if ((entry.getValue() + "").equalsIgnoreCase("alert")) {
                        cAlert++;
                    } else if ((entry.getValue() + "").equalsIgnoreCase("score")) {
                        cAm++;
                    } else if ((entry.getValue() + "").equalsIgnoreCase("assignment")) {
                        cScore++;
                    }
                    //if สำหรับเช็คว่าสำกับ obj เดิมมั้ย
                }
                total = cAnn + cAlert + cAm + cScore;
                Gson g = new Gson();

                //notfy cout of each type event
                writer.write("event:cAnn\n");
                writer.write("data:" + cAnn + "\n\n");

                writer.write("event:cAlert\n");
                writer.write("data:" + cAlert + "\n\n");

                writer.write("event:cScore\n");
                writer.write("data:" + cScore + "\n\n");

                writer.write("event:cAm\n");
                writer.write("data:" + cAm + "\n\n");

                writer.write("event:cTotal\n");
                writer.write("data:" + total + "\n\n");

                //notify count of new event if count geather than 0
                if (cNewAlert > 0) {
                    writer.write("event:cNewAlert\n");
                    writer.write("data:" + cNewAlert + "\n\n");
                }

                if (cNewAm > 0) {
                    writer.write("event:cNewAm\n");
                    writer.write("data:" + cNewAm + "\n\n");
                }

                if (cNewAnn > 0) {
                    writer.write("event:cNewAnn\n");
                    writer.write("data:" + cNewAnn + "\n\n");
                }

                if (cNewScore > 0) {
                    writer.write("event:cNewScore\n");
                    writer.write("data:" + cNewScore + "\n\n");
                }

                //set session
                ss.setAttribute("cAnn", cAnn);
                ss.setAttribute("cAlert", cAlert);
                ss.setAttribute("cScore", cScore);
                ss.setAttribute("cAm", cAm);
                ss.setAttribute("cTotal", total);
                ss.setAttribute("notification", noti);
            }

        }

        writer.flush();
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        writer.close();
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

//    public static void countNoti(Map<Integer, String> noti, PrintWriter writer) {
//        Iterator i = noti.entrySet().iterator();
//        int cAnn = 0, cAlert = 0, cAm = 0, cScore = 0, total = 0;
//        while (i.hasNext()) {
//            Entry entry = (Entry) i.next();
//            if ((entry.getValue() + "").equalsIgnoreCase("announce")) {
//                cAnn++;
//            } else if ((entry.getValue() + "").equalsIgnoreCase("alert")) {
//                cAlert++;
//            } else if ((entry.getValue() + "").equalsIgnoreCase("score")) {
//                cAm++;
//            } else if ((entry.getValue() + "").equalsIgnoreCase("assignment")) {
//                cScore++;
//            }
//            //if สำหรับเช็คว่าสำกับ obj เดิมมั้ย
//        }
//        total = cAnn + cAlert + cAm + cScore;
//        Gson g = new Gson();
//
//        writer.write("event:cAnn\n");
//        writer.write("data:" + cAnn + "\n\n");
//
//        writer.write("event:cAlert\n");
//        writer.write("data:" + cAlert + "\n\n");
//
//        writer.write("event:cScore\n");
//        writer.write("data:" + cScore + "\n\n");
//
//        writer.write("event:cAm\n");
//        writer.write("data:" + cAm + "\n\n");
//    }
}
