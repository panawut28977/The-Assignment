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
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Orarmor
 */
public class StAmFileList {

    private int safv_id;
    private int list_id;
    private String path_file;
    private int send_acc_id;
    private long file_size;
    private Timestamp send_date;
    private String uuid;

    public int getSafv_id() {
        return safv_id;
    }

    public void setSafv_id(int safv_id) {
        this.safv_id = safv_id;
    }

    public int getList_id() {
        return list_id;
    }

    public void setList_id(int list_id) {
        this.list_id = list_id;
    }

    public String getPath_file() {
        return path_file;
    }

    public void setPath_file(String path_file) {
        this.path_file = path_file;
    }

    public int getSend_acc_id() {
        return send_acc_id;
    }

    public void setSend_acc_id(int send_acc_id) {
        this.send_acc_id = send_acc_id;
    }

    public long getFile_size() {
        return file_size;
    }

    public void setFile_size(long file_size) {
        this.file_size = file_size;
    }

    public Timestamp getSend_date() {
        return send_date;
    }

    public void setSend_date(Timestamp send_date) {
        this.send_date = send_date;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
    

    public static int setAmFile(StAmFileList safl) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql1 = "insert into student_assignment_file_version(list_id,path_file,send_acc_id,uuid) values(?,?,?,?)";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql1);
            pstm.setInt(1, safl.getList_id());
            pstm.setString(2, safl.getPath_file());
            pstm.setInt(3, safl.getSend_acc_id());
            pstm.setString(4, safl.getUuid());
            result = pstm.executeUpdate();

            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentOnWeb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static List<StAmFileList> getStAmAllVersion(int list_id) {
        List<StAmFileList> fileList = new ArrayList<StAmFileList>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from student_assignment_file_version where list_id = ? order by send_date desc,safv_id";
        PreparedStatement pstm;
        StAmFileList safl = null;

        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, list_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                safl = new StAmFileList();
                safl.setList_id(list_id);
                safl.setPath_file(rs.getString("path_file"));
                safl.setSafv_id(rs.getInt("safv_id"));
                safl.setSend_date(rs.getTimestamp("send_date"));
                safl.setSend_acc_id(rs.getInt("send_acc_id"));
                safl.setUuid(rs.getString("uuid"));
                fileList.add(safl);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fileList;
    }
    
    public static List<StAmFileList> getSafvByListId(int list_id){
        List<StAmFileList> safv= new ArrayList<StAmFileList>();
        Connection conn = ConnectionBuilder.getConnection();
        String sql = "select * from student_assignment_file_version where list_id = ? order by send_date desc";
        PreparedStatement pstm;
        StAmFileList s = null;
        try {
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, list_id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                s = new StAmFileList();
                s.setList_id(rs.getInt("list_id"));
                s.setPath_file(rs.getString("path_file"));
                s.setSafv_id(rs.getInt("safv_id"));
                s.setSend_acc_id(rs.getInt("send_acc_id"));
                s.setSend_date(rs.getTimestamp("send_date"));
                s.setUuid(rs.getString("uuid"));
                safv.add(s);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAmFileList.class.getName()).log(Level.SEVERE, null, ex);
        }
        return safv;
    }

    @Override
    public String toString() {
        return "StAmFileList{" + "safv_id=" + safv_id + ", list_id=" + list_id + ", path_file=" + path_file + ", send_acc_id=" + send_acc_id + ", file_size=" + file_size + ", send_date=" + send_date + ", uuid=" + uuid + '}';
    }

}
