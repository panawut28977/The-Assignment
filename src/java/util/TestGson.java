/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;


import Model.Account;
import Model.Announcement;
import Model.Assignment;
import Model.Course;
import Model.UserScore;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author Shinomiya
 */
public class TestGson {

    public static void main(String[] args) throws IOException {

        final Gson gson = new Gson();
            // original object instantiation
        Account modelObject = new Account(123, "sdasdlas;", "dksajdla" );
        
        System.out.println("toJson ---");
        System.out.println("Original Java object : " + modelObject);
        
            // converting an object to json object
        String json = gson.toJson(modelObject);
        System.out.println("Converted JSON string is : " + json);
        
        System.out.println("------------------------------------------------------------");
        System.out.println("fromJson----");
            // getting object from json representation
        System.out.println("Original JSON string is : " + json);
            // converting json to object
        Account modelObject1 = gson.fromJson(json, Account.class);
        System.out.println("Converted Java object : " + modelObject1);
        
        
       Account a = Account.getAccountByID(2);
      String json2 = gson.toJson(a);
        System.out.println("------------------------------------------------------------");
        System.out.println("Account: "+ json2);
        
        
        
//        List<UserScore> u = UserScore.getUserScore(2);
//        String json3 = gson.toJson(u);
//        System.out.println("-------------------------------------------------------------------");
//        System.out.println("User Score:  "+ json3);
        
        System.out.println("------------------------------------------------------------");
        Course c = Course.getCourseByID(306);
        String json4 = gson.toJson(c);
        System.out.println("Course: " + json4);
        
        System.out.println("------------------------------------------------------------");
        List<Announcement> ac = Announcement.viewAnnByAccID(2);
        String json5 = gson.toJson(ac);
        System.out.println("Announcement: "+json5);
        
        System.out.println("------------------------------------------------------------");
        List<Assignment> as = Assignment.getAmByAccID(2);
        String json6 = gson.toJson(as);
        System.out.println("Assignment by ID: "+json6);
        
        System.out.println("------------------------------------------------------------");
        Assignment as2 = Assignment.getAmByAmID(1);
        String json7 = gson.toJson(as2);
        System.out.println("Assignment Detail: "+json7);

    }
}
