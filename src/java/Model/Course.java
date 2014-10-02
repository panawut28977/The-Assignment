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
    private int term;
    private int year;
    private String course_link;
    private String course_code;
    private Date create_date;
    private List<Account> listStudent;
    private List<Announcement> announcement;
    private List<Assignment> assignment;

    public Course() {
    }

    public Course(int course_id) {
        this.course_id = course_id;
    }

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

    public int getTerm() {
        return term;
    }

    public void setTerm(int term) {
        this.term = term;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
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

    public List<Account> getListStudent() {
        return listStudent;
    }

    public void setListStudent(List<Account> listStudent) {
        this.listStudent = listStudent;
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
            conn.close();
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
                int courseId = rs.getInt("course_id");
                c.setCourse_id(courseId);
                c.setName(rs.getString("name"));
                c.setTerm(rs.getInt("term"));
                c.setYear(rs.getInt("year"));
                c.setCourse_code(rs.getString("course_code"));
                c.setCourse_link(rs.getString("course_link"));
                c.setCreate_date(rs.getDate("create_date"));
                //c.setAnnouncement(Announcement.viewAnnByCourse(course_id));
//                c.setAssignment(Assignment.getAmByCourseIDNoSetCourse(course_id));
//                c.setListStudent(AccountCourse.getMemberInCourse(course_id));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public static Course getCourseByID(int course_id, boolean nosetobject) {
        Course c = new Course();
        if (nosetobject) {
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "select * from course where course_id = ? ";
            PreparedStatement pstm;
            int result = 0;
            try {
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, course_id);
                ResultSet rs = pstm.executeQuery();
                if (rs.next()) {
                    int courseId = rs.getInt("course_id");
                    c.setCourse_id(courseId);
                    c.setName(rs.getString("name"));
                    c.setTerm(rs.getInt("term"));
                    c.setYear(rs.getInt("year"));
                    c.setCourse_code(rs.getString("course_code"));
                    c.setCourse_link(rs.getString("course_link"));
                    c.setCreate_date(rs.getDate("create_date"));
                }
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            c = getCourseByID(course_id);
        }
        return c;
    }

    //ดึง course ตาม code
    public static Course getCourseByCode(String code) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from course where course_code like ? ";
        PreparedStatement pstm;
        int result = 0;
        Course c = new Course();
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, code);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                int courseId = rs.getInt("course_id");
                c.setCourse_id(courseId);
                c.setName(rs.getString("name"));
                c.setTerm(rs.getInt("term"));
                c.setYear(rs.getInt("year"));
                c.setCourse_code(rs.getString("course_code"));
                c.setCourse_link(rs.getString("course_link"));
                c.setCreate_date(rs.getDate("create_date"));
                c.setAnnouncement(Announcement.viewAnnByCourse(courseId));
                c.setAssignment(Assignment.getAmByCourseIDNoSetCourse(courseId));
                c.setListStudent(AccountCourse.getMemberInCourse(courseId));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    //สร้าง course
    public static int createCourse(Course c) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into course(name,term,year,course_code,course_link) values(?,?,?,?,?)";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstm.setString(1, c.getName());
            pstm.setInt(2, c.getTerm());
            pstm.setInt(3, c.getYear());
            pstm.setString(4, c.getCourse_code());
            pstm.setString(5, c.getCourse_link());
            pstm.executeUpdate();
            ResultSet generatedKeys = pstm.getGeneratedKeys();
            if (generatedKeys.next()) {
                result = generatedKeys.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
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
            conn.close();
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
            conn.close();
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
            String sql = "select course_code from course";
            PreparedStatement pstm;
            try {
                pstm = conn.prepareStatement(sql);
                ResultSet rs = pstm.executeQuery();
//                int count = rs.getInt(2);
//                if(count==0){
//                    count=0;
//                }
                while (rs.next()) {
//                    count--;
                    if (code.equals(rs.getString(1))) {
                        exist = true;
                        break;
                    } else {
                        exist = false;
                    }
                }
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(Course.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return code;
    }

    public static String getCourseNameByID(int course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select name from course where course_id = ? ";
        PreparedStatement pstm;
        String name = "";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                name = rs.getString("name");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }

    //getScoreSheet อาจไม่ต้องมีตอนทำฟังชั่นนี้ เดียวดึงเอาข้อมูลที่มีอยู่แล้วมาใช้
    //exportScoreSheet รอทำจริงค่อยทำ
    //getAllCourseMember ใช้ getListStudent เลย
    @Override
    public String toString() {
        return "Course{" + "course_id=" + course_id + ", name=" + name + ", course_link=" + course_link + ", course_code=" + course_code + ", create_date=" + create_date + ", listStudent=" + listStudent + ", announcement=" + announcement + ", assignment=" + assignment + '}';
    }

}
