package com.lms.serviceImpl;

import java.security.SecureRandom;
import java.util.Properties;

import com.lms.service.OTPService;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class OTPServiceImpl implements OTPService {

	@Override
	public String generateOTP() {
		
		SecureRandom random = new SecureRandom();

        int otp = 100000 + random.nextInt(900000);

        return String.valueOf(otp);
	}

	@Override
	public boolean sendOTP(String email, String otp) {
		String senderEmail = System.getenv("LMS_EMAIL");
        String appPassword = System.getenv("LMS_EMAIL_APP_PASSWORD");

        if (senderEmail == null || appPassword == null) {
            System.out.println("Email credentials not configured.");
            return false;
        }

        Properties properties = new Properties();

        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties, new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication(senderEmail, appPassword);
            }
        });

        try {

            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(senderEmail));

            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)
            );

            message.setSubject("LMS Login OTP");

            message.setText(
                    "Your OTP for LMS login is: " + otp +
                    "\n\nThis OTP is valid for 5 minutes."
            );

            Transport.send(message);

            return true;

        } catch (MessagingException e) {

            e.printStackTrace();

            return false;
        }
    }

	@Override
	public boolean verifyOTP(String generatedOTP, String enteredOTP) {
		
		return generatedOTP != null && generatedOTP.equals(enteredOTP);
	}

}
