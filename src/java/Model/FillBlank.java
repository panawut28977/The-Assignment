/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JenoVa
 */
public class FillBlank extends Question {

    private int q_order;
    private String q_text;
    private double score;
    private String answer;
    private int q_start_index;
    private int q_end_index;

    @Override
    public int getQ_order() {
        return q_order;
    }

    @Override
    public void setQ_order(int q_order) {
        this.q_order = q_order;
    }

    @Override
    public String getQ_text() {
        return q_text;
    }

    @Override
    public void setQ_text(String q_text) {
        this.q_text = q_text;
    }

    @Override
    public double getScore() {
        return score;
    }

    @Override
    public void setScore(double score) {
        this.score = score;
    }

    @Override
    public String getAnswer() {
        return answer;
    }

    @Override
    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public int getQ_start_index() {
        return q_start_index;
    }

    public void setQ_start_index(int q_start_index) {
        this.q_start_index = q_start_index;
    }

    @Override
    public int getQ_end_index() {
        return q_end_index;
    }

    @Override
    public void setQ_end_index(int q_end_index) {
        this.q_end_index = q_end_index;
    }

    public int add() {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into fill_blank_list(q_id,q_order,q_text,score,answer,q_start_index,q_end_index) values(?,?,?,?,?,?,?)";
        PreparedStatement pstm = null;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, super.getQ_id());
            pstm.setInt(2, this.q_order);
            pstm.setString(3, this.q_text);
            pstm.setDouble(4, this.score);
            pstm.setString(5, this.answer);
            pstm.setInt(6, this.q_start_index);
            pstm.setInt(7, this.q_end_index);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    //delete(q_id)
    public boolean delete() {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "delete from fill_blank_list where q_id=? and q_order=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, super.getQ_id());
            pstm.setInt(2, this.q_order);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    //คำถามแบบ fill blank ไม่มี update เพราะว่าการจะอัพเดตคำถามคำตอบมันต้อง delete แล้ว add ใหม่
//    public int update() {
//        Connection conn = ConnectionBuilder.getConnection();
//        String sql = "update fill_blank_list set q_order=?,q_text=?,answer=? where course_id=?";
//        PreparedStatement pstm;
//        int result = 0;
//        try {
//            pstm = conn.prepareStatement(sql);
//
//            result = pstm.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return result;
//    }
    @Override
    public String toString() {
        return "FillBlank{" + "q_order=" + q_order + ", q_text=" + q_text + ", score=" + score + ", answer=" + answer + ", q_start_index=" + q_start_index + ", q_end_index=" + q_end_index + '}';
    }

    //<editor-fold defaultstate="collapsed" desc="Method that is not support in this class">
    @Override
    public String getQ_keyword_check() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setQ_keyword_check(String q_keyword_check) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getQ_answer() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setQ_answer(String q_answer) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public double getQ_score() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setQ_score(double q_score) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getQ_choice_list() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setQ_choice_list(String q_choice_list) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getQ_answer_list() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setQ_answer_list(String q_answer_list) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getQ_title() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setQ_title(String q_title) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getQ_category() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setQ_category(String q_category) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    //</editor-fold>
}
