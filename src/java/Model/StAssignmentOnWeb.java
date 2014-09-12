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
import java.sql.Statement;
import java.sql.Timestamp;
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
public class StAssignmentOnWeb {

    private int st_am_id;
    private int am_id;
    private int acc_id;
    private int g_id;
    private double score;
    private Date lasted_send_date;
    private Timestamp checked_time;
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

    public int getG_id() {
        return g_id;
    }

    public void setG_id(int g_id) {
        this.g_id = g_id;
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

    public Date getLasted_send_date() {
        return lasted_send_date;
    }

    public void setLasted_send_date(Date lasted_send_date) {
        this.lasted_send_date = lasted_send_date;
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

    public Timestamp getChecked_time() {
        return checked_time;
    }

    public void setChecked_time(Timestamp checked_time) {
        this.checked_time = checked_time;
    }

    public static double getScore(int st_am_id) {
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

    public static StAssignmentOnWeb getStAmInfo(int st_am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from student_assignment_on_web where st_ass_id = ?";
        PreparedStatement pstm;
        StAssignmentOnWeb stw = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, st_am_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                stw = new StAssignmentOnWeb();
                stw.setSt_am_id(rs.getInt("st_ass_id"));
                stw.setAm_id(rs.getInt("ass_id"));
                stw.setAcc_id(rs.getInt("acc_id"));
                stw.setG_id(rs.getInt("g_id"));
                stw.setScore(rs.getDouble("score"));
                stw.setLasted_send_date(rs.getDate("lasted_send_date"));
                stw.setChecked_time(rs.getTimestamp("checked_time"));
                stw.setComment(Comment.getCommentByStAmIDWeb(rs.getInt("st_ass_id")));
                stw.setAnwerQuestion(null);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentOnWeb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return stw;
    }

    public static int getStAmIdByAmIDAndGID(int am_id, int g_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select st_ass_id from student_assignment_on_web where ass_id = ? and g_id = ?";
        PreparedStatement pstm;
        int id = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            pstm.setInt(2, g_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                id = rs.getInt("st_ass_id");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

//    public static int getStAmIdByAmIDAndAccId(int am_id, int acc_id) {
//        Connection conn = ConnectionBuilder.getConnection();
//        String sql = "select st_ass_id from student_assignment_on_web where ass_id = ? and acc_id = ?";
//        PreparedStatement pstm;
//        int id = 0;
//        try {
//            pstm = conn.prepareStatement(sql);
//            pstm.setInt(1, am_id);
//            pstm.setInt(2, acc_id);
//            ResultSet rs = pstm.executeQuery();
//            while (rs.next()) {
//                id = rs.getInt("st_ass_id");
//            }
//            conn.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return id;
//    }

    public static double getScoreByAccIDAndAmID(int acc_id, int am_id) {
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

    public static StAssignmentOnWeb getStAmByAmIDAndAccId(int am_id, int acc_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from student_assignment_on_web where ass_id = ? and acc_id = ?";
        PreparedStatement pstm;
        StAssignmentOnWeb stw = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            pstm.setInt(2, acc_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                stw = new StAssignmentOnWeb();
                stw.setSt_am_id(rs.getInt("st_ass_id"));
                stw.setAm_id(am_id);
                stw.setAcc_id(rs.getInt("acc_id"));
                stw.setG_id(rs.getInt("g_id"));
                stw.setScore(rs.getDouble("score"));
                stw.setLasted_send_date(rs.getDate("lasted_send_date"));
                stw.setChecked_time(rs.getTimestamp("checked_time"));
//                stw.setComment(Comment.getCommentByStAmIDWeb(rs.getInt("st_ass_id")));
//                stw.setAnwerQuestion(null);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentOnWeb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return stw;
    }

    public static StAssignmentOnWeb getStAmByAmIDAndAccId(int am_id, int acc_id, boolean ingroup) {
        StAssignmentOnWeb stw = null;
        if (ingroup) {
            Connection conn = ConnectionBuilder.getConnection();
            String sql = "select * from group_member g where ass_id = ?";
            PreparedStatement pstm;
            try {
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, am_id);
                ResultSet rs = pstm.executeQuery();
                while (rs.next()) {
                    String accList[] = rs.getString("acc_id").split(",");
                    List<Integer> accl = new ArrayList<>();
                    for (String acc : accList) {
                        accl.add(Integer.parseInt(acc));
                    }
//                    System.out.println(accl.contains(acc_id));
                    if (accl.contains(acc_id)) {
//                        System.out.println("g_id:"+rs.getInt("g_id"));
                        stw = StAssignmentOnWeb.getStAmbyAmIDAndGID(am_id, rs.getInt("g_id"));
                        break;
                    }
                }
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(StAssignmentOnWeb.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return stw;
    }

//    public static int getStAmIdByAmIDAndAccId(int am_id, int acc_id, boolean ingroup) {
//        int id = 0;
//        if (ingroup) {
//            Connection conn = ConnectionBuilder.getConnection();
//            String sql = "select * from group_member g where ass_id = ?";
//            PreparedStatement pstm;
//            try {
//                pstm = conn.prepareStatement(sql);
//                pstm.setInt(1, am_id);
//                ResultSet rs = pstm.executeQuery();
//                while (rs.next()) {
//                    String accList[] = rs.getString("acc_id").split(",");
//                    List<Integer> accl = new ArrayList<>();
//                    for (String acc : accList) {
//                        accl.add(Integer.parseInt(acc));
//                    }
////                    System.out.println(accl.contains(acc_id));
//                    if (accl.contains(acc_id)) {
////                        System.out.println("g_id:"+rs.getInt("g_id"));
//                        id = StAssignmentOnWeb.getStAmIdByAmIDAndGID(am_id, rs.getInt("g_id"));
//                        break;
//                    }
//                }
//                conn.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//        return id;
//    }

    public static StAssignmentOnWeb getStAmbyAmIDAndGID(int am_id, int g_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from student_assignment_on_web where ass_id = ? and g_id = ?";
        PreparedStatement pstm;
        StAssignmentOnWeb stw = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            pstm.setInt(2, g_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                stw = new StAssignmentOnWeb();
                stw.setSt_am_id(rs.getInt("st_ass_id"));
                stw.setAm_id(am_id);
                stw.setAcc_id(rs.getInt("acc_id"));
                stw.setG_id(rs.getInt("g_id"));
                stw.setScore(rs.getDouble("score"));
                stw.setLasted_send_date(rs.getDate("lasted_send_date"));
                stw.setChecked_time(rs.getTimestamp("checked_time"));
//                stw.setComment(Comment.getCommentByStAmIDWeb(rs.getInt("st_ass_id")));
//                stw.setAnwerQuestion(null);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return stw;
    }

    public static int setAm(StAssignmentOnWeb StAssWeb) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql2 = "insert into student_assignment_on_web(ass_id,acc_id,g_id,score) values(?,?,?,?)";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql2, Statement.RETURN_GENERATED_KEYS);
            pstm.setInt(1, StAssWeb.getAm_id());
            pstm.setInt(2, StAssWeb.getAcc_id());
            pstm.setInt(3, StAssWeb.getG_id());
            pstm.setDouble(4, StAssWeb.getScore());
            pstm.executeUpdate();
            ResultSet generatedKeys = pstm.getGeneratedKeys();
            if (generatedKeys.next()) {
                result = generatedKeys.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentOnWeb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

//    public void setAm(StAssignmentOnWeb StAssWeb){
//        Connection conn = ConnectionBuilder.getConnection();
//        String sql = "insert into Student_assignment_on_web(st_ass_id,ass_id,acc_id,score,send_date) values(?,?,?,?,?)";
//        PreparedStatement pstm;
//        int result = 0;
//        try {
//            pstm = conn.prepareStatement(sql);
//            pstm.setInt(1, StAssWeb.get(0).getSt_am_id());
//            pstm.setInt(2, StAssWeb.get(1).getAm_id());
//            pstm.setInt(3, StAssWeb.get(2).getAcc_id());
//            pstm.setDouble(4, StAssWeb.get(4).getScore());
//            pstm.setDate(5, (java.sql.Date) StAssWeb.get(5).getSend_date());
//            result = pstm.executeUpdate();
//            conn.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(StAssignmentOnWeb.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    public static List<StAssignmentOnWeb> getStAmByAmId(int am_id) {
        List<StAssignmentOnWeb> stfList = new ArrayList<>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from student_assignment_on_web where ass_id = ?";
        PreparedStatement pstm;
        int result = 0;
        StAssignmentOnWeb s = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                s = new StAssignmentOnWeb();
                int st_ass_id = rs.getInt("st_ass_id");
                s.setAm_id(rs.getInt("ass_id"));
                s.setAcc_id(rs.getInt("acc_id"));
                s.setG_id(rs.getInt("g_id"));
                s.setSt_am_id(st_ass_id);
                s.setScore(rs.getDouble("score"));
                s.setLasted_send_date(rs.getDate("lasted_send_date"));
                s.setChecked_time(rs.getTimestamp("checked_time"));
                stfList.add(s);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return stfList;
    }

    public static int updateLastedSend(StAssignmentOnWeb a) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update student_assignment_on_web set lasted_send_date=? where st_ass_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            pstm.setString(1, df.format(a.getLasted_send_date()));
            pstm.setInt(2, a.getSt_am_id());
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static int updateScore(StAssignmentOnWeb a) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update student_assignment_on_web set score=?,checked_time=current_time where st_ass_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            pstm.setDouble(1, a.getScore());
            pstm.setInt(2, a.getSt_am_id());
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static boolean deleteByAm_id(int am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "delete from student_assignment_on_web where ass_id = ?";
        PreparedStatement pstm;
        int result = 0;
        try { 
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    @Override
    public String toString() {
        return "StAssignmentOnWeb{" + "st_am_id=" + st_am_id + ", am_id=" + am_id + ", acc_id=" + acc_id + ", g_id=" + g_id + ", score=" + score + ", lasted_send_date=" + lasted_send_date + ", checked_time=" + checked_time + ", member=" + member + ", comment=" + comment + ", anwerQuestion=" + anwerQuestion + '}';
    }

}
