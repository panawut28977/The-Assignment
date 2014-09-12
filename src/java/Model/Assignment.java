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
import static org.apache.coyote.http11.Constants.a;

/**
 *
 * @author JenoVa
 */
public class Assignment {

    private int am_id;
    private Course course;
    private String name;
    private String description;
    private String ass_type;
    private int total_member;
    private Date due_date;
    private Date late_date;
    private String ass_extension;
    private Timestamp create_date;
    private String path_file;
    private String title_assignment_onweb;
    private double fully_mark;
    private List<Comment> comment;
    private List<Question> questionList;

    public int getAm_id() {
        return am_id;
    }

    public void setAm_id(int am_id) {
        this.am_id = am_id;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
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

    public Date getLate_date() {
        return late_date;
    }

    public void setLate_date(Date late_date) {
        this.late_date = late_date;
    }

    public String getAss_extension() {
        return ass_extension;
    }

    public void setAss_extension(String ass_extension) {
        this.ass_extension = ass_extension;
    }

    public Timestamp getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Timestamp create_date) {
        this.create_date = create_date;
    }

    public String getPath_file() {
        return path_file;
    }

    public void setPath_file(String path_file) {
        this.path_file = path_file;
    }

    public String getTitle_assignment_onweb() {
        return title_assignment_onweb;
    }

    public void setTitle_assignment_onweb(String title_assignment_onweb) {
        this.title_assignment_onweb = title_assignment_onweb;
    }

    public double getFully_mark() {
        return fully_mark;
    }

    public void setFully_mark(double fully_mark) {
        this.fully_mark = fully_mark;
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
    //createAmInfo(Assignment ass)
    public static int createAmInfo(Assignment ass) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into assignment(course_id,name,description,ass_type,total_member,due_date,late_date,title_assignment_onweb) values(?,?,?,?,?,?,?,?)";
        if (ass.getAss_type().equalsIgnoreCase("file")) {
            sql = "insert into assignment(course_id,name,description,ass_type,total_member,due_date,late_date,path_file,fully_mark) values(?,?,?,?,?,?,?,?,?)";
        }
        PreparedStatement pstm = null;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstm.setInt(1, ass.getCourse().getCourse_id());
            pstm.setString(2, ass.getName());
            pstm.setString(3, ass.getDescription());
            pstm.setString(4, ass.getAss_type());
            pstm.setInt(5, ass.getTotal_member());
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            if (ass.getDue_date() != null) {
                pstm.setString(6, df.format(ass.getDue_date()));
            } else {
                pstm.setString(6, null);
            }
//            pstm.setTimestamp(6, ass.getDue_date());
            pstm.setString(7, df.format(ass.getLate_date()));
            if (ass.getAss_type().equalsIgnoreCase("file")) {
                pstm.setString(8, ass.getPath_file());
                pstm.setDouble(9, ass.getFully_mark());
            } else {
                pstm.setString(8, ass.getTitle_assignment_onweb());
            }
            pstm.executeUpdate();
            ResultSet key = pstm.getGeneratedKeys();
            if (key.next()) {
                result = key.getInt(1);
            }
            conn.close();
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
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    //getAmByCourseID(int course_id)
    public static List<Assignment> getAmByCourseID(int course_id, boolean setCourse) {
        List<Assignment> AmList = new ArrayList<Assignment>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from assignment where course_id=? order by create_date desc";
        PreparedStatement pstm;
        Assignment am = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, course_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                am = new Assignment();
                am.setAm_id(rs.getInt("ass_id"));
                if (setCourse) {
                    am.setCourse(Course.getCourseByID(rs.getInt("course_id")));
                } else {
                    am.setCourse(null);
                }
                am.setName(rs.getString("name"));
                am.setDescription(rs.getString("description"));
                am.setAss_type(rs.getString("ass_type"));
                am.setTotal_member(rs.getInt("total_member"));
                am.setAss_extension(rs.getString("ass_extension"));
                am.setCreate_date(rs.getTimestamp("create_date"));
                am.setDue_date(rs.getDate("due_date"));
                am.setLate_date(rs.getDate("late_date"));
                am.setFully_mark(rs.getDouble("fully_mark"));
                am.setComment(Comment.getCommentByAmID(am.getAm_id()));
                if (am.getAss_type().equalsIgnoreCase("file")) {
                    am.setPath_file(rs.getString("path_file"));
                } else {
                    am.setQuestionList(null);
                }
                AmList.add(am);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return AmList;
    }

    public static List<Assignment> getAmByCourseIDNoSetCourse(int course_id) {
        return getAmByCourseID(course_id, false);
    }

    /*public static Assignment getCourseNameByAmID(int am_id){
     Connection conn = ConnectionBuilder.getConnection();
     String sql = "select name from course c and assignment a where c.course_id = a.course_id AND ass_id = ?";
     PreparedStatement pstm;
     Assignment am = null;
     try{
     pstm = conn.prepareStatement(sql);
     pstm.setInt(1, am_id);
     ResultSet rs = pstm.executeQuery();
     if (rs.next()) {
     am = new Assignment();
     am.setAm_id(rs.getInt("ass_id"));
     am.setCourse(Course.getCourseByID(rs.getInt("course_id")));
     am.setName(rs.getString("name"));
     am.setDescription(rs.getString("description"));
     am.setAss_type(rs.getString("ass_type"));
     am.setTotal_member(rs.getInt("total_member"));
     am.setAss_extension(rs.getString("ass_extension"));
     am.setCreate_date(rs.getTimestamp("create_date"));
     am.setDue_date(rs.getDate("due_date"));
     am.setComment(Comment.getCommentByAmID(am_id));
     am.setFully_mark(rs.getDouble("fully_mark"));
     if (am.getAss_type().equalsIgnoreCase("file")) {
     am.setPath_file(rs.getString("path_file"));
     } else {
     am.setTitle_assignment_onweb(rs.getString("title_assignment_onweb"));
     am.setQuestionList(Question.getListQuestion(Question.getListQId(am.getAm_id())));
     }
     }
     conn.close();
     } catch (SQLException ex) {
     Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
     }
     return am;
     }*/
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
                am.setCourse(Course.getCourseByID(rs.getInt("course_id")));
                am.setName(rs.getString("name"));
                am.setDescription(rs.getString("description"));
                am.setAss_type(rs.getString("ass_type"));
                am.setTotal_member(rs.getInt("total_member"));
                am.setAss_extension(rs.getString("ass_extension"));
                am.setCreate_date(rs.getTimestamp("create_date"));
                am.setDue_date(rs.getDate("due_date"));
                am.setLate_date(rs.getDate("late_date"));
                am.setComment(Comment.getCommentByAmID(am_id));
                am.setFully_mark(rs.getDouble("fully_mark"));
                if (am.getAss_type().equalsIgnoreCase("file")) {
                    am.setPath_file(rs.getString("path_file"));
                } else {
                    am.setTitle_assignment_onweb(rs.getString("title_assignment_onweb"));
                    am.setQuestionList(Question.getListQuestion(Question.getListQId(am.getAm_id())));
                }
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return am;
    }

