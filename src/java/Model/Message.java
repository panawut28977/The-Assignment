/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

import java.util.Date;

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
    
    
}
