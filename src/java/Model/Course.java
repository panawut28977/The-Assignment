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

    //ดึง code ตาม course_id
    public static String getCodeByID(int course_id) {
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

    //ดึง course ตาม course_id
    public static Course getCourseByID(int course_id) {
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

    //สร้าง course
    public static boolean createCourse(Course c) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into course(name,course_code,course_link) values(?,?,?)";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, c.getName());
            pstm.setString(2, c.getCourse_code());
            pstm.setString(3, c.getCourse_link());
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    //ใช้ update information จริงๆมันก็มีแค่ name ที่อัพเดตได้
    public static int updateInfo(Course c) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update course set name=? where course_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, c.getName());
            pstm.setInt(2, c.getCourse_id());
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    //ใช้ลบ course
    public static boolean deleteCourse(int course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "delete from course where course_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    //ใช้ gen code
    public static String generateCode() {
        String code = "";
        String listCharacter = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        int random_math;
        boolean exist = true;
        while (exist) {
            for (int i = 0; i < 5; i++) {
                random_math = (int) (Math.random() * (61 - 0 + 1));
                code += listCharacter.charAt(random_math);
            }

            Connection conn = ConnectionBuilder.getConnection();
            String sql = "select course_code,count(*) from course";
            PreparedStatement pstm;
            try {
                pstm = conn.prepareStatement(sql);
                ResultSet rs = pstm.executeQuery();
                int count = rs.getInt(2);
                while (rs.next()) {
                    count--;
                    if(code.equals(rs.getString(1))){
                        exist = true;
                        break;
                    }else{
                        exist = false;
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return code;
    }
    
    //getScoreSheet อาจไม่ต้องมีตอนทำฟังชั่นนี้ เดียวดึงเอาข้อมูลที่มีอยู่แล้วมาใช้
    //exportScoreSheet รอทำจริงค่อยทำ
    //getAllCourseMember ใช้ getListStudnet เลย
    @Override
    public String toString() {
        return "Course{" + "course_id=" + course_id + ", name=" + name + ", course_link=" + course_link + ", course_code=" + course_code + ", create_date=" + create_date + ", listStudnet=" + listStudnet + ", announcement=" + announcement + ", assignment=" + assignment + '}';
    }
    
    
}