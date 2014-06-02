/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

import java.util.List;

/**
 *
 * @author JenoVa
 */
public class Account {
    private int acc_id;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private String profile_pic;
    private String account_type;
    private List<Announcement> announcement;
    private List<AccountCourse> CourseList;
    private List<Assignment> assignment;
    private List<UserScore> listStudentScore;

    public int getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(int acc_id) {
        this.acc_id = acc_id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfile_pic() {
        return profile_pic;
    }

    public void setProfile_pic(String profile_pic) {
        this.profile_pic = profile_pic;
    }

    public String getAccount_type() {
        return account_type;
    }

    public void setAccount_type(String account_type) {
        this.account_type = account_type;
    }

    public List<Announcement> getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(List<Announcement> announcement) {
        this.announcement = announcement;
    }

    public List<AccountCourse> getCourseList() {
        return CourseList;
    }

    public void setCourseList(List<AccountCourse> CourseList) {
        this.CourseList = CourseList;
    }

    public List<Assignment> getAssignment() {
        return assignment;
    }

    public void setAssignment(List<Assignment> assignment) {
        this.assignment = assignment;
    }

    public List<UserScore> getListStudentScore() {
        return listStudentScore;
    }

    public void setListStudentScore(List<UserScore> listStudentScore) {
        this.listStudentScore = listStudentScore;
    }
    
    
}
