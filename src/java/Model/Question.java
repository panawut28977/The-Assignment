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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JenoVa
 */
public abstract class Question {

    private int q_id;
    private int ass_id;
    private String instruction;
    private int q_no;
    private String q_type;

    abstract public int add();

    abstract public String getQ_text();

    abstract public void setQ_text(String q_text);

    abstract public String getQ_keyword_check();

    abstract public void setQ_keyword_check(String q_keyword_check);

    abstract public double getScore();

    abstract public void setScore(double score);

    abstract public String getAnswer();

    abstract public void setAnswer(String answer);

    abstract public int getQ_start_index();

    abstract public void setQ_start_index(int q_start_index);

    abstract public int getQ_end_index();

    abstract public void setQ_end_index(int q_end_index);

    abstract public String getQ_answer();

    abstract public void setQ_answer(String q_answer);

    abstract public double getQ_score();

    abstract public void setQ_score(double q_score);

    abstract public String getQ_choice_list();

    abstract public void setQ_choice_list(String q_choice_list);

    abstract public String getQ_answer_list();

    abstract public void setQ_answer_list(String q_answer_list);

    public int getQ_id() {
        return q_id;
    }

    public void setQ_id(int q_id) {
        this.q_id = q_id;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public int getQ_no() {
        return q_no;
    }

    public void setQ_no(int q_no) {
        this.q_no = q_no;
    }

    public String getQ_type() {
        return q_type;
    }

    public void setQ_type(String q_type) {
        this.q_type = q_type;
    }

    public int getAss_id() {
        return ass_id;
    }

    public void setAss_id(int ass_id) {
        this.ass_id = ass_id;
    }
//    @interface 
//    public String getQ_text(){};

    //add(Question)
    public static void add(Question q) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into question(ass_id,instruction,q_no,q_type) values(?,?,?,?)";
        PreparedStatement pstm = null;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, q.getAss_id());
            pstm.setString(2, q.getInstruction());
            pstm.setInt(3, q.getQ_no());
            pstm.setString(4, q.getQ_type());
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //delete(q_id)
    public static boolean delete(int q_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "delete from question where q_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, q_id);
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    //getQuestion(q_id)
    public static Question getQuestion(int q_id) {
        Question q = null;
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from quesion q join fill_blank_list f on q.q_id = f.q_id "
                + "join explain_list e on q.q_id = e.q_id "
                + "join match_word_list m on q.q_id = m.q_id "
                + "join multiple_choice_list mul on q.q_id = mul.q_id "
                + "where q.q_id = ?";
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, q_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                String q_type = rs.getString("q_type");
                FillBlank fb = null;
                MatchWord mw = null;
                MultipleChoice mc = null;
                Explain ex = null;
                if (q_type.equalsIgnoreCase("fillBlank")) {
                    fb = new FillBlank();
                    fb.setQ_text(rs.getString("q_text"));
                    fb.setScore(rs.getDouble("score"));
                    fb.setAnswer(rs.getString("answer"));
                    fb.setQ_start_index(rs.getInt("q_start_index"));
                    fb.setQ_end_index(rs.getInt("q_end_index"));
                    q = fb;
                } else if (q_type.equalsIgnoreCase("matchWord")) {
                    mw = new MatchWord();
                    mw.setQ_text(rs.getString("q_text"));
                    mw.setQ_type(rs.getString("q_type"));
                    mw.setQ_choice_list(rs.getString("q_choice_list"));
                    mw.setQ_answer_list(rs.getString("q_answer_list"));
                    mw.setQ_score(rs.getDouble("q_score"));
                    q = mw;
                } else if (q_type.equalsIgnoreCase("tfQuestion") || q_type.equalsIgnoreCase("multiple_choice")) {
                    mc = new MultipleChoice();
                    mc.setQ_text(rs.getString("q_text"));
                    mc.setQ_answer(rs.getString("q_answer"));
                    mc.setQ_score(rs.getDouble("q_score"));
                    q = mc;
                } else if (q_type.equalsIgnoreCase("explain")) {
                    ex = new Explain();
                    ex.setQ_text(rs.getString("q_text"));
                    ex.setQ_keyword_check(rs.getString("q_keyword_check"));
                    q = ex;
                }
                q.setAss_id(rs.getInt("ass_id"));
                q.setInstruction(rs.getString("instruction"));
                q.setQ_id(rs.getInt("q_id"));
                q.setQ_no(rs.getInt("q_no"));
                q.setQ_type(rs.getString("q_type"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return q;
    }

    //addList(List<Question>) 
    public static void addList(List<Question> qList) {
        Connection conn = ConnectionBuilder.getConnection();
        String data = "";
        String q_type = null;
        FillBlank fb = null;
        MatchWord mw = null;
        MultipleChoice mc = null;
        Explain exp = null;
        for (Question q : qList) {
            q_type = q.getQ_type();
            data += "(" + q.getAss_id() + "," + q.getInstruction() + "," + q.getQ_no() + "," + q_type + "),";
            if (q_type.equalsIgnoreCase("fillBlank")) {
                fb = (FillBlank) q;
                fb.add();
            } else if (q_type.equalsIgnoreCase("matchWord")) {
                mw = (MatchWord) q;
                mw.add();
            } else if (q_type.equalsIgnoreCase("tfQuestion") || q_type.equalsIgnoreCase("multiple_choice")) {
                mc = (MultipleChoice) q;
                mc.add();
            } else if (q_type.equalsIgnoreCase("explain")) {
                exp = (Explain) q;
                exp.add();
            }
        }
        data = data.substring(data.length() - 2, data.length() - 1);
        String sql = "insert into question(ass_id,instruction,q_no,q_type) values" + data;
        PreparedStatement pstm = null;
        int result = 0;
        try {
            pstm = conn.prepareCall(sql);
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String toString() {
        return "Question{" + "q_id=" + q_id + ", ass_id=" + ass_id + ", instruction=" + instruction + ", q_no=" + q_no + ", q_type=" + q_type + '}';
    }

}
