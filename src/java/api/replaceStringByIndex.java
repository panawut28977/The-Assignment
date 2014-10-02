/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import Model.FillBlank;
import Model.Question;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.Util;

/**
 *
 * @author Orarmor
 */
public class replaceStringByIndex extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String qtext = request.getParameter("qtext");
        String[] startEndList = request.getParameterValues("startEndList[]");
        String reptext = request.getParameter("reptext");
        String result = qtext;
//        System.out.println(qtext);
        System.out.println(Arrays.toString(startEndList));
//        System.out.println(reptext);
        System.out.println("----");
        ArrayList<Question> curList = new ArrayList<>();
        for (String string : startEndList) {
            String[] ste = string.split(",");
            Question q = new FillBlank();
            q.setQ_start_index(Integer.parseInt(ste[0]));
            q.setQ_end_index(Integer.parseInt(ste[1]));
            curList.add(q);
        }
        //sort
//        String temp = null;
//        int minIndex =0;
//        for (int i = 0; i < startEndList.length; i++) {
//            String[] min = startEndList[i].split(",");
//            for (int j = i + 1; j < startEndList.length; j++) {
//                String[] startEnd2 = startEndList[j].split(",");
//                if (Integer.parseInt(startEnd2[0]) < Integer.parseInt(min[0])) {
//                    min = startEnd2;
//                    minIndex = j;
//                }
//            }
//            temp = startEndList[i];
//            startEndList[i] = startEndList[minIndex];
//            startEndList[minIndex] = temp;
//        }
        
        Util.sortQuestionIndex(curList);
        for (int i = curList.size()-1; i >=0; i--) {
            result = Util.replaceStringByIndex(result, curList.get(i).getQ_start_index(),  curList.get(i).getQ_end_index(), reptext);
        }
        out.write(result);
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
