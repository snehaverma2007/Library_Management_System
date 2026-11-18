package com.lms.controller;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.lms.pojo.User;
import com.lms.service.UserService;
import com.lms.serviceImpl.UserServiceImpl;
import com.lms.service.OTPService;
import com.lms.serviceImpl.OTPServiceImpl;


@WebServlet("/AuthenticationController")
public class AuthenticationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserServiceImpl();
	private OTPService otpService = new OTPServiceImpl();
       
    
    public AuthenticationController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if("checkLogin".equalsIgnoreCase((action))) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			UserService userService = new UserServiceImpl();
			User user = userService.checkLogin(username, password);
			
			if(user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				response.sendRedirect("DashboardController?action=viewDashboard");
			} else {
				request.setAttribute("errorMessage", "Invalid username or password");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
				dispatcher.forward(request, response);			
			}
		}
		else if("showLogin".equalsIgnoreCase(action)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
		else if("signOut".equalsIgnoreCase(action)) {
			HttpSession session = request.getSession();
			if(session != null) {
				session.invalidate();
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
			dispatcher.forward(request, response);
		}
		else {
			request.setAttribute("errorMessage", "Invalid username or password");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/error.jsp");
			dispatcher.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
