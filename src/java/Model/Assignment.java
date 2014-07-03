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
    //getAmQuestionByAmID(int am_id)
        //checkAmStatus(int am_id) เดียวใช้ get ass_type ออกไปเช็คเอาเอง
    
    //createAmInfo(Assignment ass)
    public static int createAmInfo(Assignment ass) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into assignment(course_id,name,description,ass_type,total_member,due_date,ass_extension) values(?,?,?,?,?,?,?)";
        PreparedStatement pstm = null;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, ass.getCourse_id());
            pstm.setString(2, ass.getName());
            pstm.setString(3, ass.getDescription());
            pstm.setString(4, ass.getAss_type());
            pstm.setInt(5, ass.getTotal_member());
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            pstm.setString(6, df.format(ass.getDue_date()));
            pstm.setString(7, ass.getAss_extension());
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
    public static List<Assignment> getAmByAccID(int acc_id) {
        List<Assignment> assList = new ArrayList<Assignment>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select ass.ass_id,ass.course_id,ass.name,ass.description,ass.ass_type,ass.total_member,ass.due_date,ass.ass_extension,ass.path_file,ass.create_date from account a "
                + "join account_course ac on a.acc_id = ac.acc_id "
                + "join assignment ass on ac.course_id = ass.course_id "
                + "where a.acc_id = ? AND ac.status =  \"approved\"";
        PreparedStatement pstm;
        Assignment am = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
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
                assList.add(am);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return assList;
    }
    //isSend(int acc_id,int st_am_id)
    public static boolean isSend(int acc_id,int am_id){
        boolean result = false;
        Date send_date = null;
        Connection conn = ConnectionBuilder.getConnection();
        String sql1 = "select send_date from student_assignment_file saf join assignment a on saf.ass_id = a.ass_id where saf.acc_id = ? and saf.ass_id = ? union"+
                       " select send_date from student_assignment_on_web saow join assignment a on saow.ass_id = a.ass_id where saow.acc_id = ? and saow.ass_id = ?";
        PreparedStatement pstm;
         try {
            pstm = conn.prepareStatement(sql1);
            pstm.setInt(1, acc_id);
            pstm.setInt(2, am_id);
            pstm.setInt(3, acc_id);
            pstm.setInt(4, am_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                send_date = rs.getDate(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (send_date==null?false:true);
    }
    
    
    //uploadAmFile(String path_file,int am_id)
     public static int uploadAmFile(String path_file,int am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update assignment set path_file=? where ass_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, path_file);
            pstm.setInt(2, am_id);
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    @Override
    public String toString() {
        return "Assignment{" + "am_id=" + am_id + ", course_id=" + course_id + ", name=" + name + ", description=" + description + ", ass_type=" + ass_type + ", total_member=" + total_member + ", due_date=" + due_date + ", ass_extension=" + ass_extension + ", create_date=" + create_date + ", path_file=" + path_file + ", comment=" + comment + ", questionList=" + questionList + '}';
    }
    
}
