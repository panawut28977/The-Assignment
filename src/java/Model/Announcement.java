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
public class Announcement {
    private int an_id;
    private Account an_acc;
    private Course course;
    private String title;
    private String content;
    private Date announce_date;

    public int getAn_id() {
        return an_id;
    }

    public void setAn_id(int an_id) {
        this.an_id = an_id;
    }

    public Account getAn_acc() {
        return an_acc;
    }

    public void setAn_acc(Account an_acc) {
        this.an_acc = an_acc;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAnnounce_date() {
        return announce_date;
    }

    public void setAnnounce_date(Date announce_date) {
        this.announce_date = announce_date;
    }
    
}
