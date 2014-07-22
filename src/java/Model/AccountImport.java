/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.File;
import java.io.FileInputStream;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author JenoVa
 */
public class AccountImport {

    private int course_id;
    private String firstname;
    private String lastname;

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public List getExcelcolumn(String path_file, int fNameCol , int lNameCol) {
        return null;
    }

    public String excelReader(String path_file, List excelColumn) {
        String extension = FilenameUtils.getExtension(path_file);
        
        if (extension.equalsIgnoreCase(".xlsx")) {
            try {
                FileInputStream file = new FileInputStream(new File(path_file));
                XSSFWorkbook workbook = new XSSFWorkbook(file);
                XSSFSheet sheet = workbook.getSheetAt(0);
                Iterator<Row> rowIterator = sheet.iterator();
                while (rowIterator.hasNext()) {
                    Row row = rowIterator.next();
                    Iterator<Cell> cellIterator = row.cellIterator();

                    while (cellIterator.hasNext()) {
                        Cell cell = cellIterator.next();
                        switch (cell.getCellType()) {
                            case Cell.CELL_TYPE_NUMERIC:
                                System.out.print(cell.getNumericCellValue() + " | ");
                                break;
                            case Cell.CELL_TYPE_STRING:
                                System.out.print(cell.getStringCellValue() + " | ");
                                break;
                        }
                    }
                    System.out.println("");
                }
                file.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (extension.equalsIgnoreCase(".xls")) {
            try {
                FileInputStream file = new FileInputStream(new File(path_file));
                HSSFWorkbook workbook = new HSSFWorkbook(file);

                HSSFSheet sheet = workbook.getSheetAt(0);

                Iterator<Row> rowIterator = sheet.iterator();
                while (rowIterator.hasNext()) {
                    Row row = rowIterator.next();
                    Iterator<Cell> cellIterator = row.cellIterator();

                    while (cellIterator.hasNext()) {
                        Cell cell = cellIterator.next();
                        switch (cell.getCellType()) {
                            case Cell.CELL_TYPE_NUMERIC:
                                System.out.print(cell.getNumericCellValue() + " | ");
                                break;
                            case Cell.CELL_TYPE_STRING:
                                System.out.print(cell.getStringCellValue() + " | ");
                                break;
                        }
                    }
                    System.out.println("");
                }
                file.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    
    public void importStudentList(int course_id,String path_file,int fNameCol,int lNameCol, List excelColumn ){
        AccountImport acc = new AccountImport();
        acc.getExcelcolumn(path_file,fNameCol ,lNameCol);
        acc.excelReader(path_file, excelColumn );
        
    }
    
    public int autoApprove(int course_id ){
        return 0;
    }

}
