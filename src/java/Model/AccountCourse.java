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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JenoVa
 */
public class AccountCourse {

    private Course course;
    private String status;
    private String role;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public static int joinCourse(AccountCourse detail, int acc_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into account_course values(?,?,?,?)";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            pstm.setInt(2, detail.getCourse().getCourse_id());
            pstm.setString(3, detail.getStatus());
            pstm.setString(4, detail.getRole());
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static boolean approve(int acc_id, int course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update account_course set status=? where acc_id=? and course_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, "approved");
            pstm.setInt(2, acc_id);
            pstm.setInt(3, course_id);
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    public static boolean disapprove(int acc_id, int course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update account_course set status=? where acc_id=? and course_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, "disapproved");
            pstm.setInt(2, acc_id);
            pstm.setInt(3, course_id);
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    //removeMember ก็ใช้ method leaveCourse ได้เลย(บังคับให้ leave)
    public static boolean leaveCourse(int acc_id, int course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "delete from account_course where acc_id=? and course_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            pstm.setInt(2, course_id);
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

//    public static boolean removeMember(int acc_id, int course_id) {
//        Connection conn = ConnectionBuilder.getConnection();
//        String sql = "delete from account_course where acc_id=? and course_id=?";
//        PreparedStatement pstm;
//        int result = 0;
//        try {
//            pstm = conn.prepareStatement(sql);
//            pstm.setInt(1, acc_id);
//            pstm.setInt(2, course_id);
//            result = pstm.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return result > 0;
//    }

    public static boolean changeRole(int acc_id, int course_id, int role) {
        Connection conn = ConnectionBuilder.getConnection();
        String roleVal = "";
        switch (role) {
            case 1:
                roleVal = "Teacher";
                break;
            default:
                roleVal = "Student";
                break;
        }
        String sql = "update account_course set role=? where acc_id=? and course_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, roleVal);
            pstm.setInt(2, acc_id);
            pstm.setInt(3, course_id);
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    public static boolean checkOwner(int acc_id, int course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select role  from account_course where acc_id = ? and course_id = ?";
        PreparedStatement pstm;
        int result = 0;
        String role = "";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            pstm.setInt(2, course_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                role = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return role.equalsIgnoreCase("Teacher") ? true : false;
    }

    public static List<AccountCourse> getCourseByAccID(int acc_id) {
        List<AccountCourse> courseList = new ArrayList<AccountCourse>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from account_course where acc_id=?";
        PreparedStatement pstm;
        AccountCourse acc = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                acc = new AccountCourse();
                acc.setRole(rs.getString("role"));
                acc.setStatus(rs.getString("status"));
                Course c = Course.getCourseByID(rs.getInt("course_id"));
                acc.setCourse(c);
                courseList.add(acc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courseList;
    }

    @Override
    public String toString() {
        return "AccountCourse{" + "course=" + course + ", status=" + status + ", role=" + role + '}';
    }

}
