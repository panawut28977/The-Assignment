/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.Account;
import Model.Assignment;
import Model.Course;
import Model.UserScore;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
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
        int cId = Integer.parseInt((Long) ss.getAttribute("cId") + "");
        Course c = Course.getCourseByID(cId);

        Workbook wb = new XSSFWorkbook();
        Map<String, CellStyle> styles = createStyles(wb);

        Sheet sheet = wb.createSheet("scoresheet");
        PrintSetup printSetup = sheet.getPrintSetup();
        printSetup.setLandscape(true);
        sheet.setFitToPage(true);
        sheet.setHorizontallyCenter(true);

        Row titleRow = sheet.createRow(0);
        titleRow.setHeightInPoints(45);
        Cell titleCell = titleRow.createCell(0);
        titleCell.setCellValue("Score sheet of " + c.getName() + " course");
        titleCell.setCellStyle(styles.get("title"));
        sheet.addMergedRegion(CellRangeAddress.valueOf("$A$1:$N$1"));

        List<Account> listStudentScore = (List<Account>) ss.getAttribute("listStudentScore");
        int rownum = 2;
        int cellcount = 1;
        Row sumRow = sheet.createRow(rownum);
        sumRow.setHeightInPoints(55);
        Cell cell;
        cell = sumRow.createCell(0);
        cell.setCellValue("Student name");
        cell.setCellStyle(styles.get("header"));
        int countback = listStudentScore.get(0).getListStudentScore().size();
        int maxScore = 0;
        for (int i = countback - 1; i >= 0; i--) {
            cell = sumRow.createCell(cellcount);
            UserScore u = listStudentScore.get(0).getListStudentScore().get(i);
            cell.setCellValue("(" + cellcount + ") " + u.getAm_name() + " (" + u.getFull_mark() + ")");
            cell.setCellStyle(styles.get("header"));
            cellcount++;
            maxScore += u.getFull_mark();
        }
        cell = sumRow.createCell(cellcount);
        cell.setCellValue("Total (" + maxScore + ")");
        cell.setCellStyle(styles.get("header"));
        rownum++;

        for (Account account : listStudentScore) {
            sumRow = sheet.createRow(rownum);
            sumRow.setHeightInPoints(35);
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
        String filename = "scoresheet_"+c.getName()+".xlsx";
        String file = getServletContext().getRealPath("/") + "\\file\\scoresheet\\" + filename;
//        String file = "C:\\Users\\Orarmor\\Desktop\\scoresheet.xlsx";
        FileOutputStream out = new FileOutputStream(file);
        wb.write(out);
        out.close();
        
        response.sendRedirect("file/scoresheet/" + filename);

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

    private static Map<String, CellStyle> createStyles(Workbook wb) {
        Map<String, CellStyle> styles = new HashMap<String, CellStyle>();
        CellStyle style;
        Font titleFont = wb.createFont();
        titleFont.setFontHeightInPoints((short) 18);
        titleFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
        style = wb.createCellStyle();
        style.setAlignment(CellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        style.setFont(titleFont);
        styles.put("title", style);

        Font monthFont = wb.createFont();
        monthFont.setFontHeightInPoints((short) 11);
        monthFont.setColor(IndexedColors.WHITE.getIndex());
        style = wb.createCellStyle();
        style.setAlignment(CellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        style.setFillForegroundColor(IndexedColors.GREY_50_PERCENT.getIndex());
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        style.setFont(monthFont);
        style.setWrapText(true);
        styles.put("header", style);

        style = wb.createCellStyle();
        style.setAlignment(CellStyle.ALIGN_CENTER);
        style.setWrapText(true);
        style.setBorderRight(CellStyle.BORDER_THIN);
        style.setRightBorderColor(IndexedColors.BLACK.getIndex());
        style.setBorderLeft(CellStyle.BORDER_THIN);
        style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
        style.setBorderTop(CellStyle.BORDER_THIN);
        style.setTopBorderColor(IndexedColors.BLACK.getIndex());
        style.setBorderBottom(CellStyle.BORDER_THIN);
        style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
        styles.put("cell", style);

        style = wb.createCellStyle();
        style.setAlignment(CellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        style.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        style.setDataFormat(wb.createDataFormat().getFormat("0.00"));
        styles.put("formula", style);

        style = wb.createCellStyle();
        style.setAlignment(CellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        style.setFillForegroundColor(IndexedColors.GREY_40_PERCENT.getIndex());
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        style.setDataFormat(wb.createDataFormat().getFormat("0.00"));
        styles.put("formula_2", style);

        return styles;
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
