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
public class Message {
    private int ms_id;
    private Account source_acc_id;
    private Account dest_acc_id;
    private String message;
    private Date send_date;

    public int getMs_id() {
        return ms_id;
    }

    public void setMs_id(int ms_id) {
        this.ms_id = ms_id;
    }

    public Account getSource_acc_id() {
        return source_acc_id;
    }

    public void setSource_acc_id(Account source_acc_id) {
        this.source_acc_id = source_acc_id;
    }

    public Account getDest_acc_id() {
        return dest_acc_id;
    }

    public void setDest_acc_id(Account dest_acc_id) {
        this.dest_acc_id = dest_acc_id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getSend_date() {
        return send_date;
    }

    public void setSend_date(Date send_date) {
        this.send_date = send_date;
    }
    
    //send(int send_acc_id,int to_acc_id,String message)
    public static void send(Message m){
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "insert into contact_message(send_acc_id,to_acc_id,message) values(?,?,?)";
        PreparedStatement pstm = null;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, m.getSource_acc_id().getAcc_id());
            pstm.setInt(2, m.getDest_acc_id().getAcc_id());
            pstm.setString(3, m.getMessage());
            result = pstm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    //getMessageBetweenSourceAndDest(int source_acc_id,int dest_acc_id)
    public static List<Message> getMessageBetweenSourceAndDest(int source_acc_id,int dest_acc_id) {
        List<Message> msList = new ArrayList<Message>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from contact_message where send_acc_id=? and to_acc_id=?";
        PreparedStatement pstm;
        Message ms = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, source_acc_id);
            pstm.setInt(2, dest_acc_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                ms = new Message();
                ms.setMs_id(rs.getInt("ms_id"));
                ms.setSource_acc_id(Account.getAccountByID(rs.getInt("send_acc_id")));
                ms.setDest_acc_id(Account.getAccountByID(rs.getInt("to_acc_id")));
                ms.setMessage(rs.getString("message"));
                ms.setSend_date(rs.getTimestamp("send_date"));
                msList.add(ms);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
        }
        return msList;
    }

    @Override
    public String toString() {
        return "Message{" + "ms_id=" + ms_id + ", source_acc_id=" + source_acc_id + ", dest_acc_id=" + dest_acc_id + ", message=" + message + ", send_date=" + send_date + '}';
    }
    
}
