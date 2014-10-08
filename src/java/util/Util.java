/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import Model.Account;
import Model.Question;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Orarmor
 */
public class Util {

    public static String formatTime(String old) {
        String str = null;
        Timestamp timestamp = null;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.ENGLISH);
         Date date = null;
        try {
            date = sdf.parse(old);
            timestamp = new Timestamp(date.getTime());
        } catch (ParseException ex) {
            Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
        }

        Timestamp current = new Timestamp(System.currentTimeMillis());
        Timestamp past24 = new Timestamp(System.currentTimeMillis() - (1000 * 60 * 60 * 24));
        Calendar calendar = Calendar.getInstance();

        if (timestamp.after(past24) && timestamp.before(current)) {
            calendar.setTimeInMillis(current.getTime());
            int currentHour = calendar.get(Calendar.HOUR_OF_DAY);
            int currentMinute = calendar.get(Calendar.MINUTE);
            int currentSecond = calendar.get(Calendar.SECOND);
            calendar.setTimeInMillis(timestamp.getTime());
            int timestampHour = calendar.get(Calendar.HOUR_OF_DAY);
            int timestampMinute = calendar.get(Calendar.MINUTE);
            int timestampSecond = calendar.get(Calendar.SECOND);

            long diff = Math.round(Math.abs(current.getTime() - timestamp.getTime()) / 1000.0);

            if (diff < 60 * 60) {
                if (diff < 60) {
                    // Second level
                    str = diff <= 1 ? "about a second ago" : diff + " seconds ago";
                } else {
                    // Minutes level
                    str = diff >= 60 && diff < 120 ? "about a minute ago" : diff / 60 + " minutes ago";
                }
            } else {
                // Hours level
                str = diff >= 60 * 60 && diff < 60 * 60 * 2 ? "about an hour ago" : diff / 60 / 60 + " hours ago";
            }
        } else {
            calendar.setTimeInMillis(timestamp.getTime());
            String month = new SimpleDateFormat("MMMM", Locale.ENGLISH).format(date);
//            System.out.println(month);
            int day = calendar.get(Calendar.DAY_OF_MONTH);
            int hour = calendar.get(Calendar.HOUR);
            String minute = addZero(calendar.get(Calendar.MINUTE));
            String ampm = calendar.get(Calendar.AM_PM) == Calendar.AM ? "am" : "pm";

            str = month + " " + day + " at " + hour + ":" + minute + ampm;
        }
//        System.out.println(str);
        return str;
    }

    public static String addZero(int time) {
        return time < 10 ? "0" + time : "" + time;
    }

    public static boolean containsAns(String answer, String search) {
        String[] ansList = answer.split(", ");
        ArrayList a = new ArrayList();
        for (String ans : ansList) {
            a.add(ans);
        }
        return a.contains(search);
    }

    public static String replaceStringByIndex(String original, int stIndex, int endIndex, String rep) {
        StringBuilder newText = new StringBuilder(original);
//        newText.replace(stIndex+1, endIndex+1, rep);
        newText.replace(stIndex, endIndex, rep);
        System.out.println(newText.toString());
        System.out.println("-------");
        return newText.toString();
    }

    public static String shuffleString(String s) {
        String[] as = s.split(",");
        List<String> asToList = new ArrayList<>();
        for (String string : as) {
            if (!string.equals("")) {
                asToList.add(string);
            }
        }
        Collections.shuffle(asToList);
        String finalString = asToList.toString().substring(1, asToList.toString().length() - 1);
        return finalString;
    }

    public static String createPopoverGroup(List<Account> accList) {
        String dataContent = "";
        for (Account account : accList) {
            dataContent += "<img class='img-circle' src='" + account.getProfile_pic() + "' width='24'> " + account.getFirstname() + "<br/>";
        }
        return dataContent;
    }

    public static void sortQuestionIndex(ArrayList<Question> curqList) {
        Question temp = null;
        System.out.println("before sort:" + curqList);
        for (int i = 0; i < curqList.size(); i++) {
            for (int j = i + 1; j < curqList.size(); j++) {
                if (curqList.get(j).getQ_start_index() < curqList.get(i).getQ_start_index()) {
                    temp = curqList.get(i);
                    curqList.set(i, curqList.get(j));
                    curqList.set(j, temp);
                }
            }
        }
        System.out.println("after :" + curqList);
    }

    public static void main(String[] args) {
        System.out.println(formatTime("2014-09-27 16:21:26.0"));
    }
}
