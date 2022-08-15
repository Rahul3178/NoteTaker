package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.factoryProvider;


public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public updateServlet() {
        super();
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		 int note_Id=Integer.parseInt(request.getParameter("note_Id").trim());
		 String title=request.getParameter("title");
		 String content=request.getParameter("content");
		 Session s=factoryProvider.getFactory().openSession();
		 Transaction tx=s.beginTransaction();
		 
		 Note note=s.get(Note.class, note_Id);
		 
		 note.setTitle(title);
		 note.setContent(content);
		 note.setAddedDate(new Date());
		 
		 
		 
		 tx.commit();
		 
		 s.close();
		 response.sendRedirect("show_Notes.jsp");
	}

}
