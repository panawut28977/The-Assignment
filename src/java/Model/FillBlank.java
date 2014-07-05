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

    private String q_text;
    private double score;
    private String answer;
    private int q_start_index;
    private int q_end_index;

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
        String sql = "insert into fill_blank_list(q_text,score,answer,q_start_index,q_end_inde) values(?,?,?,?,?)";
        PreparedStatement pstm = null;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, this.q_text);
            pstm.setDouble(2, this.score);
            pstm.setString(3, this.answer);
            pstm.setInt(4, this.q_start_index);
            pstm.setInt(5, this.q_end_index);
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    @Override
    public String toString() {
        return "FillBlank{" + "q_text=" + q_text + ", score=" + score + ", answer=" + answer + ", q_start_index=" + q_start_index + ", q_end_index=" + q_end_index + '}';
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
    //</editor-fold>

}
