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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.Util;

/**
 *
 * @author JenoVa
 */
public class AccountCourse {

    private Course course;
    private String status;
    private String role;
    private Timestamp approved_date;

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

    public Timestamp getApproved_date() {
        return approved_date;
    }

    public void setApproved_date(Timestamp approved_date) {
        this.approved_date = approved_date;
    }

    public static int joinCourse(AccountCourse detail, int acc_id) {
        Connection conn = ConnectionBuilder.getConnection();
        int result = 0;
        if (!isExist(acc_id, detail.getCourse().getCourse_id())) {
            String sql = "insert into account_course(acc_id,course_id,status,role,approved_date) values(?,?,?,?,?)";
            PreparedStatement pstm;
            try {
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, acc_id);
                pstm.setInt(2, detail.getCourse().getCourse_id());
                pstm.setString(3, detail.getStatus());
                pstm.setString(4, detail.getRole());
                pstm.setTimestamp(5, detail.getApproved_date());
                result = pstm.executeUpdate();
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public static boolean approve(int acc_id, int course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update account_course set status=?,approved_date=current_timestamp where acc_id=? and course_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, "approved");
            pstm.setInt(2, acc_id);
            pstm.setInt(3, course_id);
            result = pstm.executeUpdate();
            conn.close();
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
            conn.close();
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
            conn.close();
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
                roleVal = "TH";
                break;
            default:
                roleVal = "ST";
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
            conn.close();
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
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return role.equalsIgnoreCase("Teacher") ? true : false;
    }

    public static List<AccountCourse> getCourseByAccID(int acc_id) {
        List<AccountCourse> courseList = new ArrayList<AccountCourse>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from account_course where acc_id=? AND status =  \"approved\"";
        PreparedStatement pstm;
        AccountCourse acc = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                acc = new AccountCourse();
                acc.setApproved_date(rs.getTimestamp("approved_date"));
                acc.setRole(rs.getString("role"));
                acc.setStatus(rs.getString("status"));
                Course c = Course.getCourseByID(rs.getInt("course_id"));
                acc.setCourse(c);
                courseList.add(acc);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courseList;
    }
    
    public static  Map<Long, AccountCourse> getCourseByAccIDMap(int acc_id) {
         Map<Long, AccountCourse> courseList = new HashMap<>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from account_course where acc_id=? AND status =  \"approved\"";
        PreparedStatement pstm;
        AccountCourse acc = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                acc = new AccountCourse();
                acc.setApproved_date(rs.getTimestamp("approved_date"));
                acc.setRole(rs.getString("role"));
                acc.setStatus(rs.getString("status"));
                Course c = Course.getCourseByID(rs.getInt("course_id"));
                acc.setCourse(c);
                courseList.put((long) c.getCourse_id(), acc);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return courseList;
    }

    public static Map<AccountCourse,Account> getMemberInCourseWithRole(int course_id) {
        Map<AccountCourse,Account> listAccount = new HashMap<>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from account_course where course_id=? AND status =  \"approved\"";
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Account acc = Account.getAccountByID(rs.getInt("acc_id"));
                AccountCourse acCourse = new AccountCourse();
                acCourse.setRole(rs.getString("role"));
                listAccount.put(acCourse, acc);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAccount;
    }
    
     public static List<Account> getMemberInCourse(int course_id) {
        List<Account> listAccount = new ArrayList<>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from account_course where course_id=? AND status =  \"approved\"";
        PreparedStatement pstm;
        Account acc = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                acc = Account.getAccountByID(rs.getInt("acc_id"));
                listAccount.add(acc);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listAccount;
    }

    public static List<Account> getWaitForApproveMemberInCourse(int course_id) {
        List<Account> listAccount = new ArrayList<>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from account_course where course_id=? AND status =  \"waiting\"";
        PreparedStatement pstm;
        Account acc = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                acc = Account.getAccountByID(rs.getInt("acc_id"));
                listAccount.add(acc);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAccount;
    }

    public static boolean isExist(int acc_id, int course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select acc_id from account_course where course_id=? and acc_id=?";
        boolean result = false;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            pstm.setInt(2, acc_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                result = true;
            } else {
                result = false;
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static String getApprovedTime(int acc_id, int course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select approved_date from account_course where course_id=? and acc_id=?";
        Timestamp time = null;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            pstm.setInt(2, acc_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                time = rs.getTimestamp(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        String timest="";
        if(time != null){
            timest = Util.formatTime(time+"");
        }
        return timest;
    }
    
    public static String getAccountRole(int acc_id, int course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select role from account_course where course_id=? and acc_id=?";
        String r = null;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            pstm.setInt(2, acc_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                r = rs.getString(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }
    
     public static List<Account> getTeacherCourse(int course_id,int ownid) {
        List<Account> listAccount = new ArrayList<>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select acc_id from account_course where course_id=? AND role =  \"TH\" AND status =  \"approved\" and acc_id !=?  order by acc_id";
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            pstm.setInt(2, ownid);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Account acc = Account.getAccountByID(rs.getInt("acc_id"));
                listAccount.add(acc);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAccount;
    }
     
     public static List<Account> getTeacherCourseWithOwn(int course_id) {
        List<Account> listAccount = new ArrayList<>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select acc_id from account_course where course_id=? AND role =  \"TH\" AND status =  \"approved\"  order by acc_id";
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Account acc = Account.getAccountByID(rs.getInt("acc_id"));
                listAccount.add(acc);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAccount;
    }
     
     public static List<Account> getStudentCourse(int course_id,int ownid) {
        List<Account> listAccount = new ArrayList<>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select acc_id from account_course where course_id=? AND role =  \"ST\" AND status =  \"approved\" and acc_id !=? order by acc_id";
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            pstm.setInt(2, ownid);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Account acc = Account.getAccountByID(rs.getInt("acc_id"));
                listAccount.add(acc);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAccount;
    }
     
     public static List<Integer> getStudentIdCourse(int course_id,int ownid) {
        List<Integer> listAccount = new ArrayList<>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select acc_id from account_course where course_id=? AND role =  \"ST\" AND status =  \"approved\" and acc_id !=? order by acc_id";
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            pstm.setInt(2, ownid);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                listAccount.add(rs.getInt("acc_id"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAccount;
    }
     
     public static boolean isTeacher(int course_id, int acc_id){
         String role = getAccountRole(acc_id, course_id);
         boolean result= false;
         if(role.equalsIgnoreCase("TH")){
             result=true;
         }
         return result;
     }

    @Override
    public String toString() {
        return "AccountCourse{" + "course=" + course + ", status=" + status + ", role=" + role + ", approved_date=" + approved_date + '}';
    }

}
