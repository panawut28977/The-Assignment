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
public class Question {
    private int q_id;
    private int ass_id;
    private String instruction;
    private int q_no;
    private String q_type;
    
    public int g(){
        return 1;
    };
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
    public static void add(Question q){
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
                if(q_type.equalsIgnoreCase("fillBlank")){
                    q = new FillBlank();
                    
                }else if(q_type.equalsIgnoreCase("matchWord") ){
                    q = new MatchWord();
                }else if(q_type.equalsIgnoreCase("tfQuestion")|| q_type.equalsIgnoreCase("multiple_choice")){
                    q = new MultipleChoice();
                }else if(q_type.equalsIgnoreCase("explain")){
                    q = new Explain(); 
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
    public static void addList(List<Question> qList){
        Connection conn = ConnectionBuilder.getConnection();
        String data = "";
        for (Question q : qList) {
            data += "(" + q.getAss_id() + "," + q.getInstruction() + "," + q.getQ_no() + "," + q.getQ_type() + "),";
        }
        data = data.substring(data.length() - 2, data.length() - 1);
        String sql = "insert into question(ass_id,instruction,q_no,q_type) values"+data;
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
