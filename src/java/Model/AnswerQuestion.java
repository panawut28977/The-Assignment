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

    private int st_am_id;
    private int q_id;
    private int q_order;
    private int acc_id;
    private int g_id;
    private String answer;
    private double score;
    private String hilightKeyword;

    public int getSt_am_id() {
        return st_am_id;
    }

    public void setSt_am_id(int st_am_id) {
        this.st_am_id = st_am_id;
    }

    public int getQ_id() {
        return q_id;
    }

    public void setQ_id(int q_id) {
        this.q_id = q_id;
    }

    public int getQ_order() {
        return q_order;
    }

    public void setQ_order(int q_order) {
        this.q_order = q_order;
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

    //getStAMQuestion
    public static List<AnswerQuestion> getStAMQuestion(int st_am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select *  from student_answer_question where st_ass_id = ?";
        PreparedStatement pstm;
        List<AnswerQuestion> ans = new ArrayList<AnswerQuestion>();
        AnswerQuestion a = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, st_am_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                a = new AnswerQuestion();
                a.setSt_am_id(rs.getInt("st_ass_id"));
                a.setQ_id(rs.getInt("q_id"));
                a.setQ_order(rs.getInt("q_order"));
                a.setAnswer(rs.getString("answer"));
                a.setScore(rs.getDouble("score"));
                ans.add(a);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ans;
    }

    public static ArrayList<AnswerQuestion> getStAMQuestion(int st_am_id, int q_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select *  from student_answer_question where st_ass_id = ? and q_id = ?";
        PreparedStatement pstm;
        ArrayList<AnswerQuestion> ans = new ArrayList<AnswerQuestion>();
        AnswerQuestion a = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, st_am_id);
            pstm.setInt(2, q_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                a = new AnswerQuestion();
                a.setSt_am_id(rs.getInt("st_ass_id"));
                a.setQ_id(rs.getInt("q_id"));
                a.setQ_order(rs.getInt("q_order"));
                a.setAnswer(rs.getString("answer"));
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
    public static int[] setAnswerList(List<AnswerQuestion> ansList, int acc_id, int g_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String data = "";
//        for (AnswerQuestion answerQuestion : ansList) {
//            data += "(" + answerQuestion.getSt_am_id() + "," + answerQuestion.getQ_id() + "," + answerQuestion.getQ_order() + "," + acc_id + "," + g_id + ",'" + answerQuestion.getAnswer() + "'," + answerQuestion.getScore() + "),";
//        }
//        data = data.substring(0, data.length() - 1);
//        String sql = "insert into student_answer_question(st_ass_id,q_id,q_order,acc_id,g_id,answer,score) values" + data;
        String sql = "insert into student_answer_question(st_ass_id,q_id,q_order,acc_id,g_id,answer,score) values(?,?,?,?,?,?,?)";
        System.out.println(sql);
        PreparedStatement pstm;
        int result[] = null;
        try {
            pstm = conn.prepareStatement(sql);
            for (AnswerQuestion answerQuestion : ansList) {
                pstm.setInt(1, answerQuestion.getSt_am_id());
                pstm.setInt(2, answerQuestion.getQ_id());
                pstm.setInt(3, answerQuestion.getQ_order());
                pstm.setInt(4, acc_id);
                pstm.setInt(5, g_id);
                pstm.setString(6, answerQuestion.getAnswer());
                pstm.setDouble(7, answerQuestion.getScore());
                pstm.addBatch();
            }
            result = pstm.executeBatch();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    //updateScore
    public static int updateScore(AnswerQuestion a) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update student_answer_question set score=? where st_ass_id=? and q_id=? and q_order=? and acc_id=? and g_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setDouble(1, a.getScore());
//            System.out.println("score:"+a.getScore());
            pstm.setInt(2, a.getSt_am_id());
            pstm.setInt(3, a.getQ_id());
//            System.out.println(a.getQ_order());
            pstm.setInt(4, a.getQ_order());
            pstm.setInt(5, a.getAcc_id());
            pstm.setInt(6, a.getG_id());
            result = pstm.executeUpdate();
//            System.out.println("result:"+result);
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static int updateAns(AnswerQuestion a) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update student_answer_question set answer=? where st_ass_id=? and q_id=? and q_order=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, a.getAnswer());
            pstm.setInt(2, a.getSt_am_id());
            pstm.setInt(3, a.getQ_id());
            pstm.setInt(4, a.getQ_order());
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    //updateAllScore
//    public static int updateScore(List<AnswerQuestion> a, int st_ass_id) {
//        Connection conn = ConnectionBuilder.getConnection();
//        String sql = "";
//        PreparedStatement pstm;
//        int result = 0;
//        return result;
//    }
    //hilightKeyword
    @Override
    public String toString() {
        return "AnswerQuestion{" + "st_am_id=" + st_am_id + ", q_id=" + q_id + ", q_order=" + q_order + ", acc_id=" + acc_id + ", g_id=" + g_id + ", answer=" + answer + ", score=" + score + ", hilightKeyword=" + hilightKeyword + '}';
    }

}
