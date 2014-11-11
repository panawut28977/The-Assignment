/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import com.google.gson.Gson;
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
public class UserScore {
    private String fullname;
    private Assignment am;
    private int am_id;
    private String am_name;
    private double full_mark;
    private String ass_type;
    private StAssignmentFile stf;
    private StAssignmentOnWeb stof;

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Assignment getAm() {
        return am;
    }

    public void setAm(Assignment am) {
        this.am = am;
    }
    
    public double getFull_mark() {
        return full_mark;
    }

    public void setFull_mark(double full_mark) {
        this.full_mark = full_mark;
    }

    public int getAm_id() {
        return am_id;
    }

    public void setAm_id(int am_id) {
        this.am_id = am_id;
    }

    public String getAm_name() {
        return am_name;
    }

    public void setAm_name(String am_name) {
        this.am_name = am_name;
    }

    public String getAss_type() {
        return ass_type;
    }

    public void setAss_type(String ass_type) {
        this.ass_type = ass_type;
    }

    public StAssignmentFile getStf() {
        return stf;
    }

    public void setStf(StAssignmentFile stf) {
        this.stf = stf;
    }

    public StAssignmentOnWeb getStof() {
        return stof;
    }

    public void setStof(StAssignmentOnWeb stof) {
        this.stof = stof;
    }
    
    //setUserScore(UserScore) เอาไว้ทำไรจำไม่ได้ละ แต่ไม่น่าจำเป็นละ
    //getUserScore(List<int> acc_id)
//    public static List<UserScore> getUserScore(int acc_id) {
//        List<UserScore> uScoreList = new ArrayList<UserScore>();
//        Connection conn = ConnectionBuilder.getConnection();
//        String sql = "select  f.ass_id,f.score,w.ass_id,w.score from student_assignment_file f,student_assignment_on_web w where f.acc_id = ? and w.acc_id=?";
//        PreparedStatement pstm;
//        UserScore uScore = null;
//        try {
//            pstm = conn.prepareStatement(sql);
//            pstm.setInt(1, acc_id);
//            pstm.setInt(2, acc_id);
//            ResultSet rs = pstm.executeQuery();
//            while (rs.next()) {
//                uScore = new UserScore();
//                uScore.setAm_id(rs.getInt("ass_id"));
//                //ยังไม่ได้ set course name;
//                uScore.setScore(rs.getDouble("score"));
//                uScoreList.add(uScore);
//            }
//            conn.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return uScoreList;
//    }
    @Override
    public String toString() {
        return "UserScore{" + "fullname=" + fullname + ", am=" + am + ", am_id=" + am_id + ", am_name=" + am_name + ", full_mark=" + full_mark + ", ass_type=" + ass_type + ", stf=" + stf + ", stof=" + stof + '}';
    }

}
