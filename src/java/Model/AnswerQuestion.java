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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JenoVa
 */
public class AnswerQuestion {

    private int q_id;
    private double score;
    private String hilightKeyword;
    private String answer;

    public int getQ_id() {
        return q_id;
    }

    public void setQ_id(int q_id) {
        this.q_id = q_id;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public String getHilightKeyword() {
        return hilightKeyword;
    }

    public void setHilightKeyword(String hilightKeyword) {
        this.hilightKeyword = hilightKeyword;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "AnswerQuestion{" + "q_id=" + q_id + ", score=" + score + ", hilightKeyword=" + hilightKeyword + ", answer=" + answer + '}';
    }

    //getStAMQuestion
    public static List<AnswerQuestion> getStAMQuestion(int st_am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select *  from student_assignment_on_web_question where st_ass_id = ?";
        PreparedStatement pstm;
        List<AnswerQuestion> ans = new ArrayList<AnswerQuestion>();
        AnswerQuestion a = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, st_am_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                a = new AnswerQuestion();
                a.setAnswer(rs.getString("answer"));
                a.setQ_id(rs.getInt("q_id"));
                a.setScore(rs.getDouble("score"));
                ans.add(a);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ans;
    }

    //setAmQuestionList
    public static int setAmQuestionList(List<AnswerQuestion> ansList, int st_ass_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String data = "";
        for (AnswerQuestion answerQuestion : ansList) {
            data += "(" + st_ass_id + "," + answerQuestion.getQ_id() + "," + answerQuestion.getAnswer() + "," + answerQuestion.getScore() + "),";
        }
        data = data.substring(data.length() - 2, data.length() - 1);
        String sql = "insert into student_assignment_on_web_question(st_ass_id,q_id,answer,score) values" + data;
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    //updateScore
    public static int updateScore(AnswerQuestion a, int st_ass_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update student_assignment_on_web_question set score=? where st_ass_id=? and q_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setDouble(1, a.getScore());
            pstm.setInt(2, st_ass_id);
            pstm.setInt(3, a.getQ_id());
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    //updateAllScore
    public static int updateScore(List<AnswerQuestion> a, int st_ass_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "";
        PreparedStatement pstm;
        int result = 0;
        return result;
    }
    //hilightKeyword
}
