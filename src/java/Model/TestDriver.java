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
        //-- Test Account method
//        Account a = new Account();
//        a.setAccount_type("ST");
//        a.setEmail("Orarmor");
//        a.setFirstname("Orarmor");
//        a.setLastname("arm");
//        a.setPassword("arm");
//        a.setProfile_pic("test");
//        a.setAcc_id(2);
//        Account.edit(a);
//        
//        Account.register(a);
//        System.out.println(Account.getAccountByID(2));
        
        //----- Test join course
//        Course c = new Course();
//        c.setCourse_id(1);
//        AccountCourse ac = new AccountCourse();
//        ac.setCouse(c);
//        ac.setRole("TH");
//        ac.setStatus("waiting");
//        
//        AccountCourse.joinCourse(ac, 4);
//        
//        AccountCourse.joinCourse(ac, 2);
//        AccountCourse.joinCourse(ac, 1);
        
        //---- Test approve method
        //AccountCourse.approve(1, 1);
        
        //---- Test disapprove method
//        AccountCourse.disapprove(1,1);
        
        //---- Test change role 
//        AccountCourse.changeRole(5, 1,1);
        
        //---- Test check owner
        System.out.println(AccountCourse.checkOwner(4, 1));
    }
}
