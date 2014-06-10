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
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JenoVa
 */
public class Course {
    private int course_id;
    private String name;
    private String course_link;
    private String course_code;
    private Date create_date;
    private List<Account> listStudnet;
    private List<Announcement> announcement;
    private List<Assignment> assignment;

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCourse_link() {
        return course_link;
    }

    public void setCourse_link(String course_link) {
        this.course_link = course_link;
    }

    public String getCourse_code() {
        return course_code;
    }

    public void setCourse_code(String course_code) {
        this.course_code = course_code;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public List<Account> getListStudnet() {
        return listStudnet;
    }

    public void setListStudnet(List<Account> listStudnet) {
        this.listStudnet = listStudnet;
    }

    public List<Announcement> getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(List<Announcement> announcement) {
        this.announcement = announcement;
    }

    public List<Assignment> getAssignment() {
        return assignment;
    }

    public void setAssignment(List<Assignment> assignment) {
        this.assignment = assignment;
    }
    
    public static String getCodeByID(int course_id){
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select course_code from course where course_id = ? ";
        PreparedStatement pstm;
        int result = 0;
        String code = "";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                code = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return code;
    }
    
    public static Course getCourseByID(int course_id){
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from course where course_id = ? ";
        PreparedStatement pstm;
        int result = 0;
        Course c = new Course();
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                c.setCourse_id(rs.getInt("course_id"));
                c.setName(rs.getString("name"));
                c.setCourse_code(rs.getString("course_code"));
                c.setCourse_link(rs.getString("course_link"));
                c.setCreate_date(rs.getDate("create_date"));
                c.setAnnouncement(null);
                c.setAssignment(null);
                c.setListStudnet(null);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
    
    public static boolean createCourse(Course c) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into course(name,course_code,course_link) values(?,?,?)";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, c.getName());
            pstm.setString(2, c.getCourse_code());
            pstm.setString(3,  c.getCourse_link());
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }
    
    
    
}
