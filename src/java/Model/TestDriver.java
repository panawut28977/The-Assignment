/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import sun.java2d.pipe.SpanShapeRenderer;

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
//        Course.generateCode();
        
//        //---- Add Announcement
//        Course c = Course.getCourseByID(1);
//        Account acc = Account.getAccountByID(1);
//        Announcement a = new Announcement();
//        a.setAn_acc(acc);
//        a.setCourse(c);
//        a.setContent("Test content Test content Test content Test content");
//        a.setTitle("Test header");
//        Announcement.add(a);
        
        
//        //--- get Announcement by course or acc id
//        System.out.println(Announcement.viewAnnByAccID(1));
//        System.out.println(Announcement.viewAnnByCourse(1));
//        
        //--- remove Announcement
        //System.out.println(Announcement.remove(2));
        
        //--update Announcement
//        Course c = Course.getCourseByID(1);
//        Account acc = Account.getAccountByID(1);
//        Announcement a = new Announcement();
//        a.setAn_id(1);
//        a.setAn_acc(acc);
//        a.setCourse(c);
//        a.setContent("update content");
//        a.setTitle("Test header");
//        System.out.println(Announcement.update(a));
        
        //-- craete assignment info
//        Assignment am = new Assignment();
//        am.setAss_extension("docx");
//        am.setAss_type("file");
//        am.setCourse_id(3);
//        Date d = new Date();
//        am.setDescription(" nsnddda  asdfsfasdfsaf ");
//        am.setDue_date(d);
//        am.setName("orarmor work 4");
//        am.setTotal_member(1);
//        Assignment.createAmInfo(am);
//        
        //getAmByAccID
//        System.out.println(Assignment.getAmByAccID(1));
        //-- delete am
//        Assignment.deleteAm(4);
        
        //getAmByCourseID
//        System.out.println(Assignment.getAmByCourseID(1));
        
        //getAmByAmID
//        System.out.println(Assignment.getAmByAmID(1));
        
        //getAmByAccID
//        System.out.println(Assignment.getAmByAccID(4));
        
        //isSend
        //System.out.println(Assignment.isSend(1,2));
        
        
        //Message send
//        Message m =  new Message();
//        m.setSource_acc_id(Account.getAccountByID(1));
//        m.setDest_acc_id(Account.getAccountByID(2));
//        m.setMessage("eeeerererer");
//        Message.send(m);
        
        //Get Message 
//        System.out.println(Message.getMessageBetweenSourceAndDest(1, 2));
    }
}
