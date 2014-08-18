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
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JenoVa
 */
public class StAssignmentOnWeb {
    private int st_am_id;
    private int am_id;
    private int acc_id;
    private double score;
    private Date send_date;
    private String member;
    private List<Comment> comment;
    private List<AnswerQuestion> anwerQuestion;

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

    public String getMember() {
        return member;
    }

    public void setMember(String member) {
        this.member = member;
    }

    public List<Comment> getComment() {
        return comment;
    }

    public void setComment(List<Comment> comment) {
        this.comment = comment;
    }

    public List<AnswerQuestion> getAnwerQuestion() {
        return anwerQuestion;
    }

    public void setAnwerQuestion(List<AnswerQuestion> anwerQuestion) {
        this.anwerQuestion = anwerQuestion;
    }
    
    public double getScore(int st_am_id){
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select score from student_assignment_on_web where st_ass_id = ? ";
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
            Logger.getLogger(StAssignmentOnWeb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public List<StAssignmentOnWeb> getStAmInfo(int st_am_id){
        List<StAssignmentOnWeb> StAssInfo = new ArrayList<StAssignmentOnWeb>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from student_assignment_on_web where st_ass_id = ? order by send_date desc fetch first 1 rows";
        PreparedStatement pstm;
        StAssignmentOnWeb saw = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, st_am_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                saw = new StAssignmentOnWeb();
                saw.setAcc_id(rs.getInt("acc_id"));
                saw.setAm_id(rs.getInt("ass_id"));
                saw.setSt_am_id(st_am_id);
                saw.setSend_date(rs.getDate("send_date"));
                saw.setScore(rs.getDouble("score"));
                StAssInfo.add(saw);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentOnWeb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return StAssInfo;
    }
    
    public double getScoreByAccIDAndAmID(int acc_id , int am_id){
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select score from student_assignment_on_web where ass_id = ? and acc_id = ?";
        PreparedStatement pstm;
        double result = 0;
        
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            pstm.setInt(2, am_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                result = rs.getDouble(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentOnWeb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public void sendAm(List<StAssignmentOnWeb> StAssWeb){
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into Student_assignment_on_web(st_ass_id,ass_id,acc_id,score,send_date) values(?,?,?,?,?)";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, StAssWeb.get(0).getSt_am_id());
            pstm.setInt(2, StAssWeb.get(1).getAm_id());
            pstm.setInt(3, StAssWeb.get(2).getAcc_id());
            pstm.setDouble(4, StAssWeb.get(4).getScore());
            pstm.setDate(5, (java.sql.Date) StAssWeb.get(5).getSend_date());
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentOnWeb.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void autoChecking(int st_am_id){
        
    }
}
