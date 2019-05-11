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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" type="text/javascript"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" type="text/javascript"></script>


<script>
function amount(){
	var amount = 0 ;
	$('.test').each(function(){
		var count = $(this).text() 
		amount = amount + eval(count)
	});
	$('.amount').val(amount)
}


function plus(e){
	var qty = $(e.target).closest('.input-group').find(".form-control").val();
	qty = eval(qty) + 1 ;
	$(e.target).closest('.input-group').find(".form-control").val(qty);
	total(e);
}


function minus(e){
	var qty = $(e.target).closest('.input-group').find(".form-control").val();
	if(qty != 1){
	qty = eval(qty) - 1 ;
	$(e.target).closest('.input-group').find(".form-control").val(qty);
	}
	total(e);
}

function total(e){
	var qty = eval($(e.target).closest('.input-group').find(".form-control").val());
	var price = eval( $(e.target).closest("tr").find('.price').html());
	var total = qty * price;
	$(e.target).closest("tr").find('.test').html(total)
	amount();
	}

</script>

</head>

<body  onload="amount();">
<%@ include file="header.jsp"%>
<%
			ArrayList<Image> s = (ArrayList<Image>) request.getAttribute("gallery");

		%>
		<form class="px-5 py-3" action="buy">
<div class="container my-5">
<table class="table table-borderless table-hover">
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col" colspan="2">Product</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Total</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  
  
  <%for (int i = 0 ; i<s.size() ;i++) {
						Image obj = s.get(i);%>
  

    <tr>
      <div class="media">
  <th scope="row"  class="align-middle"><img src="images/<%=obj.getBase64image() %>" class="mr-3" alt="..." height="50px" width="50px"></th>
  <div class="media-body">
      <td colspan="2"  class="align-middle"><%=obj.getName() %></td>
      <td  class="align-middle price"><%=obj.getPrice() %></td>
      <td>
		 <span class="input-group" style =" position : relative; width : 120px;">
  <span class="input-group-prepend">
     <span class="input-group-text btn-sm rounded-0" onclick="minus(event)"><i class="fas fa-minus"></i></span>
  </span>
  <input type="text" name ="qty<%=i%>" class="form-control" value="1" >
  <span class="input-group-append">
    <span class="input-group-text btn-sm rounded-0"  onclick="plus(event)"><i class="fas fa-plus"></i></span>
  </span>
</span>
	  </td>
	   <td  class="align-middle">Rs. <span class="test"><%=obj.getPrice() %></span></td>
	   <td><button name="b" value="<%=obj.getPid() %>" class="btn btn-outline-dark"><i class="far fa-trash-alt"></i></button></td>
	          </div>
</div>
    </tr>
  
 
    <%} %>


    </tbody>
</table>
</div>
<div class = "container-fluid p-5 m-5">
	<div class = "row">
		<div class="col-md-4">
		
				
				
				 <%User u = (User)request.getAttribute("s"); 
	 if(u.getName() == null){ %>
	 <div class="form-group">
  <h5 class= "pb-4">Order Details</h5>
    <input type="text" class="form-control rounded-0 " name="n"  placeholder="Full Name" ></div>
  <div class="form-group">
    <input type="text" class="form-control  rounded-0" name="p"  placeholder="Phone number" >
  </div>
	  <div class="form-group">
    <input type="email" class="form-control rounded-0" name="e" placeholder="Email Address" >
  </div>
	<div class="form-group">
    <textarea class="form-control rounded-0" rows="5" name="a" placeholder = "Address" ></textarea>
  </div>
	
 <%}else{ %>
 
 	<dl class="row">
  <dt class="col-sm-3">Name :</dt>
  <dd class="col-sm-9"><p> 
 	<input type="text" name="n" placeholder="Name" readonly value="<%= u.getName() %>" required="required" class ="form-control rounded-0" />
  </p> </dd>
  
   <dt class="col-sm-3">Phone :</dt>
  <dd class="col-sm-9"> <p>
  <input type="text"	name="p" placeholder="9876543210" value="<%= u.getPhone() %>"  id="phone" onchange="phonenumber()" required="required" class ="form-control rounded-0" />
  		<span id="phoneSpan"
      class="invalid-feedback">
      Please enter a valid contact no.
    </span>
  </p>  </dd>
  
  	
  <dt class="col-sm-3">Email :</dt>
  <dd class="col-sm-9"> 
  <p> 
  <input type="text" name="e" placeholder="name@example.com" value="<%= u.getEmail() %>" required="required" class ="form-control rounded-0" id="email"  onchange ="ValidateEmail()" />
  	<span id="emailSpan" 
      class="invalid-feedback">
      Please enter a valid email address
    </span>
  </p> </dd>

 
  <dt class="col-sm-3">Address :  </dt>
  <dd class="col-sm-9"><p>
    <textarea name="a" class="form-control rounded-0"   rows="5" placeholder = "8th floor, 379 Hudson St, New York, NY 10018" ><%= u.getAddress() %></textarea>
  </p>
  </dd>

  
 <%} %>
		</div>
        <div class="col-md-8">
        <div class="container" >
        <div class="card mx-auto" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title">Cart Total</h5>
    <div class="form-group row">
<label class="col-sm-8 col-form-label">Amount : Rs. </label>
<div class="col-sm-4" style="margin-left: -5rem;">
<input type="text" name="amt" readonly class="form-control-plaintext amount"/></div></div>
     <p class="card-text">Payment : <span>Cash on Delivery</span></p>
	 <button name="b" type="submit" value="Place order"class="btn btn-dark">Place order</button>
			</form>
  </div>
</div>
	
			</div>
		</div>
	</div>

</div>


<%@ include file="footer.jsp"%>
</body>
</html>