/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author ess25_000
 */
public class EmailService {

    private static EmailService instance;
    private String username;
    private String password;
    private Properties props;
    private static final String ASSIGNMENT_USERNAME = "tasm@chaninz.com";
    private static final String ASSIGNMENT_PASSWORD = "7WnO2KeDfiYVcTb";

    public EmailService(String username, String password) {
        this.username = username;
        this.password = password;
        props = new Properties();
        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "mail.chaninz.com");
//        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.debug", "true");
        props.put("mail.smtp.debug", "true");
        props.put("mail.smtp.port", "25");
//        props.put("mail.smtp.user", "theassignment.sit");
    }

    public static EmailService getInstance() {
        if (instance == null) {
            instance = new EmailService(ASSIGNMENT_USERNAME, ASSIGNMENT_PASSWORD);
        }
        return instance;
    }

    public int send(String address, String title, String content) {
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("no-reply@assignment.sit.kmutt.ac.th"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(address));
            message.setSubject(title);
            message.setText(content);
            
            Transport.send(message);
            return 1;
        } catch (MessagingException ex) {
            Logger.getLogger(EmailService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}
