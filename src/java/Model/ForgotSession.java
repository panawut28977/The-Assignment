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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Orarmor
 */
public class ForgotSession {

    private int forgot_id;
    private int acc_id;
    private String session;
    private Timestamp update_time;

    public ForgotSession(int acc_id) {
        this.acc_id = acc_id;
        SessionIdentifierGenerator id = new SessionIdentifierGenerator();
        this.session = id.nextSessionId() +"-"+ acc_id;
    }

    public int getForgot_id() {
        return forgot_id;
    }

    public void setForgot_id(int forgot_id) {
        this.forgot_id = forgot_id;
    }

    public int getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(int acc_id) {
        this.acc_id = acc_id;
    }

    public String getSession() {
        return session;
    }

    public void setSession(String session) {
        this.session = session;
    }

    public Timestamp getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Timestamp update_time) {
        this.update_time = update_time;
    }

    public int setForgotSession() {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into forgot_session(acc_id,session) values(?,?)";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, this.acc_id);
            pstm.setString(2, this.session);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static boolean isUpdated(String ss, int acc_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select update_time from forgot_session where acc_id = ? and session=?";
        boolean result = false;
        PreparedStatement pstm;
        String update_time = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            pstm.setString(2, ss);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                update_time = rs.getString("update_time");
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return update_time == null ? false : true;
    }

    public static void updated(String ss, int acc_id) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "update forgot_session set update_time=current_timestamp where  acc_id = ? and session=? ";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, acc_id);
            pstm.setString(2, ss);
            result = pstm.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
//        return result;
    }

    @Override
    public String toString() {
        return "ForgotSession{" + "forgot_id=" + forgot_id + ", acc_id=" + acc_id + ", session=" + session + ", update_time=" + update_time + '}';
    }

}
