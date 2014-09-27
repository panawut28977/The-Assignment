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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JenoVa
 */
public class Announcement {

    private int an_id;
    private Account an_acc;
//    private Course course;
    private int course;
    private String title;
    private String content;
    private Timestamp announce_date;

    public int getAn_id() {
        return an_id;
    }

    public void setAn_id(int an_id) {
        this.an_id = an_id;
    }

    public Account getAn_acc() {
        return an_acc;
    }

    public void setAn_acc(Account an_acc) {
        this.an_acc = an_acc;
    }

    public int getCourse() {
        return course;
    }

    public void setCourse(int course) {
        this.course = course;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAnnounce_date() {
        return announce_date;
    }

    public void setAnnounce_date(Timestamp announce_date) {
        this.announce_date = announce_date;
    }

    public static List<Announcement> viewAnnByAccID(int acc_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select a.*  from announcement a "
                + "JOIN account_course ac "
                + "On a.course_id = ac.course_id "
                + "where ac.acc_id = ? AND status = 'approved' "
                + "order by announce_date desc";
        PreparedStatement pstm;
        List<Announcement> ann = new ArrayList<Announcement>();
        Announcement a = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                a = new Announcement();
                a.setAn_acc(Account.getAccountByID(rs.getInt("acc_id")));
                a.setCourse(rs.getInt("course_id"));
                a.setAn_id(rs.getInt("an_id"));
                a.setAnnounce_date(rs.getTimestamp("announce_date"));
                a.setContent(rs.getString("content"));
                a.setTitle(rs.getString("title"));
                ann.add(a);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ann;
    }

    public static int add(Announcement a) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into announcement(acc_id,course_id,title,content) values(?,?,?,?)";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, a.getAn_acc().getAcc_id());
            pstm.setInt(2, a.getCourse());
            pstm.setString(3, a.getTitle() + "");
            pstm.setString(4, a.getContent());
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static boolean remove(int an_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "delete from announcement where an_id  =? ";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, an_id);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    //update
    public static int update(Announcement a) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update announcement set title=?,content=? where an_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, a.getTitle());
            pstm.setString(2, a.getContent());
            pstm.setInt(3, a.getAn_id());
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    //viewAnnouncementByCourse
    public static List<Announcement> viewAnnByCourse(int course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select *  from announcement where course_id = ? order by announce_date desc";
        PreparedStatement pstm;
        List<Announcement> ann = new ArrayList<Announcement>();
        Announcement a = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                a = new Announcement();
                a.setAn_acc(Account.getAccountByID(rs.getInt("acc_id")));
                a.setCourse(rs.getInt("course_id"));
                a.setAn_id(rs.getInt("an_id"));
                a.setAnnounce_date(rs.getTimestamp("announce_date"));
                a.setContent(rs.getString("content"));
                a.setTitle(rs.getString("title"));
                ann.add(a);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ann;
    }

    //viewAnnouncementByCourse
    public static List<Announcement> viewAnnByCourseList(ArrayList<Long> course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        StringBuilder cIdList = new StringBuilder("(");
        for (Long id : course_id) {
            cIdList.append(id + ",");
        }
        cIdList.deleteCharAt(cIdList.length() - 1);
        cIdList.append(")");
        System.out.println(cIdList.toString());
        String sql = "select *  from announcement where course_id in " + cIdList.toString() + " order by announce_date desc";
        PreparedStatement pstm;
        List<Announcement> ann = new ArrayList<Announcement>();
        Announcement a = null;
        try {
            pstm = conn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                a = new Announcement();
                a.setAn_acc(Account.getAccountByID(rs.getInt("acc_id")));
                a.setCourse(rs.getInt("course_id"));
                a.setAn_id(rs.getInt("an_id"));
                a.setAnnounce_date(rs.getTimestamp("announce_date"));
                a.setContent(rs.getString("content"));
                a.setTitle(rs.getString("title"));
                ann.add(a);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ann;
    }

    @Override
    public String toString() {
        return "Announcement{" + "an_id=" + an_id + ", an_acc=" + an_acc + ", course=" + course + ", title=" + title + ", content=" + content + ", announce_date=" + announce_date + '}';
    }

}
