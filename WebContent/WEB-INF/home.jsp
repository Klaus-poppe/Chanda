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
.w3ls-icons li {
    display: inline-block;
    margin: 0 1em;
}
ul.list-unstyled.w3ls-icons.clients li {
    margin: 0 0.2em;
    text-align: center;
}

ul.list-unstyled.w3ls-icons.clients li span {
    color: #ffffff;
    font-size: 0.8em;
}

ul.list-unstyled.w3ls-icons.clients li span:hover {
    color: #048e6c;
    transition: 0.5s all;
    -webkit-transition: 0.5s all;
    -moz-transition: 0.5s all;
    -o-transition: 0.5s all;
    -ms-transition: 0.5s all;

}
.test-info-w3ls {
    text-align: center;
    padding: 2em 4em;
}

.wrapper{
background-color:#202020
}
.overlay{
opacity : 0.7
}
.about-in .card {
    border: none;
    background: none;
}
.about-in .card i {
    font-size: 1.5em;
    margin-bottom: 0.7em;
    color: #30c39e;
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

<section id="categories"  style="background:#EBEDEF;padding-bottom:6rem" >

<div class="mx-auto" style="width: 200px;">
  <h4 class="Display-4 mx-auto pt-5 pl-5">Categories</h4>
</div>
<div class="container py-5"  >
<div class="card-columns" >
  <div class="card text-center" style="margin-top:7rem ;">
    <img class="card-img-top" src="images/kitchen.jpg" style=" height:100%;max-height:20rem;" alt="Card image cap" >
    <div class="card-body">
      <h5 class="card-title">Kitchen</h5>
      <p class="card-text">Shop kitchen furniture at Chanda Furniture Guaranteed low prices on all modern kitchen chairs, stools, tables and more</p>
    <a  href="Display?cat=Kitchen" class="btn btn-outline-dark">Buy now</a>
    </div>
  </div>
 <div class="card text-center" >
    <img class="card-img-top" src="images/living.png" style=" height:100%;max-height:20rem;" alt="Card image cap" >
    <div class="card-body">
      <h5 class="card-title">Living room</h5>
      <p class="card-text">Your living room is one of the most important rooms,it also serves as a home’s showcase and focal point and we are here to help with that</p>
    <a  href="Display?cat=Living room" class="btn btn-outline-dark">Buy now</a>
    </div>
  </div>
  <div class="card text-center" >
    <img class="card-img-top" src="images/office.jpg" style=" height:100%;max-height:20rem;" alt="Card image cap">
    <div class="card-body">
      <h5 class="card-title">Office</h5>
      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
    <a  href="Display?cat=Office" class="btn btn-outline-dark">Buy now</a>
    </div>
  </div>
  <div class="card text-center" style="margin-top:10rem;">
    <img class="card-img-top" src="images/bedroom.jpg" style=" height:100%;max-height:20rem;" alt="Card image cap" >
    <div class="card-body">
      <h5 class="card-title">Bedroom</h5>
      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
   		<a  href="Display?cat=Bedroom" class="btn btn-outline-dark">Buy now</a>
    </div>
  </div>
</div>
</div>

</section>


<section id="about" style="background : #fff">


<div class= "container py-5" style="margin-top : -50px ;">
	<div class="row">
                    <div class="col-lg-6 ">
                        <img src="images/light.jpg" alt="" class="img-fluid">
                    </div>
                    <div class="col-lg-6 ">
                        <h3 class="text-muted">About Us</h3>
                        <h4>Showcase your work in a new way</h4>
                        <p class="my-4 text-muted">Lorem ipsum dolor sit amet Neque porro quisquam est qui dolorem Lorem int ipsum dolor sit amet when an unknown printer took a galley of type.Vivamus id tempor felis. Cras sagittis mi sit amet malesuada mollis. Mauris porroinit consectetur cursus tortor vel interdum. </p>
                        <!--/about-in-->
                        <div class="row">
                            <div class="col-lg-6 about-in text-left">
                                <div class="card">
                                    <div class="card-body">
                                        <i class="fas fa-anchor"></i>
                                        <h5 class="card-title"> Branch 1</h5>
                                        <p class="card-text text-muted">Lorem ipsum dolor sit amet consectetur elit
                                        </p>
                                    </div>
                                </div>

                            </div>
                            <div class="col-lg-6 about-in text-left">
                                <div class="card">
                                    <div class="card-body">
                                        <i class="far fa-map"></i>
                                        <h5 class="card-title"> Branch 2</h5>
                                        <p class="card-text text-muted">Lorem ipsum dolor sit amet consectetur elit
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!--//about-in-->
                    </div>
                </div>


</div>


</section>




<section style="background: #faad83;" id="feedback" >


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
	 
<div class= "container-fluid py-5" >
	<div class="row">
		<div class = "col-md-8 p-5">
		<div class="container p-5 mx-5">
            <div class="text-center">
                <h3 class=" mb-lg-5 mb-3"> Client Reviews</h3>
            </div>
            <div class="row">
                <div class="col-md-6 test-info-w3ls text-left">
                    <p><span class="fa fa-quote-left"></span> Lorem Ipsum has been the industry's standard since the 1500s. Praesent ullamcorper dui turpis.Nulla pellentesque mi non laoreet eleifend. Integer porttitor mollisar lorem, at molestie arcu pulvinar ut. <span class="fa fa-quote-right"></span></p>

               
                    <h3 class="my-md-2 my-3 text-right">Jenifer Burns</h3>

                    <ul class="list-unstyled w3ls-icons clients text-right">
                        <li>
							<span class="fa fa-star"></span>
					
                        </li>
                        <li>
							<span class="fa fa-star"></span>
						
                        </li>
                        <li>
							<span class="fa fa-star"></span>
						
                        </li>
                        <li>
							<span class="fa fa-star"></span>
						
                        </li>
                        <li>
							<span class="fa fa-star"></span>
						
                        </li>
                      
                    </ul>
                </div>
                <div class="col-md-6 test-info-w3ls text-left">
                    <p><span class="fa fa-quote-left"></span> Lorem Ipsum has been the industry's standard since the 1500s. Praesent ullamcorper dui turpis.Nulla pellentesque mi non laoreet eleifend. Integer porttitor mollisar lorem, at molestie arcu pulvinar ut. <span class="fa fa-quote-right"></span></p>

                    <h3 class="my-md-2 my-3 text-right"> Abraham Smith</h3>

                    <ul class="list-unstyled w3ls-icons clients text-right">
                        <li>
                      		<span class="fa fa-star"></span>
						
                        </li>
                        <li>
							<span class="fa fa-star"></span>
					
                        </li>
                        <li>
							<span class="fa fa-star"></span>
						
                        </li>
                        <li>
							<span class="fa fa-star"></span>
						
                        </li>
                    </ul>
                </div>
            </div>
        </div>
		</div>
		<div class = "col-md-4 p-5 ">
		<div class="text-center">
                <h3 class=" mb-lg-5 mb-3">Submit a review!</h3>
            </div>
				<form class="px-5" action="feedback" method="post">
				
  <div class="form-group shadow">
    <input type="text" class="form-control  "  name="n" placeholder="Full Name" style = "height : 3rem;">
  </div>
  <div class="form-group shadow">
    <input type="text" class="form-control "  placeholder="Phone number" name="p" style = "height : 3rem;">
  </div>
	  <div class="form-group shadow">
    <input type="email" class="form-control "  placeholder="Email Address" name="e" style = "height : 3rem;">
  </div>
	<div class="form-group border shadow">
    <textarea class="form-control" rows="5" placeholder = "Write a review!" name="m"  required></textarea>
  </div>
  
  <button type="submit" class="btn btn-dark shadow">Submit</button>
</form>
	</div>
</div>
</div>
</section>



<%@ include file="footer.jsp"%>


</body>
</html>