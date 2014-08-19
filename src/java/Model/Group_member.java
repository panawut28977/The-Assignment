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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JenoVa
 */
public class Group_member {

    private int g_id;
    private String acc_id;
    private int g_no;
    private int am_id;
//    private String am_type;

    public String getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(String acc_id) {
        this.acc_id = acc_id;
    }

    public int getG_id() {
        return g_id;
    }

    public void setG_id(int g_id) {
        this.g_id = g_id;
    }

    public int getG_no() {
        return g_no;
    }

    public void setG_no(int g_no) {
        this.g_no = g_no;
    }

    public int getAm_id() {
        return am_id;
    }

    public void setAm_id(int am_id) {
        this.am_id = am_id;
    }

//    public String getAm_type() {
//        return am_type;
//    }
//
//    public void setAm_type(String am_type) {
//        this.am_type = am_type;
//    }
    //addMember(List<Group_member> g)
    public static int addMember(Group_member m) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "";
        PreparedStatement pstm;
        sql = "insert into group_member(acc_id,ass_id,g_no) values(?,?,?)";
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstm.setString(1, m.getAcc_id());
            pstm.setInt(2, m.getAm_id());
            pstm.setInt(3, m.getG_no());
            pstm.executeUpdate();
            ResultSet generatedKeys = pstm.getGeneratedKeys();
            if (generatedKeys.next()) {
                result = generatedKeys.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

//    public static boolean addMember(List<Group_member> mList) {
//        Connection conn = ConnectionBuilder.getConnection();
//        StringBuilder data = new StringBuilder("(");
//        for (Group_member group_member : mList) {
//            data.append(group_member.getAcc_id() + "," + group_member.getAm_id() + "," + group_member.getG_no() + "),(");
//        }
//        data.deleteCharAt(data.length() - 1);
//        data.deleteCharAt(data.length() - 1);
//        String sql = "";
//        PreparedStatement pstm;
//        sql = "insert into group_member(acc_id,ass_id,g_no,am_type) values" + data;
//        int result = 0;
//        try {
//            pstm = conn.prepareStatement(sql);
//            result = pstm.executeUpdate();
//            conn.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return result > 0;
//    }
    //getMemberById(int am_id)
    public static List<Group_member> getMemberById(int g_id) {
        Connection conn = ConnectionBuilder.getConnection();
        List<Group_member> mList = new ArrayList<>();
        PreparedStatement pstm;
        String sql = "";
        sql = "select * from group_member where g_id = ?";
        int result = 0;
        Group_member m = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, g_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                m = new Group_member();
                m.setAcc_id(rs.getString("acc_id"));
                m.setG_id(rs.getInt("g_id"));
                m.setAm_id(rs.getInt("ass_id"));
                m.setG_no(rs.getInt("g_no"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mList;
    }

    //getMemberByAmId(int am_id)
    //isFullMember(int am_id) change to remainingMember(int am_id,int g_no,Assignment a)
    public static int remainingMember(int acc_id, Assignment a) {
        Connection conn = ConnectionBuilder.getConnection();
        int remaining = 0;
        PreparedStatement pstm;
        String sql = "";
        sql = "select acc_id as member_in_group from group_member where ass_id = ? and acc_id like '%" + acc_id + "%'";
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, a.getAm_id());
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                String[] member = (rs.getInt("member_in_group") + "").split(",");
                remaining = a.getTotal_member() - member.length;
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return remaining;
    }

    public static int getlastedGNo(int am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        int g_no = 0;
        PreparedStatement pstm;
        String sql = "";
        sql = "select max(g_no) from group_member where ass_id = ?";
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                g_no = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return g_no;
    }

    public static int isInGroup(int acc_id, int am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        PreparedStatement pstm;
        String sql = "";
        sql = "select count(g_id) from group_member where acc_id like '%" + acc_id + "%' and ass_id = ?";
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static List<Group_member> getAllGroup(int am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        PreparedStatement pstm;
        String sql = "";
        sql = "select * from group_member where ass_id = ?";
        List<Group_member> gList = new ArrayList<>();
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            ResultSet rs = pstm.executeQuery();
            Group_member g = null;
            while (rs.next()) {
                g = new Group_member();
                g.setG_id(rs.getInt("g_id"));
                g.setAcc_id(rs.getString("acc_id"));
                g.setG_no(rs.getInt("g_no"));
                g.setAm_id(rs.getInt("ass_id"));
                gList.add(g);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return gList;
    }

    public static Group_member getGroupByMember(int acc_id, int am_id) {
        Connection conn = ConnectionBuilder.getConnection();
        PreparedStatement pstm;
        String sql = "";
        sql = "select * from group_member where ass_id = ? and acc_id like '%" + acc_id + "%'";
        Group_member g = new Group_member();
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, am_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                g = new Group_member();
                g.setG_id(rs.getInt("g_id"));
                g.setAcc_id(rs.getString("acc_id"));
                g.setG_no(rs.getInt("g_no"));
                g.setAm_id(rs.getInt("ass_id"));
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return g;
    }

    @Override
    public String toString() {
        return "Group_member{" + "g_id=" + g_id + ", acc_id=" + acc_id + ", g_no=" + g_no + ", am_id=" + am_id + '}';
    }

}
