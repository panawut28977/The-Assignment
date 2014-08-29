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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JenoVa
 */
public class StAssignmentFile {

    private int st_am_id;
    private int am_id;
    private int acc_id;
    private int g_id;
    private int list_id;
    private double score;
    private Date lasted_send_date;
    private double similar_score;
//    private String member;
    private List<Comment> comment;

    public int getSt_am_id() {
        return st_am_id;
    }

    public void setSt_am_id(int st_am_id) {
        this.st_am_id = st_am_id;
    }

    public int getAm_id() {
        return am_id;
    }

    public void setAm_id(int am_id) {
        this.am_id = am_id;
    }

    public int getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(int acc_id) {
        this.acc_id = acc_id;
    }

    public int getG_id() {
        return g_id;
    }

    public void setG_id(int g_id) {
        this.g_id = g_id;
    }

    public int getList_id() {
        return list_id;
    }

    public void setList_id(int list_id) {
        this.list_id = list_id;
    }

    public Date getLasted_send_date() {
        return lasted_send_date;
    }

    public void setLasted_send_date(Date lasted_send_date) {
        this.lasted_send_date = lasted_send_date;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public double getSimilar_score() {
        return similar_score;
    }

    public void setSimilar_score(double similar_score) {
        this.similar_score = similar_score;
    }

//    public String getMember() {
//        return member;
//    }
//
//    public void setMember(String member) {
//        this.member = member;
//    }
    public List<Comment> getComment() {
        return comment;
    }

    public void setComment(List<Comment> comment) {
        this.comment = comment;
    }

    public static double getScore(int st_am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select score from student_assignment_file where st_ass_id = ? ";
        PreparedStatement pstm;
        double result = 0;

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, st_am_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                result = rs.getDouble(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static StAssignmentFile getStAm(int st_am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from student_assignment_file where st_ass_id = ? ";
        PreparedStatement pstm;
        int result = 0;
        StAssignmentFile s = new StAssignmentFile();
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, st_am_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                int st_ass_id = rs.getInt("st_ass_id");
                s.setAm_id(rs.getInt("ass_id"));
                s.setAcc_id(rs.getInt("acc_id"));
                s.setSt_am_id(st_am_id);
                s.setList_id(rs.getInt("list_id"));
                s.setScore(rs.getDouble("score"));
                s.setLasted_send_date(rs.getDate("lasted_send_date"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public static List<StAssignmentFile> getStAmByAmId(int am_id) {
        List<StAssignmentFile> stfList = new ArrayList<>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from student_assignment_file where ass_id = ?";
        PreparedStatement pstm;
        int result = 0;
        StAssignmentFile s = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                s = new StAssignmentFile();
                int st_ass_id = rs.getInt("st_ass_id");
                s.setAm_id(rs.getInt("ass_id"));
                s.setAcc_id(rs.getInt("acc_id"));
                s.setG_id(rs.getInt("g_id"));
                s.setSt_am_id(st_ass_id);
                s.setList_id(rs.getInt("list_id"));
                s.setScore(rs.getDouble("score"));
                s.setLasted_send_date(rs.getDate("lasted_send_date"));
                stfList.add(s);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return stfList;
    }

    public static StAssignmentFile getStAmBbyAmIDAndGID(int am_id, int g_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from student_assignment_file where ass_id = ? and g_id = ?";
        PreparedStatement pstm;
        StAssignmentFile saf = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            pstm.setInt(2, g_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                saf = new StAssignmentFile();
                saf.setAcc_id(rs.getInt("acc_id"));
                saf.setAm_id(am_id);
                saf.setSt_am_id(rs.getInt("st_ass_id"));
                saf.setList_id(rs.getInt("list_id"));
                saf.setScore(rs.getDouble("score"));
                saf.setLasted_send_date(rs.getDate("lasted_send_date"));
                saf.setComment(Comment.getCommentByStAmIDFile(rs.getInt("st_ass_id")));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return saf;
    }

    public static StAssignmentFile getStAmBbyAmIDAndAccId(int am_id, int acc_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from student_assignment_file where ass_id = ? and acc_id = ?";
        PreparedStatement pstm;
        StAssignmentFile saf = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            pstm.setInt(2, acc_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                saf = new StAssignmentFile();
                saf.setAcc_id(rs.getInt("acc_id"));
                saf.setAm_id(am_id);
                saf.setSt_am_id(rs.getInt("st_ass_id"));
                saf.setList_id(rs.getInt("list_id"));
                saf.setScore(rs.getDouble("score"));
                saf.setLasted_send_date(rs.getDate("lasted_send_date"));
                saf.setComment(Comment.getCommentByStAmIDFile(rs.getInt("st_ass_id")));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return saf;
    }

    public static double getScoreByAccIDAmID(int am_id, int acc_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select score from student_assignment_file where ass_id = ? and acc_id = ?";
        PreparedStatement pstm;
        double result = 0;

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            pstm.setInt(2, acc_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                result = rs.getDouble(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static int getLastedListId() {
        Connection conn = ConnectionBuilder.getConnection();
        int list_id = 1;
        String sql1 = "select max(list_id) from Student_assignment_file";
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql1);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                list_id = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentOnWeb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list_id;
    }

    public static int setAm(StAssignmentFile StAssFile) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql2 = "insert into Student_assignment_file(ass_id,acc_id,g_id,list_id,score) values(?,?,?,?,?)";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql2, Statement.RETURN_GENERATED_KEYS);
            pstm.setInt(1, StAssFile.getAm_id());
            pstm.setInt(2, StAssFile.getAcc_id());
            pstm.setInt(3, StAssFile.getG_id());
            pstm.setInt(4, StAssFile.getList_id());
            pstm.setDouble(5, StAssFile.getScore());
            pstm.executeUpdate();
            ResultSet generatedKeys = pstm.getGeneratedKeys();
            if (generatedKeys.next()) {
                result = generatedKeys.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentOnWeb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static int updateLastedSend(StAssignmentFile a) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update student_assignment_file set lasted_send_date=? where st_ass_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            pstm.setString(1, df.format(a.getLasted_send_date()));
            pstm.setInt(2, a.getSt_am_id());
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    @Override
    public String toString() {
        return "StAssignmentFile{" + "st_am_id=" + st_am_id + ", am_id=" + am_id + ", acc_id=" + acc_id + ", g_id=" + g_id + ", list_id=" + list_id + ", score=" + score + ", lasted_send_date=" + lasted_send_date + ", similar_score=" + similar_score + ", comment=" + comment + '}';
    }
}