    //getAmByAmID(int am_id) 
    public static Assignment getAmInfoByAmID(int am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select name,fully_mark,ass_type from assignment where ass_id=?";
        PreparedStatement pstm;
        Assignment am = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                am = new Assignment();
                am.setName(rs.getString("name"));
                am.setAss_type(rs.getString("ass_type"));
                am.setFully_mark(rs.getDouble("fully_mark"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return am;
    }
    
    public static Assignment getAmTimeByAmID(int am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select due_date,late_date from assignment where ass_id=?";
        PreparedStatement pstm;
        Assignment am = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                am = new Assignment();
                am.setDue_date(rs.getDate("due_date"));
                am.setLate_date(rs.getDate("late_date"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return am;
    }

    public static Assignment getAmByAmID(String am_id) {
        return getAmByAmID(Integer.parseInt(am_id));
    }

    //getAmByAccID2(int acc_id)
    public static List<Assignment> getAmByAccID2(int acc_id) {
        List<Assignment> assList = new ArrayList<Assignment>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select ass.ass_id,ass.course_id,ass.name,ass.description,ass.ass_type,ass.total_member,ass.due_date,ass.ass_extension,ass.path_file,ass.create_date,ass.fully_mark,ass.late_date from account a "
                + "join account_course ac on a.acc_id = ac.acc_id "
                + "join assignment ass on ac.course_id = ass.course_id "
                + "where a.acc_id = ? AND ac.status =  \"approved\" AND ac.role = 'ST' order by ass.create_date desc";
        PreparedStatement pstm;
        Assignment am = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                am = new Assignment();
                am.setAm_id(rs.getInt("ass_id"));
                am.setCourse(Course.getCourseByID(rs.getInt("course_id")));
                am.setName(rs.getString("name"));
                am.setDescription(rs.getString("description"));
                am.setAss_type(rs.getString("ass_type"));
                am.setTotal_member(rs.getInt("total_member"));
                am.setAss_extension(rs.getString("ass_extension"));
                am.setCreate_date(rs.getTimestamp("create_date"));
                am.setDue_date(rs.getDate("due_date"));
                am.setLate_date(rs.getDate("late_date"));
                am.setFully_mark(rs.getDouble("fully_mark"));
                am.setComment(Comment.getCommentByAmID(am.getAm_id()));
                if (am.getAss_type() == "file") {
                    am.setPath_file(rs.getString("path_file"));
                } else {
                    am.setQuestionList(null);
                }
                assList.add(am);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return assList;
    }

    //getAmByAccID(int acc_id)
    public static List<Assignment> getAmByAccID(int acc_id) {
        List<Assignment> assList = new ArrayList<Assignment>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select ass.ass_id,ass.course_id,ass.name,ass.description,ass.ass_type,ass.total_member,ass.due_date,ass.ass_extension,ass.path_file,ass.create_date,ass.fully_mark,ass.late_date from account a "
                + "join account_course ac on a.acc_id = ac.acc_id "
                + "join assignment ass on ac.course_id = ass.course_id "
                + "where a.acc_id = ? AND ac.status =  \"approved\" AND ac.role = 'ST' order by ass.create_date desc";
        PreparedStatement pstm;
        Assignment am = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                am = new Assignment();
                am.setAm_id(rs.getInt("ass_id"));
                am.setCourse(Course.getCourseByID(rs.getInt("course_id"), true));
                am.setName(rs.getString("name"));
                am.setDescription(rs.getString("description"));
                am.setAss_type(rs.getString("ass_type"));
                am.setTotal_member(rs.getInt("total_member"));
                am.setAss_extension(rs.getString("ass_extension"));
                am.setCreate_date(rs.getTimestamp("create_date"));
                am.setDue_date(rs.getDate("due_date"));
                am.setLate_date(rs.getDate("late_date"));
                am.setFully_mark(rs.getDouble("fully_mark"));
                am.setComment(Comment.getCommentByAmID(am.getAm_id()));
                if (am.getAss_type() == "file") {
                    am.setPath_file(rs.getString("path_file"));
                } else {
                    am.setQuestionList(null);
                }
                assList.add(am);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return assList;
    }

    //isSend(int acc_id,int st_am_id)
    public static boolean isSend(int acc_id, int am_id) {
        boolean result = false;
        Date send_date = null;
        Connection conn = ConnectionBuilder.getConnection();
        String sql1 = "select send_date from student_assignment_file saf join assignment a on saf.ass_id = a.ass_id where saf.acc_id = ? and saf.ass_id = ? union"
                + " select send_date from student_assignment_on_web saow join assignment a on saow.ass_id = a.ass_id where saow.acc_id = ? and saow.ass_id = ?";
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
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (send_date == null ? false : true);
    }

    //uploadAmFile(String path_file,int am_id)
    public static int uploadAmFile(String path_file, double mark, int am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update assignment set path_file=?,full_mark_file where ass_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, path_file);
            pstm.setDouble(2, mark);
            pstm.setInt(3, am_id);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    //updateAmInfo(Assignment ass)
    public static int updateAmInfo(Assignment ass) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update assignment set name=?,description=?,ass_type=?,total_member=?,due_date=?,fully_mark=?,title_assignment_onweb=?,late_date=? where ass_id=?";
        if (ass.getAss_type().equalsIgnoreCase("file")) {
            sql = "update assignment set name=?,description=?,ass_type=?,total_member=?,due_date=?,fully_mark=?,path_file=?,late_date=? where ass_id=?";
        }
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, ass.getName());
            pstm.setString(2, ass.getDescription());
            pstm.setString(3, ass.getAss_type());
            pstm.setInt(4, ass.getTotal_member());
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            pstm.setString(5, df.format(ass.getDue_date()));
            System.out.println("before set" + ass.getFully_mark());
            pstm.setDouble(6, ass.getFully_mark());
//            pstm.setTimestamp(6, ass.getDue_date());
//            pstm.setString(7, ass.getAss_extension());
            if (ass.getAss_type().equalsIgnoreCase("file")) {
                pstm.setString(7, ass.getPath_file());
            } else {
                pstm.setString(7, ass.getTitle_assignment_onweb());
            }
            pstm.setString(8, df.format(ass.getLate_date()));
            pstm.setInt(9, ass.getAm_id());
            result = pstm.executeUpdate();
            System.out.println(result);
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    //checkAmStatus(int am_id) 
    public static String remainingTimeforSend(Assignment a, int acc_id) {
        String status = "";
        String sql = "";
        Connection conn = ConnectionBuilder.getConnection();
        if (a.getAss_type().equalsIgnoreCase("file") && a.getTotal_member() == 1) {
            sql = "select lasted_send_date from student_assignment_file where ass_id=? and acc_id=" + acc_id;
        } else if (a.getAss_type().equalsIgnoreCase("web") && a.getTotal_member() == 1) {
            sql = "select lasted_send_date from student_assignment_on_web where ass_id=? and acc_id=" + acc_id;
        } else {
            if (a.getAss_type().equalsIgnoreCase("file")) {
                sql = "select saf.lasted_send_date from student_assignment_file saf join group_member g on saf.g_id = g.g_id where saf.ass_id=? and (g.acc_id like '%," + acc_id + "%' or g.acc_id like '%" + acc_id + ",%' or g.acc_id like '" + acc_id + "%')";
            } else {
                sql = "select saow.lasted_send_date from student_assignment_on_web saow join group_member g on saow.g_id = g.g_id where saow.ass_id=? and (g.acc_id like '%," + acc_id + "%' or g.acc_id like '%" + acc_id + ",%' or g.acc_id like '" + acc_id + "%')";
            }
        }
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, a.getAm_id());
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                Date t = rs.getDate(1);
                if (t != null) {
                    status = "sent";
                } else {
                    status = calculateTime(a);
                }
            } else {
                status = calculateTime(a);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

    public static String lastedSentStatus(Date lastsent, Assignment a) {
        String status = "";
        Date due_date = a.getDue_date();
        Date today = new Date();
        if (lastsent != null) {
            Double remaining_day = (double) ((due_date.getTime() - lastsent.getTime()) / 1000 / 60 / 60 / 24);
            Double timeout = (double) ((a.getLate_date().getTime() - today.getTime()) / 1000 / 60 / 60 / 24);
            System.out.println("--lated sent function---");
            System.out.println(a.getAm_id());
            System.out.println(lastsent + " / due " + a.getDue_date() + "/last " + a.getLate_date());
            if (remaining_day > 3) {
                status = "ontime";
            } else if (remaining_day <= 3 && remaining_day >= 0) {
                //status = "hurryup";
                status = "ontime";
            } else if (remaining_day < 0 && timeout > 0) {
                status = "late";
            }
        } else {
            status = "miss";
        }
        System.out.println(status);
        System.out.println("-----");
        return status;
    }

    public static String calculateTime(Assignment a) {
        String status = "";
        Date due_date = a.getDue_date();
        Date today = new Date();
//        System.out.println(a.getAm_id());
//        System.out.println("---");
        Double remaining_day = (double) ((due_date.getTime() - today.getTime()) / 1000 / 60 / 60 / 24);
        Double late_date_period = (double) ((a.getLate_date().getTime() - due_date.getTime()) / 1000 / 60 / 60 / 24);
        Double timeout = (double) ((a.getLate_date().getTime() - today.getTime()) / 1000 / 60 / 60 / 24);
//        System.out.println(remaining_day);
//        System.out.println(late_date_period);
//        System.out.println("///////////");
        if (remaining_day > 3) {
            status = "ontime";
        } else if (remaining_day <= 3 && remaining_day >= 0) {
            status = "hurryup";
        } else {
            if (!(timeout < 0)) {
                if (late_date_period > 0 && remaining_day < 0) {
                    status = "late";
                } else if (late_date_period == 0 && remaining_day == 0) {
                    status = "hurryup";
                }
            } else {
                status = "miss";
            }
        }
        return status;
    }

    public static boolean isLock(Assignment a) {
        boolean islock = false;
        Date today = new Date();
        Double timeout = (double) ((a.getLate_date().getTime() - today.getTime()) / 1000 / 60 / 60 / 24);
        System.out.println(timeout);
        if (timeout < 0) {
            islock = true;
        }
        return islock;
    }

    @Override
    public String toString() {
        return "Assignment{" + "am_id=" + am_id + ", course=" + course + ", name=" + name + ", description=" + description + ", ass_type=" + ass_type + ", total_member=" + total_member + ", due_date=" + due_date + ", ass_extension=" + ass_extension + ", create_date=" + create_date + ", path_file=" + path_file + ", title_assignment_onweb=" + title_assignment_onweb + ", fully_mark=" + fully_mark + ", comment=" + comment + ", questionList=" + questionList + '}';
    }
}
