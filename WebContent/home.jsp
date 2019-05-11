<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.ArrayList, Model.*"%>
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

</head>
<style>
.wrapper{
background-color:#202020
}
.overlay{
opacity : 0.7
}
</style>

<body>

<%@ include file="header.jsp"%>


<%ArrayList<Banner> s = (ArrayList<Banner>) request.getAttribute("gallery"); %>

<section id="home">


<div class = "mt-3 mx-2 border border-dark">
<div id="carouselExampleIndicators" class="carousel slide " data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner wrapper">
  <% for (int i = 0 ; i<3  ;i++) {
					Banner obj = s.get(i);%> 
    <div class="carousel-item <%if(i==1){ %>active<%}%>">
      <img class="d-block w-100 overlay" src="images/<%=obj.getImage()%>"   style= "height : 50rem;">
       <div class="carousel-caption d-none d-md-block">
    <h3 class="Nooverlay">We Are The Best Designers Of <br> Interior Furniture</h5>
    <p><a href="Display" class="btn btn-outline-light">Explore</a></p>
  </div>
    </div>
    <%} %>	
   
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
</section>

<section id="categories" style="background:#EBEDEF" >

<div class="mx-auto" style="width: 200px;">
  <h4 class="Display-4 mx-auto p-5">Categories</h4>
</div>
<div class="container py-3"  >
<div class="card-columns" >
  <div class="card text-center" style="margin-top:7rem ;">
    <img class="card-img-top" src="images/kitchen.jpg"  alt="Card image cap" >
    <div class="card-body">
      <h5 class="card-title">Kitchen</h5>
      <p class="card-text">Shop kitchen furniture at Chanda Furniture Guaranteed low prices on all modern kitchen chairs, stools, tables and more</p>
    <a  href="Display?cat=Kitchen" class="btn btn-outline-dark">Buy now</a>
    </div>
  </div>
 <div class="card text-center" >
    <img class="card-img-top" src="images/living.png" alt="Card image cap" >
    <div class="card-body">
      <h5 class="card-title">Living room</h5>
      <p class="card-text">Your living room is one of the most important rooms,it also serves as a home’s showcase and focal point and we are here to help with that</p>
    <a  href="Display?cat=Living room" class="btn btn-outline-dark">Buy now</a>
    </div>
  </div>
  <div class="card text-center" >
    <img class="card-img-top" src="images/office.jpg" alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title">Office</h5>
      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <a  href="Display?cat=Office" class="btn btn-outline-dark">Buy now</a>
    </div>
  </div>
  <div class="card text-center" style="margin-top:10rem;">
    <img class="card-img-top" src="images/bedroom.jpg" alt="Card image cap" >
    <div class="card-body">
      <h5 class="card-title">Bedroom</h5>
      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
   		<a  href="Display?cat=Bedroom" class="btn btn-outline-dark">Buy now</a>
    </div>
  </div>
</div>
</div>

</section>

<section id="about" style="background : #1C2833">

<div class="mx-auto" style="width: 300px;">
  <h4 class="Display-4 mx-auto p-5 text-white">About Us</h4>
</div>
<div class= "container py-5" style="margin-top : -50px">
	<div class="row">
		<div class = "col-md-4">
			  <img class= "w-100" src="images/test.jpg"  style= "height : 30rem;" alt="Card image">
		</div>
		<div class = "col-md-8">
					<h3 class="text-white">
						Our story
					</h3>

					<p class="text-muted">
						Phasellus egestas nisi nisi, lobortis ultricies risus semper nec. Vestibulum pharetra ac ante ut pellentesque. Curabitur fringilla dolor quis lorem accumsan, vitae molestie urna dapibus. Pellentesque porta est ac neque bibendum viverra. Vivamus lobortis magna ut interdum laoreet. Donec gravida lorem elit, quis condimentum ex semper sit amet. Fusce eget ligula magna. Aliquam aliquam imperdiet sodales. Ut fringilla turpis in vehicula vehicula. Pellentesque congue ac orci ut gravida. Aliquam erat volutpat. Donec iaculis lectus a arcu facilisis, eu sodales lectus sagittis. Etiam pellentesque, magna vel dictum rutrum, neque justo eleifend elit, vel tincidunt erat arcu ut sem. Sed rutrum, turpis ut commodo efficitur, quam velit convallis ipsum, et maximus enim ligula ac ligula. Vivamus tristique vulputate ultricies. Sed vitae ultrices orci.
					</p>

					<blockquote class="blockquote  text-right">
						<p class="mb-0 text-white-50">
							Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they didn't really do it, they just saw something. It seemed obvious to them after a while.
						</p>

						 <footer class="blockquote-footer">
							 Steve Job’s
						</footer>
					</blockquote>
		</div>
	</div>

</div>


</section>

<section id="feedback" >
<div class="mx-auto" style="width: 300px;">
  <h4 class="Display-4 mx-auto p-5">Feedback</h4>
</div>

<% String error = (String) request.getAttribute("msg");  
    		if(error != null){ %>
<div class = "container">
  	
    		 <div class="alert alert-success alert-dismissible fade show alert-fixed" role="alert">
    <%= error %>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</div>
	 <%} %>
	 
<div class= "container py-5" >
	<div class="row">
		<div class = "col-md-4">
			  <img class= "w-100" src="images/test.jpg"  style= "height : 30rem;" alt="Card image">
		</div>
		
		<div class = "col-md-8 px-5 ">
		
				<form class="px-5" action="feedback" method="post">
				
  <div class="form-group">
  <h3 class= "pb-4">Send us your message</h4>
    <input type="text" class="form-control rounded-0 "  name="n" placeholder="Full Name" style = "height : 3rem;">
  </div>
  <div class="form-group">
    <input type="text" class="form-control  rounded-0"  placeholder="Phone number" name="p" style = "height : 3rem;">
  </div>
	  <div class="form-group">
    <input type="email" class="form-control rounded-0"  placeholder="Email Address" name="e" style = "height : 3rem;">
  </div>
	<div class="form-group">
    <textarea class="form-control rounded-0" rows="5" placeholder = "Message" name="m"  required></textarea>
  </div>
  <button type="submit" class="btn btn-dark">Submit</button>
</form>
		</div>
	</div>

</div>
</section>


<%@ include file="footer.jsp"%>


</body>
</html>