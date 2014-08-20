/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
    private Date send_date;

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

    public Date getSend_date() {
        return send_date;
    }

    public void setSend_date(Date send_date) {
        this.send_date = send_date;
    }

    public static int setAmFile(StAmFileList safl) {
        Connection conn = ConnectionBuilder.getConnection();
        String sql1 = "insert into student_assignment_file_version(list_id,path_file,send_acc_id,send_date) values(?,?,?,?)";
        PreparedStatement pstm;
        int result = 0;
        try {
            pstm = conn.prepareStatement(sql1);
            pstm.setInt(1, safl.getList_id());
            pstm.setString(2, safl.getPath_file());
            pstm.setInt(3, safl.getSend_acc_id());
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            pstm.setString(4, df.format(safl.getSend_date()));
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
                safl.setSend_date(rs.getDate("send_date"));
                safl.setSend_acc_id(rs.getInt("send_acc_id"));
                fileList.add(safl);
            }
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(StAssignmentFile.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fileList;
    }

    @Override
    public String toString() {
        return "StAmFileList{" + "safv_id=" + safv_id + ", list_id=" + list_id + ", path_file=" + path_file + ", send_acc_id=" + send_acc_id + ", file_size=" + file_size + ", send_date=" + send_date + '}';
    }

}
