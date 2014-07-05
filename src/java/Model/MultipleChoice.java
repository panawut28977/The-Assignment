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
public class MultipleChoice extends Question {
    private String q_text;
    private String q_type;
    private String q_choice_list;
    private String q_answer_list;
    private double q_score;

    @Override
    public String getQ_text() {
        return q_text;
    }

    @Override
    public void setQ_text(String q_text) {
        this.q_text = q_text;
    }
    
    public String getQ_choice_list() {
        return q_choice_list;
    }

    public void setQ_choice_list(String q_choice_list) {
        this.q_choice_list = q_choice_list;
    }

    public String getQ_answer_list() {
        return q_answer_list;
    }

    public void setQ_answer_list(String q_answer_list) {
        this.q_answer_list = q_answer_list;
    }

    public double getQ_score() {
        return q_score;
    }

    public void setQ_score(double q_score) {
        this.q_score = q_score;
    }

    public int add() {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into multiple_choice_list(q_text,q_type,q_choice_list,q_answer_list,q_score) values(?,?,?,?,?)";
        PreparedStatement pstm = null;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, this.q_text);
            pstm.setString(2, this.q_type);
            pstm.setString(3, this.q_choice_list);
            pstm.setString(4, this.q_answer_list);
            pstm.setDouble(5, this.q_score);
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    @Override
    public String toString() {
        return "MultipleChoice{" + "q_type=" + q_type + ", q_choice_list=" + q_choice_list + ", q_answer_list=" + q_answer_list + ", q_score=" + q_score + '}';
    }

    // <editor-fold defaultstate="collapsed" desc=" Method that is not support in this class ">
    
    @Override
    public String getQ_keyword_check() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setQ_keyword_check(String q_keyword_check) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public double getScore() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setScore(double score) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getAnswer() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setAnswer(String answer) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int getQ_start_index() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setQ_start_index(int q_start_index) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int getQ_end_index() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setQ_end_index(int q_end_index) {
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

// </editor-fold>
}
