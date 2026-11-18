package com.lms.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@WebFilter("/*")
public class AuthFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	        throws IOException, ServletException {

	    HttpServletRequest httpServletRequest = (HttpServletRequest) request;

	    String url = httpServletRequest.getRequestURI();
	    String contextPath = httpServletRequest.getContextPath();

	    HttpSession session = httpServletRequest.getSession(false);

	    boolean loggedIn = (session != null && session.getAttribute("user") != null);

	    boolean allowedMethod = url.equals(contextPath + "/")
	            || url.equals(contextPath + "/AuthenticationController")
	            || url.equals(contextPath + "/jsp/login.jsp")
	            || url.contains("/css/")
	            || url.contains("/js/")
	            || url.contains("/images/");

	    if (loggedIn || allowedMethod) {
	        chain.doFilter(request, response);
	    }
	    else {
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
	        dispatcher.forward(request, response);
	    }
	}
}
