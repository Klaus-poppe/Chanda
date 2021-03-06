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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
#footer {
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  padding: 1rem;
  background: #efefef;
  height : 22rem ;	
}
html {
  height: 100%;
  box-sizing: border-box;
}

*,
*:before,
*:after {
  box-sizing: inherit;
}

body {
  position: relative;
  margin: 0;
  padding-bottom: 22rem;
  min-height: 100%;
}
</style>
</head>

<body>

<div class = "container-fluid" id="footer"  >
	<div class = "row p-5">
		<div class = "col-4">
		<div class = "mx-3">
					<h6 class="p-2 my-3">
					GET IN TOUCH
				    </h4>
				<p class="p-2 text-muted">
						Any questions? Let us know in store at  Sector-3, Jagdamba Colony, Vidyadhar Nagar, Jaipur, Rajasthan 302032 or call us on (+91) 958-710-4922
					</p>
			</div>
		</div>	
		<div class = "col-2">
			<h6 class="p-2 my-3 mx-4">
					CATEGORIES
				</h6>

				<ul style = "list-style-type : none">
					<li class="my-2">
						<a href="Display?cat=Kitchen" class="text-muted">
							Kitchen
						</a>
					</li>

					<li class="my-2">
						<a href="Display?cat=Living room" class="text-muted">
							Living room
						</a>
					</li>

					<li class="my-2">
						<a href="Display?cat=Office" class="text-muted">
							Office
						</a>
					</li>

					<li class="my-2">
						<a href="Display?cat=Bedroom" class="text-muted">
							Bedroom
						</a>
					</li>
				</ul>
		
		</div>	
		<div class = "col-2">
			<h6 class="p-2 my-3 mx-4">
					USEFUL LINKS
				</h6>

				<ul style = "list-style-type : none">
					<li class="my-2">
						<a href="home#home" class="text-muted">
							Home
						</a>
					</li>

					<li class="my-2">
						<a href="Display" class="text-muted">
							Shop
						</a>
					</li>

					<li class="my-2">
						<a href="profile" class="text-muted">
							Profile
						</a>
					</li>

					<li class="my-2">
						<a href="cart" class="text-muted">
							Cart
						</a>
					</li>
					<li class="my-2">
						<a href="https://www.privacypolicygenerator.info/live.php?token=NlGHx0DaeEorOXZAw3KuVz1m9EZ39yph" class="text-muted">
							Privacy
						</a>
					</li>
				</ul>
		</div>	
		<div class = "col-4">
		 <h6 class= "p-2 my-2 mx-4">CONTACT US</h6>
			<form class = "mx-3 px-3" action="feedback" method="post">	
  <div class="pb-2">
    <input type="text" class="form-control form-control-sm rounded-0 " name="n" placeholder="Full Name" style="width : 25rem">
  </div>
  <div class="pb-2">
    <input type="email" class="form-control form-control-sm rounded-0" name="e" placeholder="Email id" style="width : 25rem">
  </div>
	
	<div class="pb-2">
    <textarea class="form-control form-control-sm rounded-0" id="exampleFormControlTextarea1" name="m" rows="3" required placeholder = "Message" style="width : 25rem"></textarea>
  </div>
  <div class =""><button type="submit" class="btn btn-dark btn-sm rounded-0">Submit</button></div>
</form>
		</div>	
	</div>
</div>
</body>
</html>