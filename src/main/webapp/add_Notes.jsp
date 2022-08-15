<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
	</div>
	<!--this is form  -->
	<div class="container" style="height:600px; width:800px; padding:30px; margin-top:30px;">
		<div class="container text-centre">
		<h3 class="mb-3">Add new Note!</h3>
		</div>
		<form method="POST" action="SaveNoteServlet">
			<div class="mb-3">
				<input name="title" type="text" class="form-control" required id="title"
					placeholder="Enter Note Title here....">

			</div>
			<div class="mb-3">
				<TextArea name="content" type="text" class="form-control" id="content"
					Style="height:400px;" required placeholder="Enter Note Content here..."></TextArea>
			</div>
			
			
			<button type="submit" class="btn btn-primary">Add</button>
			<button type="reset" class="btn btn-primary">Clear</button>
			

		</form>

	</div>
</body>
</html>