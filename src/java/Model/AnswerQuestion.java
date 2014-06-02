/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

/**
 *
 * @author JenoVa
 */
public class AnswerQuestion {
    private int q_id;
    private double score;
    private String hilightKeyword;
    private String answer;

    public int getQ_id() {
        return q_id;
    }

    public void setQ_id(int q_id) {
        this.q_id = q_id;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public String getHilightKeyword() {
        return hilightKeyword;
    }

    public void setHilightKeyword(String hilightKeyword) {
        this.hilightKeyword = hilightKeyword;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
    
    
}
