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
import org.eclipse.jdt.internal.compiler.ast.ExplicitConstructorCall;

/**
 *
 * @author JenoVa
 */
public class MatchWord extends Question {

    private int q_order;
    private String q_title;
    private String q_text;
    private String q_answer;
    private double q_score;

    @Override
    public int getQ_order() {
        return q_order;
    }

    @Override
    public void setQ_order(int q_order) {
        this.q_order = q_order;
    }

    public String getQ_title() {
        return q_title;
    }

    public void setQ_title(String q_title) {
        this.q_title = q_title;
    }

    public String getQ_text() {
        return q_text;
    }

    public void setQ_text(String q_text) {
        this.q_text = q_text;
    }

    public String getQ_answer() {
        return q_answer;
    }

    public void setQ_answer(String q_answer) {
        this.q_answer = q_answer;
    }

    public double getQ_score() {
        return q_score;
    }

    public void setQ_score(double q_score) {
        this.q_score = q_score;
    }

    public int add() {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into match_word_list(q_id,q_order,q_title,q_text,q_answer,q_score) values(?,?,?,?,?,?)";
        PreparedStatement pstm = null;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, super.getQ_id());
            pstm.setInt(2, this.q_order);
            pstm.setString(3, this.q_title);
            pstm.setString(4, this.q_text);
            pstm.setString(5, this.q_answer);
            pstm.setDouble(6, this.q_score);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public int update() {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update match_word_list set q_order=?,q_title=?,q_text=?,q_answer=?,q_score=? where q_id=? and q_order=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, this.q_order);
            pstm.setString(2, this.q_title);
            pstm.setString(3, this.q_text);
            pstm.setString(4, this.q_answer);
            pstm.setDouble(5, this.q_score);
            pstm.setInt(6, super.getQ_id());
            pstm.setInt(7, this.q_order);
            result = pstm.executeUpdate();
            conn.close();
//            System.out.println(pstm.toString());
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    @Override
    public String toString() {
        return "MatchWord{" + "q_order=" + q_order + ", q_title=" + q_title + ", q_text=" + q_text + ", q_answer=" + q_answer + ", q_score=" + q_score + '}';
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
    public String getQ_category() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setQ_category(String q_category) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

// </editor-fold>
}
