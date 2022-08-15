package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.factoryProvider;


public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int note_id=Integer.parseInt(request.getParameter("node_Id").trim());
			System.out.println(note_id);
			Session s=factoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			Note d_note=(Note) s.get(Note.class,note_id);
			s.delete(d_note);
			tx.commit();
			s.close();
			
			response.sendRedirect("show_Notes.jsp");
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	
}
