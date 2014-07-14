/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
    private int acc_id;
    private int g_no;
    private int st_am_id;
    private String am_type;

    public int getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(int acc_id) {
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

    public int getSt_am_id() {
        return st_am_id;
    }

    public void setSt_am_id(int st_am_id) {
        this.st_am_id = st_am_id;
    }

    public String getAm_type() {
        return am_type;
    }

    public void setAm_type(String am_type) {
        this.am_type = am_type;
    }

    //addMember(List<Group_member> g)
    public static boolean addMember(List<Group_member> mList) {
        Connection conn = ConnectionBuilder.getConnection();
        StringBuilder data = new StringBuilder("(");
        for (Group_member group_member : mList) {
            data.append(group_member.getAcc_id()+","+group_member.getSt_am_id()+","+group_member.getG_no()+",'"+group_member.getAm_type()+"'),(");
        }
        data.deleteCharAt(data.length() - 1);
        data.deleteCharAt(data.length() - 1);
        String sql = "";
        PreparedStatement pstm;
        sql = "insert into group_member(acc_id,st_ass_id,g_no,am_type) values"+data;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result > 0;
    }

    //getMemberById(int st_am_id)
    public static List<Group_member> getMemberById(int st_am_id) {
        List<Group_member> mList = new ArrayList<>();
        return mList;
    }

    //getMemberByAmId(int am_id)
    //isFullMember(int st_am_id)
    @Override
    public String toString() {
        return "Group_member{" + "g_id=" + g_id + ", acc_id=" + acc_id + ", g_no=" + g_no + ", st_am_id=" + st_am_id + ", am_type=" + am_type + '}';
    }

}
