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
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JenoVa
 */
public class Notification {

    private int noti_id;
    private int acc_id;
    private int course_id;
    private String type;
    private String text;
    private String link;
    private Timestamp noti_date;
    private int receive_list_id;

    //attr mobile
    private String noti_name;
    private String course_name;
    private String datefm;
    private String profile_pic;
    private String seen_date;

    public int getNoti_id() {
        return noti_id;
    }

    public void setNoti_id(int noti_id) {
        this.noti_id = noti_id;
    }

    public int getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(int acc_id) {
        this.acc_id = acc_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Timestamp getNoti_date() {
        return noti_date;
    }

    public void setNoti_date(Timestamp noti_date) {
        this.noti_date = noti_date;
    }

    public int getReceive_list_id() {
        return receive_list_id;
    }

    public void setReceive_list_id(int receive_list_id) {
        this.receive_list_id = receive_list_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getDatefm() {
        return datefm;
    }

    public void setDatefm(String datefm) {
        this.datefm = datefm;
    }

    public String getNoti_name() {
        return noti_name;
    }

    public void setNoti_name(String noti_name) {
        this.noti_name = noti_name;
    }

    public String getProfile_pic() {
        return profile_pic;
    }

    public void setProfile_pic(String profile_pic) {
        this.profile_pic = profile_pic;
    }

    public String getSeen_date() {
        return seen_date;
    }

    public void setSeen_date(String seen_date) {
        this.seen_date = seen_date;
    }

    public static int announce(Notification n, List<Integer> acc_id) {
        Connection conn = ConnectionBuilder.getConnection();
        int last_id = getLastReceive_list_id() + 1;
        StringBuilder insert_receive = new StringBuilder("insert into receive_noti_id(receive_list_id,acc_id) values");
        for (Integer id : acc_id) {
            StringBuilder cIdList = new StringBuilder("(");
            cIdList.append(last_id + "," + id);
            cIdList.append(")");
            insert_receive.append(cIdList.toString() + ",");
        }
        insert_receive.deleteCharAt(insert_receive.length() - 1);
        System.out.println(insert_receive);
        String sql = "insert into notification(acc_id,course_id,type,text,link,receive_list_id) values(?,?,?,?,?,?)";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, n.getAcc_id());
            pstm.setInt(2, n.getCourse_id());
            pstm.setString(3, n.getType());
            pstm.setString(4, n.getText());
            pstm.setString(5, n.getLink());
            pstm.setInt(6, last_id);
            result = pstm.executeUpdate();

            pstm = conn.prepareCall(insert_receive.toString());
            pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static Map<Integer, String> getNotify(int receive_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select n.noti_id,n.type from notification n join receive_noti_id r on n.receive_list_id = r.receive_list_id where r.acc_id=? and r.seen_date is null";
        Map<Integer, String> notiMap = new HashMap<>();
        PreparedStatement pstm;
        Notification n = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, receive_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
//                n= new Notification();
//                n.setAcc_id(rs.getInt("acc_id"));
//                n.setLink(rs.getString("link"));
//                n.setNoti_date(rs.getDate("noti_date"));
//                n.setNoti_id(rs.getInt("noti_id"));
//                n.setText(rs.getString("text"));
//                n.setType(rs.getString("type"));
//                n.setReceive_list_id(rs.getInt("receive_list_id"));
//                notiList.add(n);
                notiMap.put(rs.getInt("noti_id"), rs.getString("type"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return notiMap;
    }

    public static int getTotalNotify(int receive_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select count(n.noti_id) from notification n join receive_noti_id r on n.receive_list_id = r.receive_list_id where r.acc_id=? and r.seen_date is null";
        PreparedStatement pstm;
        int total = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, receive_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }

    public static int getLastReceive_list_id() {
        String e = null;
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select max(receive_list_id) from notification";
        int result = 0;
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
                if (result == 0) {
                    result = 1;
                }
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static List<Notification> getAnnounce(int receive_id) {
        String e = null;
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select n.*,r.*,a.firstname,a.lastname,a.profile_pic,c.name from notification n "
                + "join receive_noti_id r on n.receive_list_id = r.receive_list_id "
                + "join account a on n.acc_id = a.acc_id "
                + "join course c on n.course_id = c.course_id where n.type like 'announce' and  r.acc_id=? order by n.noti_id desc";
        List<Notification> notiList = new ArrayList<>();
        PreparedStatement pstm;
        Notification n = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, receive_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                n = new Notification();
                n.setAcc_id(rs.getInt("acc_id"));
                n.setCourse_id(rs.getInt("course_id"));
                n.setNoti_name(rs.getString("firstname") + " " + rs.getString("lastname"));
                n.setCourse_name(rs.getString("name"));
                n.setProfile_pic(rs.getString("profile_pic"));
                n.setLink(rs.getString("link"));
                n.setNoti_date(rs.getTimestamp("noti_date"));
                n.setNoti_id(rs.getInt("noti_id"));
                n.setText(rs.getString("text"));
                n.setType(rs.getString("type"));
                n.setReceive_list_id(rs.getInt("receive_list_id"));
                notiList.add(n);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return notiList;
    }

    public static List<Notification> getAssignment(int receive_id) {
        String e = null;
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select n.*,r.*,a.firstname,a.lastname,a.profile_pic,c.name from notification n "
                + "join receive_noti_id r on n.receive_list_id = r.receive_list_id "
                + "join account a on n.acc_id = a.acc_id "
                + "join course c on n.course_id = c.course_id "
                + "where n.type like 'assignment'  and r.acc_id=? order by n.noti_id desc";
        List<Notification> notiList = new ArrayList<>();
        PreparedStatement pstm;
        Notification n = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, receive_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                n = new Notification();
                n.setAcc_id(rs.getInt("acc_id"));
                n.setCourse_id(rs.getInt("course_id"));
                n.setNoti_name(rs.getString("firstname") + " " + rs.getString("lastname"));
                n.setCourse_name(rs.getString("name"));
                n.setProfile_pic(rs.getString("profile_pic"));
                n.setLink(rs.getString("link"));
                n.setNoti_date(rs.getTimestamp("noti_date"));
                n.setNoti_id(rs.getInt("noti_id"));
                n.setText(rs.getString("text"));
                n.setType(rs.getString("type"));
                n.setReceive_list_id(rs.getInt("receive_list_id"));
                notiList.add(n);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return notiList;
    }

    public static List<Notification> getAlert(int receive_id) {
        String e = null;
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select n.*,r.*,a.firstname,a.lastname,a.profile_pic,c.name from notification n join receive_noti_id r on n.receive_list_id = r.receive_list_id "
                + "join account a on n.acc_id = a.acc_id "
                + "join course c on n.course_id = c.course_id "
                + "where n.type like 'alert' and r.acc_id=? order by n.noti_id desc";
        List<Notification> notiList = new ArrayList<>();
        PreparedStatement pstm;
        Notification n = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, receive_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                n = new Notification();
                n.setAcc_id(rs.getInt("acc_id"));
                n.setCourse_id(rs.getInt("course_id"));
                n.setNoti_name(rs.getString("firstname") + " " + rs.getString("lastname"));
                n.setCourse_name(rs.getString("name"));
                n.setProfile_pic(rs.getString("profile_pic"));
                n.setLink(rs.getString("link"));
                n.setNoti_date(rs.getTimestamp("noti_date"));
                n.setNoti_id(rs.getInt("noti_id"));
                n.setText(rs.getString("text"));
                n.setType(rs.getString("type"));
                n.setReceive_list_id(rs.getInt("receive_list_id"));
                notiList.add(n);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return notiList;
    }

    public static List<Notification> getScore(int receive_id) {
        String e = null;
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select n.*,r.*,a.firstname,a.lastname,a.profile_pic,c.name from notification n join receive_noti_id r on n.receive_list_id = r.receive_list_id "
                + "join account a on n.acc_id = a.acc_id "
                + "join course c on n.course_id = c.course_id "
                + "where n.type like 'score' and r.acc_id=? order by n.noti_id desc";
        List<Notification> notiList = new ArrayList<>();
        PreparedStatement pstm;
        Notification n = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, receive_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                n = new Notification();
                n.setAcc_id(rs.getInt("acc_id"));
                n.setCourse_id(rs.getInt("course_id"));
                n.setNoti_name(rs.getString("firstname") + " " + rs.getString("lastname"));
                n.setCourse_name(rs.getString("name"));
                n.setProfile_pic(rs.getString("profile_pic"));
                n.setLink(rs.getString("link"));
                n.setNoti_date(rs.getTimestamp("noti_date"));
                n.setNoti_id(rs.getInt("noti_id"));
                n.setText(rs.getString("text"));
                n.setType(rs.getString("type"));
                n.setReceive_list_id(rs.getInt("receive_list_id"));
                notiList.add(n);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return notiList;
    }

    public static boolean removeCourseUserNoti(int acc_id, int course_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "delete r.* from notification n left join receive_noti_id r on n.receive_list_id = r.receive_list_id where r.acc_id=? and n.course_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            pstm.setInt(2, course_id);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    public static int seen(int acc_id, String type) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update notification n"
                + " join receive_noti_id r on  n.receive_list_id =  r.receive_list_id "
                + " set r.seen_date = CURRENT_TIMESTAMP"
                + " WHERE n.type = ? and r.acc_id = ? ";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, type);
            pstm.setInt(2, acc_id);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static boolean removeUserNotify(int acc_id, int receive_list_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "delete from receive_noti_id where acc_id=? and receive_list_id=?";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            pstm.setInt(2, receive_list_id);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    public static List<Notification> getAllNotification(int receive_id) {
        String e = null;
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from notification n join receive_noti_id r on n.receive_list_id = r.receive_list_id where r.acc_id=? order by n.noti_id desc";
        List<Notification> notiList = new ArrayList<>();
        PreparedStatement pstm;
        Notification n = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, receive_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                n = new Notification();
                n.setAcc_id(rs.getInt("acc_id"));
                n.setCourse_id(rs.getInt("course_id"));
                n.setCourse_name(Course.getCourseNameByID(n.getCourse_id()));
                n.setLink(rs.getString("link"));
                n.setNoti_date(rs.getTimestamp("noti_date"));
                n.setDatefm(util.Util.formatTime(n.getNoti_date() + ""));
                n.setNoti_id(rs.getInt("noti_id"));
                n.setText(rs.getString("text"));
                n.setType(rs.getString("type"));
                n.setReceive_list_id(rs.getInt("receive_list_id"));
                n.setNoti_name(Account.getNameByID(n.getAcc_id()).getFirstname());
                n.setProfile_pic(Account.getNameByID(n.getAcc_id()).getProfile_pic());
                n.setSeen_date(getSeenDate(n.getReceive_list_id(), receive_id));
//                System.out.println(n.getReceive_list_id());
//                System.out.println(n.getAcc_id());
//                System.out.println(n.getSeen_date());
                notiList.add(n);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return notiList;
    }

    public static String getSeenDate(int list_id, int acc_id) {
        System.out.println("get seen date:" + list_id + "/" + acc_id);
        String t = null;
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select seen_date from receive_noti_id where receive_list_id = ? and acc_id = ?";
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, list_id);
            pstm.setInt(2, acc_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                t = rs.getString("seen_date");
                System.out.println(t);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return t;
    }

    @Override
    public String toString() {
        return "Notification{" + "noti_id=" + noti_id + ", acc_id=" + acc_id + ", course_id=" + course_id + ", type=" + type + ", text=" + text + ", link=" + link + ", noti_date=" + noti_date + ", receive_list_id=" + receive_list_id + ", noti_name=" + noti_name + ", course_name=" + course_name + ", datefm=" + datefm + ", profile_pic=" + profile_pic + ", seen_date=" + seen_date + '}';
    }

}
