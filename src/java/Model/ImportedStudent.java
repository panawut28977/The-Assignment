/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JenoVa
 * commit from github 2014-10-09 11.51
 */
public class ImportedStudent {
    
    private int course_id;
    private String email;
    private String firstname;
    private String lastname;
    
    public int getCourse_id() {
        return course_id;
    }
    
    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
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
    
    public static int setStudentList(List<ImportedStudent> strow) {
        Connection conn = ConnectionBuilder.getConnection();
        PreparedStatement pstm;
        String data = "";
        int result = 0;
        for (ImportedStudent st : strow) {
            data += "(" + st.getCourse_id() + ",'" + st.getEmail() + "','" + st.getFirstname() + "','" + st.getLastname() + "'),";
        }
        data = data.substring(0, data.length() - 1);
        String sql = "insert into import_student_list(course_id,email,firstname,lastname) values" + data;
        try {
            pstm = conn.prepareStatement(sql);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentOnWeb.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return result;
    }
    
    public static boolean deleteCourseStudentList(int course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "delete from import_student_list where course_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }
    
    public static List<ImportedStudent> getStudentList(int course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from import_student_list where course_id=?";
        PreparedStatement pstm;
        List<ImportedStudent> stList = new ArrayList<ImportedStudent>();
        ImportedStudent st = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                st = new ImportedStudent();
                st.setCourse_id(rs.getInt("course_id"));
                st.setEmail(rs.getString("email"));
                st.setFirstname(rs.getString("firstname"));
                st.setLastname(rs.getString("lastname"));
                stList.add(st);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return stList;
    }
    
    @Override
    public String toString() {
        return "excelColumn{" + "course_id=" + course_id + ", email=" + email + ", firstname=" + firstname + ", lastname=" + lastname + '}';
    }
    
}
