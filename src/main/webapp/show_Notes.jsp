<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@include file="all_js_css.jsp"%>
<%@page import="com.helper.factoryProvider"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes</title>

</head>
<%@include file="all_js_css.jsp"%>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
	</div>

	<div class="row ">
		<div class="col-12 ">
			<%
			Session s = factoryProvider.getFactory().openSession();

			Query q = s.createQuery("from Note");
			List<Note> note = q.list();
			for (Note no : note) {
			%>
			<div class="card mb-3 " style="">
				<img src="snaps/notepad.png" class="card-img-top mx-auto" alt="..." Style="height:50px; width:50px;">
				<div class="card-body text-center px-5">
					<h5 class="card-title"><%=no.getTitle() %></h5>
					<p class="card-text"><%=no.getContent() %></p>
					<p><b class="text-primary"><%=no.getAddedDate()%></b></p>
					<div class="container text-center ">
					<a href="DeleteServlet?node_Id=<%=no.getId() %>" class="btn btn-outline-danger px-5">Delete</a>&nbsp
					<a href="edit_Note.jsp?node_Id=<%=no.getId() %>" class="btn btn-outline-success px-5 ">Update</a>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>

	</div>
	

</body>
</html>