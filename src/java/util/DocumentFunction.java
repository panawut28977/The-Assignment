/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.PrintSetup;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;

/**
 *
 * @author Orarmor
 */
public class DocumentFunction {

    public static String readDocFile(String fileName) {
        StringBuilder text = new StringBuilder();
        try {
            File file = new File(fileName);
            FileInputStream fis = new FileInputStream(file.getAbsolutePath());

            HWPFDocument doc = new HWPFDocument(fis);

            WordExtractor we = new WordExtractor(doc);

            String[] paragraphs = we.getParagraphText();

            //System.out.println("Total no of paragraph "+paragraphs.length);
            for (String para : paragraphs) {
                text.append(para.toString() + "\n");
            }
            fis.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return text.toString();
    }

    public static String readDocxFile(String fileName) {
        StringBuilder text = new StringBuilder();
        try {
            File file = new File(fileName);
            FileInputStream fis = new FileInputStream(file.getAbsolutePath());

            XWPFDocument document = new XWPFDocument(fis);

            List<XWPFParagraph> paragraphs = document.getParagraphs();

            //System.out.println("Total no of paragraph "+paragraphs.size());
            for (XWPFParagraph para : paragraphs) {
                text.append(para.getText() + "\n");
            }
            fis.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return text.toString();
    }

    public static String readPdfFile(String filename) {
        PDDocument pd;
        BufferedWriter wr;
        StringBuilder text = new StringBuilder();
        try {
            File input = new File(filename);  // The PDF file from where you would like to extract
            //File output = new File("C:\\SampleText.txt"); // The text file where you are going to store the extracted data
            pd = PDDocument.load(input);
            //pd.save("CopyOfInvoice.pdf"); // Creates a copy called "CopyOfInvoice.pdf"
            PDFTextStripper stripper = new PDFTextStripper();
            text.append(stripper.getText(pd) + "\n");
            // I use close() to flush the stream.
            if (pd != null) {
                pd.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return text.toString();
    }

    public static String readXlsxFile(String filename) {
        StringBuilder text = new StringBuilder();
        try {
            FileInputStream file = new FileInputStream(new File(filename));

            //Create Workbook instance holding reference to .xlsx file
            XSSFWorkbook workbook = new XSSFWorkbook(file);
            for (int i = 0; i < workbook.getNumberOfSheets() - 1; i++) {
                //Get first/desired sheet from the workbook
                XSSFSheet sheet = workbook.getSheetAt(i);

                //Iterate through each rows one by one
                Iterator<Row> rowIterator = sheet.iterator();
                while (rowIterator.hasNext()) {
                    Row row = rowIterator.next();
                    //For each row, iterate through all the columns
                    Iterator<Cell> cellIterator = row.cellIterator();
                    boolean breakPoint = true;
                    while (cellIterator.hasNext()) {
                        Cell cell = cellIterator.next();
                        //Check the cell type and format accordingly
                        switch (cell.getCellType()) {
                            case Cell.CELL_TYPE_NUMERIC:
                                text.append(cell.getNumericCellValue() + " ");
                                break;
                            case Cell.CELL_TYPE_STRING:
                                text.append(cell.getStringCellValue() + " ");
                                break;
                            case Cell.CELL_TYPE_BLANK:
                                breakPoint = false;
                                break;
                        }
                    }
                    if (breakPoint) {
                        text.append("\n");
                    }
                }
            }
            file.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return text.toString();
    }

    public static String readXlsFile(String filename) {
        StringBuilder text = new StringBuilder();
        try {
            FileInputStream file = new FileInputStream(new File(filename));

            //Create Workbook instance holding reference to .xlsx file
            HSSFWorkbook workbook = new HSSFWorkbook(file);

            //Get first/desired sheet from the workbook
            for (int i = 0; i < workbook.getNumberOfSheets() - 1; i++) {
                HSSFSheet sheet = workbook.getSheetAt(i);

                //Iterate through each rows one by one
                Iterator<Row> rowIterator = sheet.iterator();
                while (rowIterator.hasNext()) {
                    Row row = rowIterator.next();
                    //For each row, iterate through all the columns
                    Iterator<Cell> cellIterator = row.cellIterator();
                    boolean breakPoint = true;
                    while (cellIterator.hasNext()) {
                        Cell cell = cellIterator.next();
                        //Check the cell type and format accordingly
                        switch (cell.getCellType()) {
                            case Cell.CELL_TYPE_NUMERIC:
                                text.append(cell.getNumericCellValue() + " ");
                                break;
                            case Cell.CELL_TYPE_STRING:
                                text.append(cell.getStringCellValue() + " ");
                                break;
                            case Cell.CELL_TYPE_BLANK:
                                breakPoint = false;
                                break;
                        }
                    }
                    if (breakPoint) {
                        text.append("\n");
                    }
                }
            }
            file.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return text.toString();
    }

//    
//
//    public static void main(String[] args) {
//
//        //pdf        
//        //System.out.println(readPdfFile("D:\\Dropbox\\IT#17\\GEN421 - สังคมบูรณาการ\\070257 - Energy , Environment.pdf"));
//        //xlsx
//        System.out.println(readXlsxFile("D:\\Dropbox\\IT#17\\INT381 - Software Project\\int381 quiz_pv\\net present value.xlsx"));
//        //xls
//        //System.out.println(readXlsFile("D:\\Dropbox\\IT#17\\INT204 - Business Information Systems\\LAB\\INT204 LAB I\\Pivot_Example.xls"));
//    }

    public static void main(String[] args) throws Exception {
        Workbook wb = new XSSFWorkbook();

        Sheet sheet = wb.createSheet("scoresheet");
        PrintSetup printSetup = sheet.getPrintSetup();
        printSetup.setLandscape(true);
        sheet.setFitToPage(true);
        sheet.setHorizontallyCenter(true);

        //title row
        Row titleRow = sheet.createRow(0);
//        titleRow.setHeightInPoints(45);
        Cell titleCell = titleRow.createCell(0);
        titleCell.setCellValue("Score sheet of "+"...."+" course");
        sheet.addMergedRegion(CellRangeAddress.valueOf("$A$1:$D$1"));


        //row with totals below
        int rownum = 2;
        Row sumRow = sheet.createRow(rownum);
//        sumRow.setHeightInPoints(35);
        Cell cell;
        cell = sumRow.createCell(0);
        cell.setCellValue("Name:");

        for (int j = 1; j < 12; j++) {
            cell = sumRow.createCell(j);
            String ref = (char) ('A' + j) + "3:" + (char) ('A' + j) + "12";
            cell.setCellFormula("SUM(" + ref + ")");
        }
//        rownum++;
//        sumRow = sheet.createRow(rownum++);
//        sumRow.setHeightInPoints(25);
//        cell = sumRow.createCell(0);
//        cell.setCellValue("Total Regular Hours");
//        cell = sumRow.createCell(1);
//        cell.setCellFormula("L13");
//        sumRow = sheet.createRow(rownum++);
//        sumRow.setHeightInPoints(25);
//        cell = sumRow.createCell(0);
//        cell.setCellValue("Total Overtime Hours");
//        cell = sumRow.createCell(1);
//        cell.setCellFormula("K13");

        // Write the output to a file
        String file = "C:\\Users\\Orarmor\\Desktop\\timesheet.xls";
        if (wb instanceof XSSFWorkbook) {
            file += "x";
        }
        FileOutputStream out = new FileOutputStream(file);
        wb.write(out);
        out.close();
    }


}
