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
public class UserScore {
    private Assignment assignment;
    private double score;

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
    public static List<UserScore> getUserScore(int acc_id){
        List<UserScore> uScoreList = new ArrayList<UserScore>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select  ass_id,score from student_assignment_file,student_assignment_on_web where acc_id = ?";
        PreparedStatement pstm;
        UserScore uScore = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                uScore = new UserScore();
                uScore.setAssignment(Assignment.getAmByAmID(rs.getInt("ass_id")));
                uScore.setScore(rs.getDouble("score"));
                uScoreList.add(uScore);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return uScoreList;
    }
    
}
