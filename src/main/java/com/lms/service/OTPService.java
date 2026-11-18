package com.lms.service;

public interface OTPService {
	
	String generateOTP();
	
	boolean sendOTP(String email, String otp);
	
	boolean verifyOTP(String generatedOTP, String enteredOTP);
}
