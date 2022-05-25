package com.amq.mail;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class MailSender {
;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
    private SimpleMailMessage templateMessage;
	
	
	public void setMailSender() {
        mailSender = new JavaMailSenderImpl();
        ((JavaMailSenderImpl)mailSender).setUsername("freddyamr@gmail.com");
        ((JavaMailSenderImpl)mailSender).setPassword("ppjilxtqcsquwgkn");
        ((JavaMailSenderImpl)mailSender).setHost("smtp.gmail.com");
        ((JavaMailSenderImpl)mailSender).setPort(587);
        ((JavaMailSenderImpl)mailSender).setProtocol("smtp");
        ((JavaMailSenderImpl)mailSender).getJavaMailProperties().setProperty("mail.smtp.auth", "true");
        ((JavaMailSenderImpl)mailSender).getJavaMailProperties().setProperty("mail.smtp.starttls.enable", "true");
        ((JavaMailSenderImpl)mailSender).getJavaMailProperties().setProperty("mail.smtp.quitwait", "true");
        
        Properties mailProperties = new Properties();
        mailProperties.put("mail.smtp.auth", "true");
        mailProperties.put("mail.smtp.starttls.enable", "true");
        mailProperties.put("mail.smtp.starttls.required", "true");
        mailProperties.put("mail.smtp.socketFactory.port", 465);
        mailProperties.put("mail.smtp.debug", "true");
        mailProperties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        mailProperties.put("mail.smtp.socketFactory.fallback", "false");
        ((JavaMailSenderImpl)mailSender).setJavaMailProperties( mailProperties );
        
    }

    public void setTemplateMessage() {
    	templateMessage = new SimpleMailMessage();
        templateMessage.setFrom("freddyamr@gmail.com");
    }

    public void enviarMail(Mensaje msj) {
    	setMailSender();
    	setTemplateMessage();
        SimpleMailMessage msg = new SimpleMailMessage(templateMessage);
        
        msg.setTo(msj.getDestinatario());
        msg.setText(msj.getCuerpo());
        msg.setText(msj.getCuerpo());
        msg.setSubject(msj.getAsunto());
        mailSender.send(msg);
    }
}
