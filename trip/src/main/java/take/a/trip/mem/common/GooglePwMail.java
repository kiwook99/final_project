package take.a.trip.mem.common;

import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;

public class GooglePwMail {
	
	public void idMail(String mememail, String sendMsg, String memid) {
		
		
		String mailSubject = "ID 찾기 메일입니다.";
		System.out.println("googleMailSender resiveMail >>> "	 	+ mememail);
		System.out.println("googleMailSender sendMsg >>> : " 		+ sendMsg);
		System.out.println("googleMailSender sendId >>> : " 		+ memid);
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("dgdo7777@gmail.com", "udfe ogxx jwuy ihzb");
			}
		});
		
		
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(mememail, "관리자", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mememail));
			message.setSubject(mailSubject);
			message.setContent("아이디: <br>"+ memid, "text/html; charset=utf-8");
			
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	public void pwMail(String mememail, String sendMsg ) {
		
		String mailSubject = "PW 찾기 메일입니다.";
		System.out.println("googleMailSender mememail >>> "	 	+ mememail);
		System.out.println("googleMailSender sendMsg >>> : " 		+ sendMsg);
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("dgdo7777@gmail.com", "udfe ogxx jwuy ihzb");
			}
		});
		
		
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(mememail, "관리자", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(mememail));
			message.setSubject(mailSubject);
			message.setContent("비밀번호: <br>"+ sendMsg, "text/html; charset=utf-8");
			
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
}

