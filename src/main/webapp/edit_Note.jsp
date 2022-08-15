<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@include file="all_js_css.jsp"%>
<%@page import="com.helper.factoryProvider"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Note</title>
</head>
<%@include file="all_js_css.jsp"%>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
	</div>

	<%
	int note_id = Integer.parseInt(request.getParameter("node_Id").trim());
	System.out.println(note_id);
	Session s = factoryProvider.getFactory().openSession();

	Note u_note = (Note) s.get(Note.class, note_id);
	%>

	<!--this is form  -->
	<div class="container"
		style="height: 600px; width: 800px; padding: 30px; margin-top: 30px;">
		<div class="container text-centre">
			<h3 class="mb-3">Update Note!</h3>
		</div>
		<form method="POST" action="updateServlet">
			<div class="mb-3">
				<input name="title" type="text" class="form-control" required
					value="<%=u_note.getTitle()%>"></input>
					<!-- bcz we need id to fetch data from database -->
					<input name="note_Id" type="hidden" class="form-control" 
					value="<%=u_note.getId()%>"></input>

			</div>
			<div class="mb-3">
				<TextArea name="content" type="text" class="form-control"
					id="content" Style="height: 400px;" required
					placeholder="Enter Note Content here..."><%=u_note.getContent()%></TextArea>
			</div>


			<button type="submit" class="btn btn-primary">Update</button>
			<!--  <button type="reset" class="btn btn-success">Clear</button>-->


		</form>

	</div>
</body>
</html>