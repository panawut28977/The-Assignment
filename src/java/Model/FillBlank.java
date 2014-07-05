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
public class FillBlank extends Question{
    private String q_text;
    private int score;
    private String answer;
    private int q_start_index;
    private int q_end_index;

    public String getQ_text() {
        return q_text;
    }

    public void setQ_text(String q_text) {
        this.q_text = q_text;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getQ_start_index() {
        return q_start_index;
    }

    public void setQ_start_index(int q_start_index) {
        this.q_start_index = q_start_index;
    }

    public int getQ_end_index() {
        return q_end_index;
    }

    public void setQ_end_index(int q_end_index) {
        this.q_end_index = q_end_index;
    }

    @Override
    public String toString() {
        return "FillBlank{" + "q_text=" + q_text + ", score=" + score + ", answer=" + answer + ", q_start_index=" + q_start_index + ", q_end_index=" + q_end_index + '}';
    }
    
    
}
