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
public class Explain extends Question{
    private String q_text;
    private String q_keyword_check;
    
    public String getQ_text() {
        return q_text;
    }

    public void setQ_text(String q_text) {
        this.q_text = q_text;
    }

    public String getQ_keyword_check() {
        return q_keyword_check;
    }

    public void setQ_keyword_check(String q_keyword_check) {
        this.q_keyword_check = q_keyword_check;
    }

    @Override
    public String toString() {
        return "Explain{" + "q_text=" + q_text + ", q_keyword_check=" + q_keyword_check + '}';
    }
    
}
