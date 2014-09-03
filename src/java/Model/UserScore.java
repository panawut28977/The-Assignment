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
    private Assignment assignment;
    private double score;
    private double full_mark;

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public double getFull_mark() {
        return full_mark;
    }

    public void setFull_mark(double full_mark) {
        this.full_mark = full_mark;
    }

    public Assignment getAssignment() {
        return assignment;
    }

    public void setAssignment(Assignment assignment) {
        this.assignment = assignment;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    //setUserScore(UserScore) เอาไว้ทำไรจำไม่ได้ละ แต่ไม่น่าจำเป็นละ
    //getUserScore(List<int> acc_id)
    public static List<UserScore> getUserScore(int acc_id) {
        List<UserScore> uScoreList = new ArrayList<UserScore>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select  f.ass_id,f.score,w.ass_id,w.score from student_assignment_file f,student_assignment_on_web w where f.acc_id = ? and w.acc_id=?";
        PreparedStatement pstm;
        UserScore uScore = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            pstm.setInt(2, acc_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                uScore = new UserScore();
                uScore.setAssignment(Assignment.getAmByAmID(rs.getInt("ass_id")));
                uScore.setScore(rs.getDouble("score"));
                uScoreList.add(uScore);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return uScoreList;
    }

    @Override
    public String toString() {
        return "UserScore{" + "fullname=" + fullname + ", assignment=" + assignment + ", score=" + score + ", full_mark=" + full_mark + '}';

    }
}
