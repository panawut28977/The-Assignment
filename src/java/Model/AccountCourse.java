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
public class AccountCourse {
    private Course couse;  
    private String status;
    private String role;

    public Course getCouse() {
        return couse;
    }

    public void setCouse(Course couse) {
        this.couse = couse;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
}
