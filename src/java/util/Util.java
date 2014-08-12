/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

        try {
            Date date = sdf.parse(old);
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
            String month = new SimpleDateFormat("MMMM", Locale.ENGLISH).format(calendar.get(Calendar.MONTH));
            int day = calendar.get(Calendar.DAY_OF_MONTH);
            int hour = calendar.get(Calendar.HOUR);
            String minute = addZero(calendar.get(Calendar.MINUTE));
            String ampm = calendar.get(Calendar.AM_PM) == Calendar.AM ? "am" : "pm";

            str = month + " " + day + " at " + hour + ":" + minute + ampm;
        }

        return str;
    }
    
    public static String addZero(int time) {
        return time < 10 ? "0" + time : "" + time;
    }
}
