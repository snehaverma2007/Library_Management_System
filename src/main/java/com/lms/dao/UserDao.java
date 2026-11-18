package com.lms.dao;

import java.util.List;

import com.lms.pojo.User;

public interface UserDao {

	public User checkLogin(String username, String password);
	
	public List<User> getAllUserList();
	
	public Boolean addUser(User user);
	
	public User getUserById(long userid);
	
	public boolean updateUser(User user);
}
