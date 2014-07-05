/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author JenoVa
 */
public class StAssignmentOnWeb {
    private int st_am_id;
    private int am_id;
    private int acc_id;
    private double score;
    private Date send_date;
    private List<Group_member> member;
    private List<Comment> comment;
    private List<AnswerQuestion> anwerQuestion;

    public int getSt_am_id() {
        return st_am_id;
    }

    public void setSt_am_id(int st_am_id) {
        this.st_am_id = st_am_id;
    }

    public int getAm_id() {
        return am_id;
    }

    public void setAm_id(int am_id) {
        this.am_id = am_id;
    }

    public int getAcc_id() {
        return acc_id;
    }

    public void setAcc_id(int acc_id) {
        this.acc_id = acc_id;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public Date getSend_date() {
        return send_date;
    }

    public void setSend_date(Date send_date) {
        this.send_date = send_date;
    }

    public List<Group_member> getMember() {
        return member;
    }

    public void setMember(List<Group_member> member) {
        this.member = member;
    }

    public List<Comment> getComment() {
        return comment;
    }

    public void setComment(List<Comment> comment) {
        this.comment = comment;
    }

    public List<AnswerQuestion> getAnwerQuestion() {
        return anwerQuestion;
    }

    public void setAnwerQuestion(List<AnswerQuestion> anwerQuestion) {
        this.anwerQuestion = anwerQuestion;
    }
    
}