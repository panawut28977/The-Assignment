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
public class MultipleChoice extends Question{
    private String q_type;
    private String q_choice_list;
    private String q_answer_list;
    private int q_score;

    public String getQ_choice_list() {
        return q_choice_list;
    }

    public void setQ_choice_list(String q_choice_list) {
        this.q_choice_list = q_choice_list;
    }

    public String getQ_answer_list() {
        return q_answer_list;
    }

    public void setQ_answer_list(String q_answer_list) {
        this.q_answer_list = q_answer_list;
    }

    public int getQ_score() {
        return q_score;
    }

    public void setQ_score(int q_score) {
        this.q_score = q_score;
    }

    @Override
    public String toString() {
        return "MultipleChoice{" + "q_type=" + q_type + ", q_choice_list=" + q_choice_list + ", q_answer_list=" + q_answer_list + ", q_score=" + q_score + '}';
    }
    
    
}
