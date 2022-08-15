package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.factoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		try 
		{
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			response.setContentType("text/html");
			PrintWriter out= response.getWriter();
			System.out.println(title);
			System.out.println(content);
			
			Note note = new Note(title,content,new Date());
			
			System.out.println(note.getId()+":"+note.getTitle());
			
			Session s=factoryProvider.getFactory().openSession();
			Transaction tx= s.beginTransaction();
			s.save(note);
			out.println("<h3>Note saves successfully</h3>");
			out.println("<h3><a href='show_Notes.jsp'>Show all notes </a></h3>");
			tx.commit();
			s.close();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		
		
		// TODO Auto-generated method stub
//		doGet(request, response);
	}

}
