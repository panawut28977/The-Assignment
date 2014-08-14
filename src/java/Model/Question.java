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

    abstract public String getQ_title();

    abstract public void setQ_title(String q_title);

    abstract public String getQ_category();

    abstract public void setQ_category(String q_category);

    abstract public int getQ_order();

    abstract public void setQ_order(int q_order);

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
        String sql = "insert into question(q_id,ass_id,instruction,q_no,q_type) values(?,?,?,?,?) ON DUPLICATE KEY UPDATE q_id = ?";
        PreparedStatement pstm = null;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, q.getQ_id());
            pstm.setInt(2, q.getAss_id());
            pstm.setString(3, q.getInstruction());
            pstm.setInt(4, q.getQ_no());
            pstm.setString(5, q.getQ_type());
            pstm.setInt(6, q.getQ_id());
            result = pstm.executeUpdate();

            String q_type = q.getQ_type();
            FillBlank fb = null;
            MatchWord mw = null;
            MultipleChoice mc = null;
            Explain exp = null;
            if (q_type.equalsIgnoreCase("fillBlank")) {
                fb = (FillBlank) q;
                fb.add();
            } else if (q_type.equalsIgnoreCase("matchWord")) {
                mw = (MatchWord) q;
                mw.add();
            } else if (q_type.equalsIgnoreCase("tfQuestion") || q_type.equalsIgnoreCase("multipleChoice")) {
                mc = (MultipleChoice) q;
                mc.add();
            } else if (q_type.equalsIgnoreCase("explain")) {
                exp = (Explain) q;
                exp.add();
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        int q_no = -1;
        for (Question q : qList) {
            q_type = q.getQ_type();
            if (q_no != q.getQ_no()) {
                q_no = q.getQ_no();
                data += "(" + q.getAss_id() + ",'" + q.getInstruction() + "'," + q.getQ_no() + ",'" + q_type + "'),";
            }
        }
        data = data.substring(0, data.length() - 1);
        String sql = "insert into question(ass_id,instruction,q_no,q_type) values" + data;
        PreparedStatement pstm = null;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (Question q : qList) {
            if (q.getQ_type().equalsIgnoreCase("fillBlank")) {
                fb = (FillBlank) q;
                fb.setQ_id(getQIdbyAmIdAndQNo(fb.getAss_id(), fb.getQ_no()));
                fb.add();
            } else if (q.getQ_type().equalsIgnoreCase("matchWord")) {
                mw = (MatchWord) q;
                mw.setQ_id(getQIdbyAmIdAndQNo(mw.getAss_id(), mw.getQ_no()));
                mw.add();
            } else if (q.getQ_type().equalsIgnoreCase("tfQuestion") || q.getQ_type().equalsIgnoreCase("multiple_choice")) {
                mc = (MultipleChoice) q;
                mc.setQ_id(getQIdbyAmIdAndQNo(mc.getAss_id(), mc.getQ_no()));
//                System.out.println(mc);
                mc.add();
            } else if (q.getQ_type().equalsIgnoreCase("explain")) {
                exp = (Explain) q;
                exp.setQ_id(getQIdbyAmIdAndQNo(exp.getAss_id(), exp.getQ_no()));
//                System.out.println(exp);
                exp.add();
            }
        }
    }

    //delete(q_id)
    public static boolean delete(int[] q_id) {
        Connection conn = ConnectionBuilder.getConnection();
        StringBuilder sql = new StringBuilder("delete from question where q_id in(");
        for (int i = 0; i < q_id.length; i++) {
            sql.append(q_id[i] + ",");
        }
        sql.replace(sql.length()-1, sql.length()-1, ")");
        System.out.println(sql);
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql.toString());
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }
    public static boolean delete(String[] q_id) {
        Connection conn = ConnectionBuilder.getConnection();
        StringBuilder sql = new StringBuilder("delete from question where q_id in(");
        for (int i = 0; i < q_id.length; i++) {
            sql.append(q_id[i] + ",");
        }
        sql.deleteCharAt(sql.length()-1);
        sql.append(")");
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql.toString());
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    public static List<Integer> getListQId(int am_id) {
        List<Integer> idList = new ArrayList<Integer>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select q_id from Question where ass_id = ?";
        PreparedStatement pstm = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                idList.add(rs.getInt(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Question.class.getName()).log(Level.SEVERE, null, ex);
        }
        return idList;
    }

    //getQuestion(q_id)
    public static List<Question> getListQuestion(List<Integer> q_id) {
        List<Question> qList = new ArrayList<Question>();
        Question q = null;
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from question q "
                + "left join explain_list e on q.q_id = e.q_id "
                + "left join fill_blank_list f on  q.q_id=f.q_id "
                + "left join match_word_list m on q.q_id=m.q_id "
                + "left join multiple_choice_list mul on  q.q_id = mul.q_id "
                + "where q.q_id in ";
        StringBuilder qIdList = new StringBuilder("(");
        for (int id : q_id) {
            qIdList.append(id + ",");
        }

        qIdList.deleteCharAt(qIdList.length() - 1).append(")");
        sql += qIdList.toString() + " order by q.q_no";
//        System.out.println(sql);
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                String q_type = rs.getString("q_type");
                FillBlank fb = null;
                MatchWord mw = null;
                MultipleChoice mc = null;
                Explain ex = null;
                if (q_type.equalsIgnoreCase("explain")) {
                    ex = new Explain();
                    ex.setQ_text(rs.getString(7));
                    ex.setQ_keyword_check(rs.getString(8));
                    q = ex;
                } else if (q_type.equalsIgnoreCase("fillBlank")) {
                    fb = new FillBlank();
                    fb.setQ_order(rs.getInt(10));
                    fb.setQ_text(rs.getString(11));
                    fb.setScore(rs.getDouble(12));
                    fb.setAnswer(rs.getString(13));
                    fb.setQ_start_index(rs.getInt(14));
                    fb.setQ_end_index(rs.getInt(15));
                    q = fb;
                } else if (q_type.equalsIgnoreCase("matchWord")) {
                    mw = new MatchWord();
                    mw.setQ_order(rs.getInt(17));
                    mw.setQ_title(rs.getString(18));
                    mw.setQ_text(rs.getString(19));
                    mw.setQ_answer(rs.getString(20));
                    mw.setQ_score(rs.getDouble(21));
                    q = mw;
                } else if (q_type.equalsIgnoreCase("tfQuestion") || q_type.equalsIgnoreCase("multiple_choice")) {
                    mc = new MultipleChoice();
                    mc.setQ_text(rs.getString(23));
                    mc.setQ_category(rs.getString(24));
                    mc.setQ_choice_list(rs.getString(25));
                    mc.setQ_answer_list(rs.getString(26));
                    mc.setQ_score(rs.getDouble(27));
                    q = mc;
                }
                q.setQ_id(rs.getInt(1));
                q.setAss_id(rs.getInt(2));
                q.setInstruction(rs.getString(3));
                q.setQ_no(rs.getInt(4));
                q.setQ_type(rs.getString(5));
                qList.add(q);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return qList;
    }

    public static int getLastId() {
        int lastId = 0;
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select max(q_id) from question";
        PreparedStatement pstm = null;
        try {
            pstm = conn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                lastId = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lastId;
    }

    public static int update(Question q) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update question set instruction=?,q_no=? where q_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, q.getInstruction());
            pstm.setInt(2, q.getQ_no());
            pstm.setInt(3, q.getQ_id());
            result = pstm.executeUpdate();

            String q_type = q.getQ_type();
            FillBlank fb = null;
            MatchWord mw = null;
            MultipleChoice mc = null;
            Explain exp = null;
            if (q_type.equalsIgnoreCase("fillBlank")) {
                fb = (FillBlank) q;
                fb.delete();
                fb.add();
            } else if (q_type.equalsIgnoreCase("matchWord")) {
                mw = (MatchWord) q;
                mw.update();
            } else if (q_type.equalsIgnoreCase("tfQuestion") || q_type.equalsIgnoreCase("multipleChoice")) {
                mc = (MultipleChoice) q;
                mc.update();
            } else if (q_type.equalsIgnoreCase("explain")) {
                exp = (Explain) q;
                exp.update();
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static int getQIdbyAmIdAndQNo(int am_id, int q_no) {
        int QId = 0;
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select q_id from question where ass_id = ? and q_no = ?";
        PreparedStatement pstm = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            pstm.setInt(2, q_no);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                QId = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return QId;
    }

    @Override
    public String toString() {
        return "Question{" + "q_id=" + q_id + ", ass_id=" + ass_id + ", instruction=" + instruction + ", q_no=" + q_no + ", q_type=" + q_type + '}';
    }

}
