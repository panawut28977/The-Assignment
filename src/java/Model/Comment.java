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
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JenoVa
 */
public class Comment {

    private int comment_id;
    private Account acc;
    private String text;
    private Date comment_date;

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public Account getAcc() {
        return acc;
    }

    public void setAcc_id(Account acc) {
        this.acc = acc;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getComment_date() {
        return comment_date;
    }

    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
    }

    //add(Comment c,int am_id)
    public static boolean add(Comment c, int am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "";
        PreparedStatement pstm;
        sql = "insert into comment(acc_id,ass_id,text) values(?,?,?)";
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, c.getAcc().getAcc_id());
            pstm.setInt(2, am_id);
            pstm.setString(3, c.getText());
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    //addToStComment(Comment c,int st_ass_id,String am_type)
    public static boolean addToStComment(Comment c, int st_ass_id, String am_type) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "";
        PreparedStatement pstm;
        sql = "insert into comment_student_assignment(acc_id,st_ass_id,text,am_type) values(?,?,?,?)";
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, c.getAcc().getAcc_id());
            pstm.setInt(2, st_ass_id);
            pstm.setString(3, c.getText());
            pstm.setString(4, am_type);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    //delete(int comment_id)
    public static boolean delete(int comment_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "delete from comment where comment_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, comment_id);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    //deleteFromStComment(int comment_id)
    public static boolean deleteFromStComment(int comment_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "delete from comment_student_assignment where comment_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, comment_id);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    //getCommentByAmID(Assignment a)
    public static List<Comment> getCommentByAmID(int am_id) {
        return getComment(am_id, 0);
    }

    //getCommentByStAmIDWeb(StAssignmentOnWeb stweb)
    public static List<Comment> getCommentByStAmIDWeb(int st_am_id) {
        return getComment(st_am_id, 1);
    }

    //getCommentByStAmIDFile(StAssignmentFile stfile)
    public static List<Comment> getCommentByStAmIDFile(int st_am_id) {
        return getComment(st_am_id, 2);
    }

    //getCommentByAmID(Assignment a)
    public static List<Comment> getComment(int am_id, int dbIndex) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "";
        if (dbIndex == 1) {
            sql = "select * from comment_student_assignment where st_ass_id = ? and am_type = 'web'";
        } else if (dbIndex == 2) {
            sql = "select * from comment_student_assignment where st_ass_id = ? and am_type = 'file'";
        } else {
            sql = "select * from comment where ass_id = ? ";
        }
        PreparedStatement pstm;
        int result = 0;
        List<Comment> cList = new ArrayList<>();
        Comment c = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                c = new Comment();
                c.setComment_id(rs.getInt("comment_id"));
                c.setAcc_id(Account.getAccountByID(rs.getInt("acc_id")));
                c.setText(rs.getString("text"));
                c.setComment_date(rs.getDate("comment_date"));
                cList.add(c);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cList;
    }

    @Override
    public String toString() {
        return "Comment{" + "comment_id=" + comment_id + ", acc_id=" + acc + ", text=" + text + ", comment_date=" + comment_date + '}';
    }

}
