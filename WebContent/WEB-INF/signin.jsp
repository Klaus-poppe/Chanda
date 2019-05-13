<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chanda Furniture</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" type="text/javascript"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" type="text/javascript"></script>

</head>
<style>
.alert-fixed {
    position:fixed; 
    top: 0px; 
    left: 0px; 
    width: 100%;
    z-index:9999; 
    border-radius:0px
}
</style>
<body>
	
	<!-- SIGNUP FORM  -->
	
<div class="container">
<% String error = (String) request.getAttribute("msg");  
if(error.equals("Registered succesfully")){ %>
<div class = "container" style =" padding-top : 2rem" >
  	
    		 <div class="alert alert-success alert-dismissible fade show alert-fixed" role="alert">
   <strong><%= error %></strong> , Login to continue
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</div>
	 <%}else if(error != null){%>
		<div class = "container" style =" padding-top : 2rem" >
  	
    		 <div class="alert alert-danger alert-dismissible fade show alert-fixed" role="alert">
   <strong><%= error %></strong> , Try again
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</div>			 
	 <% } %>
</div>
<div class = "container " style = "padding-top: 10rem">
<div class = "row">	
<div class ="col-md-4 offset-md-4">
<div class="border shadow-lg p-4">
<h2 class="py-2" >Sign In</h2>
<form action="signin" method="post" >
  <div class="form-group">
    <label>Name or Email:</label>
    <input type="text" name="u" placeholder="Name or email" required="required" class ="form-control"  />
  </div>
  <div class="form-group py-3">
    <label>Password:</label>
    <input	type="password" name="p" placeholder="Password" required="required" class ="form-control" />
  </div>
  
<input type="submit" name="b1" value="Sign In" class="btn btn-dark btn-block" />
</form>
</div>
</div>
</div>
</div>

</body>
</html>
