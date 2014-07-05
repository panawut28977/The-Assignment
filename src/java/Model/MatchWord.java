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
public class MatchWord extends Question{
    private String q_text;
    private String q_answer;
    private int q_score;

    public String getQ_text() {
        return q_text;
    }

    public void setQ_text(String q_text) {
        this.q_text = q_text;
    }

    public String getQ_answer() {
        return q_answer;
    }

    public void setQ_answer(String q_answer) {
        this.q_answer = q_answer;
    }

    public int getQ_score() {
        return q_score;
    }

    public void setQ_score(int q_score) {
        this.q_score = q_score;
    }

    @Override
    public String toString() {
        return "MatchWord{" + "q_text=" + q_text + ", q_answer=" + q_answer + ", q_score=" + q_score + '}';
    }
    
    
}
