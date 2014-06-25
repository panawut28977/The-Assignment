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
public class Assignment {

    private int am_id;
    private int course_id;
    private String name;
    private String description;
    private String ass_type;
    private int total_member;
    private Date due_date;
    private String ass_extension;
    private String create_date;
    private String path_file;
    private List<Comment> comment;
    private List<Question> questionList;

    public int getAm_id() {
        return am_id;
    }

    public void setAm_id(int am_id) {
        this.am_id = am_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAss_type() {
        return ass_type;
    }

    public void setAss_type(String ass_type) {
        this.ass_type = ass_type;
    }

    public int getTotal_member() {
        return total_member;
    }

    public void setTotal_member(int total_member) {
        this.total_member = total_member;
    }

    public Date getDue_date() {
        return due_date;
    }

    public void setDue_date(Date due_date) {
        this.due_date = due_date;
    }

    public String getAss_extension() {
        return ass_extension;
    }

    public void setAss_extension(String ass_extension) {
        this.ass_extension = ass_extension;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public String getPath_file() {
        return path_file;
    }

    public void setPath_file(String path_file) {
        this.path_file = path_file;
    }

    public List<Comment> getComment() {
        return comment;
    }

    public void setComment(List<Comment> comment) {
        this.comment = comment;
    }

    public List<Question> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(List<Question> questionList) {
        this.questionList = questionList;
    }

    //viewAssignmentSchedule(int acc_id) อาจไม่ต้องมีเพราะดึง Am ออกมามันก็มีค่าวันที่ติดมาอยู่แล้ว
    //getAmByAmID(int am_id)
    //getAmQuestionByAmID(int am_id)
    //checkAmStatus(int am_id)
    //isSend(int acc_id,int st_am_id)
    //uploadAmFile(String path_file,int am_id)
    //createAmInfo(Assignment ass)
    public static int createAmInfo(Assignment ass) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into assignment(course_id,name,description,ass_type,total_member,due_date) values(?,?,?,?,?,?)";
        PreparedStatement pstm = null;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, ass.getCourse_id());
            pstm.setString(2, ass.getName());
            pstm.setString(3, ass.getDescription());
            pstm.setString(4, ass.getAss_type());
            pstm.setInt(5, ass.getTotal_member());
            pstm.setString(6, ass.getDue_date() + "");
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    //deleteAm(int am_id)
    public static boolean deleteAm(int am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "delete from assignment where ass_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    //getAmByCourseID(int course_id)
    public static List<Assignment> getAmByCourseID(int course_id) {
        List<Assignment> AmList = new ArrayList<Assignment>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from assignment where course_id=?";
        PreparedStatement pstm;
        Assignment am = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                am = new Assignment();
                am.setAm_id(rs.getInt("ass_id"));
                am.setCourse_id(rs.getInt("course_id"));
                am.setName(rs.getString("name"));
                am.setDescription(rs.getString("description"));
                am.setAss_type(rs.getString("ass_type"));
                am.setTotal_member(rs.getInt("total_member"));
                am.setAss_extension(rs.getString("ass_extension"));
                am.setComment(null);
                if (am.getAss_type() == "File") {
                    am.setPath_file(rs.getString("path_file"));
                } else {
                    am.setQuestionList(null);
                }
                AmList.add(am);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return AmList;
    }

    //getAmByAmID(int am_id) 
    public static Assignment getAmByAmID(int am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from assignment where ass_id=?";
        PreparedStatement pstm;
        Assignment am = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                am = new Assignment();
                am.setAm_id(rs.getInt("ass_id"));
                am.setCourse_id(rs.getInt("course_id"));
                am.setName(rs.getString("name"));
                am.setDescription(rs.getString("description"));
                am.setAss_type(rs.getString("ass_type"));
                am.setTotal_member(rs.getInt("total_member"));
                am.setAss_extension(rs.getString("ass_extension"));
                am.setComment(null);
                if (am.getAss_type() == "File") {
                    am.setPath_file(rs.getString("path_file"));
                } else {
                    am.setQuestionList(null);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return am;
    }

    //getAmByAccID(int acc_id)
    public static Assignment getAmByAccID(int acc_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select ass.ass_id,ass.course_id,ass.name,ass.description,ass.ass_type,ass.total_member,ass.due_date,ass.ass_extension,ass.path_file,ass.create_date from account a"
                + "join account_course ac on a.acc_id = ac.acc_id "
                + "join assignment ass on ac.course_id = ass.course_id"
                + "where a.acc_id = ? AND ac.status =  \"approved\"";
        PreparedStatement pstm;
        Assignment am = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                am = new Assignment();
                am.setAm_id(rs.getInt("ass_id"));
                am.setCourse_id(rs.getInt("course_id"));
                am.setName(rs.getString("name"));
                am.setDescription(rs.getString("description"));
                am.setAss_type(rs.getString("ass_type"));
                am.setTotal_member(rs.getInt("total_member"));
                am.setAss_extension(rs.getString("ass_extension"));
                am.setComment(null);
                if (am.getAss_type() == "File") {
                    am.setPath_file(rs.getString("path_file"));
                } else {
                    am.setQuestionList(null);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return am;
    }
}
