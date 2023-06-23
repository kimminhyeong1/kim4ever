package com.myezen.myapp.util;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
//2023-05-19
public class MailHandler {//메일 전송 라이브러리의 setter이다. 아래부터 메일 제목, 내용, 발송자, 수신자, 보내기(send)로 이루어져 있다. 
    private JavaMailSender mailSender;
    private MimeMessage message;
    private MimeMessageHelper messageHelper;

    public MailHandler(JavaMailSender mailSender) throws MessagingException {
        this.mailSender = mailSender;
        message = this.mailSender.createMimeMessage();
        messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    }

    public void setSubject(String subject) throws MessagingException {//제목
        messageHelper.setSubject(subject);
    }

    public void setText(String htmlContent) throws MessagingException {//내용
        messageHelper.setText(htmlContent, true);
    }

    public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {//발송자
        messageHelper.setFrom(email, name);
    }

    public void setTo(String email) throws MessagingException {//수신자
        messageHelper.setTo(email);
    }

    public void addInline(String contentId, DataSource dataSource) throws MessagingException {
        messageHelper.addInline(contentId, dataSource);
    }
    @Async
    public void send() {//보내기
        mailSender.send(message);
    }
}