<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import=" Model.*"%>
<%@page import="java.util.*"%> 
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<Style>
.icon-bar {
  position: fixed;
  top: 92%;
  -webkit-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
  z-index : 999;
}

.icon-bar p {
  display: block;
  text-align: center;
  padding: 16px;
  transition: all 0.3s ease;
  color: white;
  font-size: 20px;
}

.icon-bar p:hover {
  background-color: #000;
}


.google {
  background: #dd4b39;
  color: white;
}

</Style>
</head>

<body>
<div class ="shadow" >
<nav class="navbar navbar-expand-lg navbar-light bg-light" style = "height : 5rem">
<a class="navbar-brand" href="home">Chanda</a>
<div class= "mx-auto" >
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="home#home">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Display">Shop</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="home#about">About</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="home#feedback">Feedback</a>
      </li>
      </ul>
</div >  
	<ul class="navbar-nav">    
      <li class="nav-item dropdown">
        <a style="margin-right : 20px" class="nav-link dropdown-toggle btn-lg" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="  fas fa-user-circle" ></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
        <%
		String name = (String) session.getAttribute("n");
if(session.getAttribute("n") == null){
	%>
        	<a class="dropdown-item"  data-toggle="modal" data-target="#exampleModal1" >Sign In</a>
        		<div class="dropdown-divider"></div>
        	<a class="dropdown-item" href="profile">Sign Up</a>
        	<%}else{ %>
        	<div class="px-4"><Strong>Welcome, </Strong><br>
        	 <%=name%>     	
        	</div>
        	  <div class="dropdown-divider"></div>
        	<a class="dropdown-item" href="profile">Profile</a>
        		<div class="dropdown-divider"></div>
        	<a class="dropdown-item" href="signout">Sign out</a>
        	
        	<%} %>
      </li>
      <%Dao db = new Dao();
		int uid = db.selectUser(name);
		 ArrayList<Image> gallery = db.getCart(uid);
		%>
      
        <li class="nav-item dropdown">
        <a style="margin-right : 20px" class="nav-link dropdown-toggle btn-lg" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" >
          <i class="fas fa-shopping-cart"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" >
        <%if(gallery.size() != 0){ %>
          <% for (int i = 0 ; i< gallery.size() ;i++) {
						Image obj = gallery.get(i);%>
						<span class="dropdown-item ">
						<span class="media">
  						<img src="images/<%=obj.getBase64image()%>" class="mr-3" alt="..." height="25px" width = "25px">
  						<span class="media-body">
     					<%=obj.getName()%>&nbsp&nbsp&nbsp&nbsp&nbsp Rs. <%=obj.getPrice() %>
						</span></span></span>
						<div class="dropdown-divider"></div>
         			<%} %>
         			<a class = "btn btn-dark btn-sm" style="margin-left:8rem" href = "cart">Buy</a>
             <%}else{ %>
             <p class="ml-2">No items in cart &nbsp&nbsp&nbsp&nbsp&nbsp </p>
             <div class="dropdown-divider"></div>
             <a class = "btn btn-dark btn-sm" style="margin-left:6rem" href = "cart">Buy</a>
          <%} %>
          
        </div>
      </li>
    </ul>
</nav>
</div>

<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Sign In</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="signin" method="post" >
  <div class="form-group">
    <label>Name or Email:</label>
    <input type="text" name="u" placeholder="Name or email" required="required" class ="form-control"  />
  </div>
  <div class="form-group py-3">
    <label>Password:</label>
    <input	type="password" name="p" placeholder="Password" required="required" class ="form-control" />
  </div>
  

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <input type="submit" name="b1" value="Sign In" class="btn btn-dark btn-block" />
</form>
      </div>
    </div>
  </div>
</div>

<div class="icon-bar ">
  <p class="google shadow border">For any issues<br>please contact us at <br> <i class="fas fa-phone"></i> : <u>9587-104-922</u> </p> 
</div>


</body>
</html>