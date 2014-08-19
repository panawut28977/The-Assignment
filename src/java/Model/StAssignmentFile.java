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
    private String path_file;
    private double score;
    private Date send_date;
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

    public String getPath_file() {
        return path_file;
    }

    public void setPath_file(String path_file) {
        this.path_file = path_file;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public Date getSend_date() {
        return send_date;
    }

    public void setSend_date(Date send_date) {
        this.send_date = send_date;
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
                int st_ass_id = rs.getInt("st_am_id");
                s.setAm_id(rs.getInt("ass_id"));
                s.setAcc_id(rs.getInt("acc_id"));
                s.setSt_am_id(st_am_id);
                s.setPath_file(rs.getString("path_file"));
                s.setScore(rs.getDouble("score"));
                s.setSend_date(rs.getDate("send_date"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return s;
    }

    public static List<StAssignmentFile> getStAmBbyAmID(int am_id) {
        List<StAssignmentFile> StAssList = new ArrayList<StAssignmentFile>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from student_assignment_file where ass_id = ? order by send_date desc fetch first 1 rows";
        PreparedStatement pstm;
        StAssignmentFile saf = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                saf = new StAssignmentFile();
                saf.setAcc_id(rs.getInt("acc_id"));
                saf.setAm_id(am_id);
                saf.setSt_am_id(rs.getInt("st_ass_id"));
                saf.setPath_file(rs.getString("path_file"));
                saf.setScore(rs.getDouble("score"));
                saf.setSend_date(rs.getDate("send_date"));
                StAssList.add(saf);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return StAssList;
    }

    public static List<StAssignmentFile> getStAmAllVersion(int st_am_id) {
        List<StAssignmentFile> StAssList = new ArrayList<StAssignmentFile>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select score from student_assignment_file where st_ass_id = ? ";
        PreparedStatement pstm;
        StAssignmentFile saf = null;

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, st_am_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                saf = new StAssignmentFile();
                saf.setAcc_id(rs.getInt("acc_id"));
                saf.setAm_id(st_am_id);
                saf.setSt_am_id(rs.getInt("st_ass_id"));
                saf.setPath_file(rs.getString("path_file"));
                saf.setScore(rs.getDouble("score"));
                saf.setSend_date(rs.getDate("send_date"));
                StAssList.add(saf);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return StAssList;
    }
    
    
    public static StAssignmentFile getStAmBbyAmIDAndGID(int am_id,int g_id) {
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
                saf.setPath_file(rs.getString("path_file"));
                saf.setScore(rs.getDouble("score"));
                saf.setSend_date(rs.getDate("send_date"));
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

    public static void setAm(StAssignmentFile StAssFile) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into Student_assignment_file(ass_id,acc_id,g_id,path_file,score) values(?,?,?,?,?)";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, StAssFile.getAm_id());
            pstm.setInt(2, StAssFile.getAcc_id());
            pstm.setInt(3, StAssFile.getG_id());
            pstm.setString(4, StAssFile.getPath_file());
            pstm.setDouble(5, StAssFile.getScore());
            pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentOnWeb.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String toString() {
        return "StAssignmentFile{" + "st_am_id=" + st_am_id + ", am_id=" + am_id + ", acc_id=" + acc_id + ", g_id=" + g_id + ", path_file=" + path_file + ", score=" + score + ", send_date=" + send_date + ", similar_score=" + similar_score + ", comment=" + comment + '}';
    }
    
    

}
