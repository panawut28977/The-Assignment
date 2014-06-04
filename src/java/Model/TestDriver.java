/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

/**
 *
 * @author Orarmor
 */
public class TestDriver {
    public static void main(String[] args) {
        Account a = new Account();
        a.setAccount_type("TH");
        a.setEmail("orarmor@dd");
        a.setFirstname("orarmor");
        a.setLastname("arm");
        a.setPassword("arm");
        a.setProfile_pic("test");
        
        Account.register(a);
        System.out.println(2);
    }
}
