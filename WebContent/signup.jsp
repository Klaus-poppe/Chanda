<%@page import="Model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chanda Furniture</title>
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
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">



<script>
function Check() {
	ValidateEmail();
	phonenumber();
	passCheck();
	if($('#emailSpan').css("display") === "block" || $('#phoneSpan').css("display") === "block" || $('#passSpan').css("display") === "block")
	{	
	$('#myForm').submit(function(event){
			event.preventDefault();
		}); 
	}else{
		$('#myForm').submit(function(event){
			var self =this ;
			self.submit();
		}); 
	}
}

function ValidateEmail() 
{
	var x = document.getElementById("email");
	var y = x.value;
	var z = document.getElementById("emailSpan");
	var re = new RegExp(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/);
 if (!re.test(y))
  {
	
	 z.style.display = "block";
	 x.classList.add('is-invalid');
  }else{
	  z.style.display = "none";
	  x.classList.remove('is-invalid');
	//  x.classList.add('is-valid');
  }
}

function phonenumber()
{
	var x = document.getElementById("phone");
	var y = x.value;
	var z = document.getElementById("phoneSpan");
  var phoneno = /^\d{10}$/;
  if(!phoneno.test(y))
        {
	  	z.style.display = "block";
		 x.classList.add('is-invalid');
        }else{
      	  z.style.display = "none";
    	  x.classList.remove('is-invalid');
    	 // x.classList.add('is-valid');
        }
}

function passCheck(){
	var x = document.getElementById("pass1");
	var y = document.getElementById("pass2");
	var z = document.getElementById("passSpan");
	if(x.value != y.value && y.value != ""){
		z.style.display = "block";
		 y.classList.add('is-invalid');
	}else{
    	  z.style.display = "none";
    	  y.classList.remove('is-invalid');
    	 // y.classList.add('is-valid');
    }
}

</script>
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
<style>

/* input:not(:focus) {
font-style:italic;
} */

/* ::-webkit-input-placeholder {
   font-style: italic;
}
:-moz-placeholder {
   font-style: italic;
}
::-moz-placeholder {
   font-style: italic;  
}
:-ms-input-placeholder {  
   font-style: italic;
} */

/*
input::placeholder {
  color: green;
}*/
</style>

</head>




<body>

<%@ include file="header.jsp"%>

 
 <% String error = (String) request.getAttribute("error");  
    		if(error != null){ %>
<div class = "container" style =" padding-top : 2rem" >
  	
    		 <div class="alert alert-warning alert-dismissible fade show alert-fixed" role="alert">
  <h4 class = "alert-heading"><strong>OOPS!</strong></h4>
  <hr>
    <%= error %>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</div>
	 <%} %>
	 
	 <% User u = (User)request.getAttribute("s");
	 if(u != null){
	 %>
 
 <div class = "container mx-auto" style = " margin : 5rem">
<form action="signup" method="post" id="myForm">

	<dl class="row">
  <dt class="col-sm-4">Name :</dt>
  <dd class="col-sm-8"><p> 
 	<input type="text" name="n" placeholder="Name" value="<%= u.getName() %>" required="required" class ="form-control rounded-0" />
  </p> </dd>

  <dt class="col-sm-4">Email :</dt>
  <dd class="col-sm-8"> 
  <p> 
  <input type="text" name="e" placeholder="name@example.com" value="<%= u.getEmail() %>" required="required" class ="form-control rounded-0" id="email"  onchange ="ValidateEmail()" />
  	<span id="emailSpan" 
      class="invalid-feedback">
      Please enter a valid email address
    </span>
  </p> </dd>

  <dt class="col-sm-4">Phone :</dt>
  <dd class="col-sm-8"> <p>
  <input type="text"	name="ph" placeholder="9876543210" value="<%= u.getPhone() %>"  id="phone" onchange="phonenumber()" required="required" class ="form-control rounded-0" />
  		<span id="phoneSpan"
      class="invalid-feedback">
      Please enter a valid contact no.
    </span>
  </p>  </dd>
  
  <dt class="col-sm-4">Address :  </dt>
  <dd class="col-sm-8"><p>
    <textarea name="ad" class="form-control rounded-0"   rows="5" placeholder = "8th floor, 379 Hudson St, New York, NY 10018" ><%= u.getAddress() %></textarea>
  </p>
  </dd>
  
  <%}else{ %>
  <div class = "container mx-auto" style = " margin : 5rem">
<form action="signup" method="post" id="myForm">

	<dl class="row">
  <dt class="col-sm-4">Name :</dt>
  <dd class="col-sm-8"><p> 
 	<input type="text" name="n" placeholder="Name"  required="required" class ="form-control rounded-0" />
  </p> </dd>

  <dt class="col-sm-4">Email :</dt>
  <dd class="col-sm-8"> 
  <p> 
  <input type="text" name="e" placeholder="name@example.com" required="required" class ="form-control rounded-0" id="email"  onchange ="ValidateEmail()" />
  	<span id="emailSpan" 
      class="invalid-feedback">
      Please enter a valid email address
    </span>
  </p> </dd>

  <dt class="col-sm-4">Phone :</dt>
  <dd class="col-sm-8"> <p>
  <input type="text"	name="ph" placeholder="9876543210"  id="phone" onchange="phonenumber()" required="required" class ="form-control rounded-0" />
  		<span id="phoneSpan"
      class="invalid-feedback">
      Please enter a valid contact no.
    </span>
  </p>  </dd>
  
  <dt class="col-sm-4">Address :  </dt>
  <dd class="col-sm-8"><p>
    <textarea name="ad" class="form-control rounded-0"   rows="5" placeholder = "8th floor, 379 Hudson St, New York, NY 10018" ></textarea>
  </p>
  </dd>
  
   <dt class="col-sm-4">Password :</dt>
  <dd class="col-sm-8"><p>  
     <input	type="password" name="p" placeholder="abc@123" onchange ="passCheck()"  required="required" id="pass1" class ="form-control rounded-0" /> 
 </p> </dd>
  
    <dt class="col-sm-4">Confirm Password :</dt>
  <dd class="col-sm-8"><p>
 <input type="password" name="cp" placeholder="Confirm Password"  onchange ="passCheck()" id="pass2"	required="required" class ="form-control rounded-0" />
  <span id="passSpan"
      class="invalid-feedback">
      passwords doesn't match
    </span>
</p> </dd>
  </dl>

<p class="text-right">	<input type="submit" name="b1" value="Sign Up"	onmousedown="Check()" class="btn btn-dark rounded-0" /></p>
<%} %>
</form>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
