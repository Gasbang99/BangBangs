package com.bbs.common.sendmail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang3.RandomStringUtils;

public class SendMail {
	//출처: https://ktko.tistory.com/entry/JAVA-SMTP와-Mail-발송하기Google-Naver [KTKO 개발 블로그와 여행 일기:티스토리]

	public static String gmailSend(String gmailAddress) {
        String user = "chungjunyong@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String password = "bangbangs"; // 패스워드

        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        String crtfcNo = RandomStringUtils.randomNumeric(6);
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(gmailAddress)); 

            // Subject
            message.setSubject("[방방쓰] 본인인증"); //메일 제목을 입력

            // Text
            message.setText("귀하의 이메일 인증번호는 " + crtfcNo + " 입니다.\n인증번호를 복사하여 입력해주세요."); //메일 내용을 입력

            // send the message
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return crtfcNo;
    }
	
	public static String naverMailSend(String naverAddress) {
        String host = "smtp.naver.com";
        String user = "lojyve8"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String password = "thswldid4fkdgo*";// 패스워드

        // SMTP 서버 정보를 설정한다.
        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        String crtfcNo = RandomStringUtils.randomNumeric(6);
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(naverAddress));

            // 메일 제목
            message.setSubject("[방방쓰] 본인인증");

            // 메일 내용
            message.setText("귀하의 이메일 인증번호는 " + crtfcNo + " 입니다.\n인증번호를 복사하여 입력해주세요.");

            // send the message
            Transport.send(message);
            System.out.println("Success Message Send");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        return crtfcNo;
    }
	
}
