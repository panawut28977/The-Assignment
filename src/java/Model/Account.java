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
public class Account {

    private int acc_id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private String profile_pic;
    private String account_type;
    private Date register_date;
    private List<Announcement> announcement;
    private List<AccountCourse> CourseList;
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

    public List<AccountCourse> getCourseList() {
        return CourseList;
    }

    public void setCourseList(List<AccountCourse> CourseList) {
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

    public void setRegister_date(Date register_date) {
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
                acc.setAcc_id(rs.getInt("acc_id"));
                acc.setFirstname(rs.getString("firstname"));
                acc.setLastname(rs.getString("lastname"));
                acc.setEmail(rs.getString("email"));
                acc.setPassword(rs.getString("password"));
                acc.setAccount_type(rs.getString("account_type"));
                acc.setProfile_pic(rs.getString("profile_pic"));
                acc.setRegister_date(rs.getDate("register_date"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;

    }

    public static int register(Account a) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into account(firstname,lastname,email,password,profile_pic,account_type,register_date) values(?,?,?,?,?,?,current_date)";
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
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
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
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    public static String getNameByID(int acc_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select firstname || ' ' || lastname from account where acc_id = ? ";
        PreparedStatement pstm;
        int result = 0;
        String fullname = "";
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                fullname = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fullname;
    }

    @Override
    public String toString() {
        return "Account{" + "acc_id=" + acc_id + ", firstname=" + firstname + ", lastname=" + lastname + ", email=" + email + ", password=" + password + ", profile_pic=" + profile_pic + ", account_type=" + account_type + ", register_date=" + register_date + ", announcement=" + announcement + ", CourseList=" + CourseList + ", assignment=" + assignment + ", listStudentScore=" + listStudentScore + '}';
    }

}
