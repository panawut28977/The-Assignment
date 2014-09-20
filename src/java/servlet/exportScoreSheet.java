/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.Assignment;
import Model.UserScore;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.PrintSetup;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Orarmor
 */
public class exportScoreSheet extends HttpServlet {

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

        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("scoresheet");
        PrintSetup printSetup = sheet.getPrintSetup();
        printSetup.setLandscape(true);
        sheet.setFitToPage(true);
        sheet.setHorizontallyCenter(true);

        Row titleRow = sheet.createRow(0);
        titleRow.setHeightInPoints(45);
        Cell titleCell = titleRow.createCell(0);
        titleCell.setCellValue("Score sheet of " + "...." + " course");
        sheet.addMergedRegion(CellRangeAddress.valueOf("$A$1:$D$1"));

        List<Account> listStudentScore = (List<Account>) ss.getAttribute("listStudentScore");
        int rownum = 2;
        for (Account account : listStudentScore) {
            Row sumRow = sheet.createRow(rownum);
            sumRow.setHeightInPoints(35);
            Cell cell;
            cell = sumRow.createCell(0);
            cell.setCellValue(account.getFirstname() + " " + account.getLastname());
            int j = 1;
            for (int i = account.getListStudentScore().size() - 1; i >= 0; i--) {
                UserScore usc = (UserScore) account.getListStudentScore().get(i);
                cell = sumRow.createCell(j);
                Assignment a = null;
                if (usc.getAss_type().equalsIgnoreCase("web")) {
                    a = Assignment.getAmTimeByAmID(usc.getStof().getAm_id());
                    String status = Assignment.lastedSentStatus(usc.getStof().getLasted_send_date(), a);
                    if (status.equalsIgnoreCase("ontime") || status.equalsIgnoreCase("hurryup") || status.equalsIgnoreCase("late")) {
                        cell.setCellValue(usc.getStof().getScore());
                    } else {
                        status = Assignment.calculateTime(a);
                        if (status.equalsIgnoreCase("miss")) {
                            cell.setCellValue(usc.getStof().getScore());
                        } else {
                            cell.setCellValue("-");
                        }
                    }

                } else if (usc.getAss_type().equalsIgnoreCase("file")) {
                    a = Assignment.getAmTimeByAmID(usc.getStf().getAm_id());
                    String status = Assignment.lastedSentStatus(usc.getStf().getLasted_send_date(), a);
                    if (status.equalsIgnoreCase("ontime") || status.equalsIgnoreCase("hurryup") || status.equalsIgnoreCase("late")) {
                        cell.setCellValue(usc.getStf().getScore());
                    } else {
                        status = Assignment.calculateTime(a);
                        if (status.equalsIgnoreCase("miss")) {
                            cell.setCellValue(usc.getStf().getScore());
                        } else {
                            cell.setCellValue("-");
                        }
                    }
                }
                j++;
            }
            cell = sumRow.createCell(j);
            int lastcol = account.getListStudentScore().size();

            //calculate column
            int dv = lastcol / 26;
            String coltmp = "";
            for (int i = 0; i < dv; i++) {
                coltmp += "A";
            }
            coltmp += (char) ('A' + (lastcol - (dv * 26)));
            System.out.println(coltmp);
            //

            String ref = (char) ('A' + 1) + "" + (rownum + 1) + ":" + coltmp + (rownum + 1);
            System.out.println(ref);
            cell.setCellFormula("SUM(" + ref + ")");
            rownum++;
        }

        // Write the output to a file
        String file = "C:\\Users\\Orarmor\\Desktop\\scoresheet.xlsx";
        FileOutputStream out = new FileOutputStream(file);
        wb.write(out);
        out.close();

//
//        Workbook wb = new XSSFWorkbook();
//        Sheet sheet = wb.createSheet("scoresheet");
//        PrintSetup printSetup = sheet.getPrintSetup();
//        printSetup.setLandscape(true);
//        sheet.setFitToPage(true);
//        sheet.setHorizontallyCenter(true);
//
//        //title row
//        Row titleRow = sheet.createRow(0);
//        titleRow.setHeightInPoints(45);
//        Cell titleCell = titleRow.createCell(0);
//        titleCell.setCellValue("Score sheet of " + "...." + " course");
//        sheet.addMergedRegion(CellRangeAddress.valueOf("$A$1:$D$1"));
//
//        //row with totals below
//        int rownum = 2;
//        Row sumRow = sheet.createRow(rownum);
//       sumRow.setHeightInPoints(35);
//        Cell cell;
//        cell = sumRow.createCell(0);
//        cell.setCellValue("Name:");
//
//        for (int j = 1; j < 12; j++) {
//            cell = sumRow.createCell(j);
//            String ref = (char) ('A' + j) + "3:" + (char) ('A' + j) + "12";
//            cell.setCellFormula("SUM(" + ref + ")");
//        }
//
//        // Write the output to a file
//        String file = "C:\\Users\\Orarmor\\Desktop\\scoresheet.xlsx";
//        FileOutputStream out = new FileOutputStream(file);
//        wb.write(out);
//        out.close();
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
