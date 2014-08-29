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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JenoVa
 */
public class Account {

    private int acc_id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private String profile_pic;
    private String account_type;
    private Timestamp register_date;
    private List<Announcement> announcement;
//    private List<AccountCourse> CourseList;
    private Map<Long, AccountCourse> CourseList = new HashMap<>();
    private List<Assignment> assignment;
    private List<UserScore> listStudentScore;

    public int getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(int acc_id) {
        this.acc_id = acc_id;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfile_pic() {
        return profile_pic;
    }

    public void setProfile_pic(String profile_pic) {
        this.profile_pic = profile_pic;
    }

    public String getAccount_type() {
        return account_type;
    }

    public void setAccount_type(String account_type) {
        this.account_type = account_type;
    }

    public List<Announcement> getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(List<Announcement> announcement) {
        this.announcement = announcement;
    }

//    public List<AccountCourse> getCourseList() {
//        return CourseList;
//    }
//
//    public void setCourseList(List<AccountCourse> CourseList) {
//        this.CourseList = CourseList;
//    }
    public Map getCourseList() {
        return CourseList;
    }

    public void setCourseList(Map CourseList) {
        this.CourseList = CourseList;
    }

    public List<Assignment> getAssignment() {
        return assignment;
    }

    public void setAssignment(List<Assignment> assignment) {
        this.assignment = assignment;
    }

    public List<UserScore> getListStudentScore() {
        return listStudentScore;
    }

    public void setListStudentScore(List<UserScore> listStudentScore) {
        this.listStudentScore = listStudentScore;
    }

    public Date getRegister_date() {
        return register_date;
    }

    public void setRegister_date(Timestamp register_date) {
        this.register_date = register_date;
    }

    public static Account login(String email, String pass) {
        Account acc = new Account();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from account where email = ? and password = ?";
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, email);
            pstm.setString(2, pass);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                int acc_id = rs.getInt("acc_id");
                acc.setAcc_id(acc_id);
                acc.setFirstname(rs.getString("firstname"));
                acc.setLastname(rs.getString("lastname"));
                acc.setEmail(rs.getString("email"));
                acc.setPassword(rs.getString("password"));
                acc.setAccount_type(rs.getString("account_type"));
                acc.setProfile_pic(rs.getString("profile_pic"));
                acc.setRegister_date(rs.getTimestamp("register_date"));
                acc.setAnnouncement(Announcement.viewAnnByAccID(acc_id));
                acc.setAssignment(Assignment.getAmByAccID(acc_id));
//                acc.setCourseList(AccountCourse.getCourseByAccID(acc_id));
                List<AccountCourse> CL = AccountCourse.getCourseByAccID(acc_id);
                for (AccountCourse accountCourse : CL) {
                    acc.CourseList.put((long) accountCourse.getCourse().getCourse_id(), accountCourse);
                }
                acc.setListStudentScore(UserScore.getUserScore(acc_id));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;

    }

    public static int register(Account a) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into account(firstname,lastname,email,password,profile_pic,account_type) values(?,?,?,?,?,?)";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, a.getFirstname());
            pstm.setString(2, a.getLastname());
            pstm.setString(3, a.getEmail());
            pstm.setString(4, a.getPassword());
            pstm.setString(5, a.getProfile_pic());
            pstm.setString(6, a.getAccount_type());
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static boolean isExistingEmail(String email) {
        String e = null;
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select email from account where email = ?";
        boolean result = false;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, email);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                e = rs.getString("email");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e == null ? false : true;
    }

    public static int edit(Account a) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update account set firstname=?,lastname=?,profile_pic=? where acc_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, a.getFirstname());
            pstm.setString(2, a.getLastname());
            pstm.setString(3, a.getProfile_pic());
            pstm.setInt(4, a.getAcc_id());
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static boolean changePassword(Account a) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update account set password=? where acc_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, a.getPassword());
            pstm.setInt(2, a.getAcc_id());
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    public static Account getNameByID(int acc_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select concat(`firstname`,' ',`lastname`) as fullname,profile_pic from account where acc_id = ? ";
        PreparedStatement pstm;
        Account ac = new Account();
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                ac.setFirstname(rs.getString(1));
                ac.setProfile_pic(rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ac;
    }

    public static Account getAccountByID(int acc_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from account where acc_id = ? ";
        PreparedStatement pstm;
        int result = 0;
        Account acc = new Account();
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                acc.setAcc_id(rs.getInt("acc_id"));
                acc.setFirstname(rs.getString("firstname"));
                acc.setLastname(rs.getString("lastname"));
                acc.setEmail(rs.getString("email"));
                acc.setPassword(rs.getString("password"));
                acc.setAccount_type(rs.getString("account_type"));
                acc.setProfile_pic(rs.getString("profile_pic"));
                acc.setRegister_date(rs.getTimestamp("register_date"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }

    public static List<Account> getNameByGIDandAmID(int g_id, int am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql1 = "select acc_id from group_member where g_id = ? and ass_id =? ";
        PreparedStatement pstm;
        int result = 0;
        List<Account> listAc = new ArrayList<>();
        Account acc = null;
        try {
            pstm = conn.prepareStatement(sql1);
            pstm.setInt(1, g_id);
            pstm.setInt(2, am_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                String sql2 = "select  concat(firstname,'  ',lastname) as fullname,profile_pic from account where acc_id in(" + rs.getString("acc_id") + ")";
                pstm = conn.prepareStatement(sql2);
                ResultSet rs2 = pstm.executeQuery();
                while (rs2.next()) {
                    acc = new Account();
                    acc.setFirstname(rs2.getString(1));
                    acc.setProfile_pic(rs2.getString(2));
                    listAc.add(acc);
                }
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listAc;
    }

    @Override
    public String toString() {
        return "Account{" + "acc_id=" + acc_id + ", firstname=" + firstname + ", lastname=" + lastname + ", email=" + email + ", password=" + password + ", profile_pic=" + profile_pic + ", account_type=" + account_type + ", register_date=" + register_date + ", announcement=" + announcement + ", CourseList=" + CourseList + ", assignment=" + assignment + ", listStudentScore=" + listStudentScore + '}';
    }

//    public AccountCourse getAc(String k){
//        return (AccountCourse)(getCourseList().get(Long.parseLong(k)));
//    }
}
