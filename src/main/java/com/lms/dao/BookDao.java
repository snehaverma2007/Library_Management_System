package com.lms.dao;

import java.util.List;

import com.lms.pojo.Book;
import com.lms.pojo.BookIssued;

public interface BookDao {
	
	public boolean addBook(Book book);
	
	public boolean updateBook(Book book);
	
	public List<Book> getAllBookList();
	
	public List<Book> getAllBookByStatus(String status);
	
	public List<Book> getAllAvailableBookList();
	
	public Book getBookById(long bookId);
	
	public boolean assginBook(BookIssued bookIssued);
	
	public boolean updateAvailableBook(long bookId, int availableCopies);
	
	public boolean updateBookReturn(BookIssued bookIssued);        
	
	public List<BookIssued> getAllIssueBookList();
	
	public BookIssued getIssuedBookById(long issueId);
	
	public List<BookIssued> getIssuedBookListForDashboard();
}
