<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList, Model.Image"%>
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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
#myModal
{
z-index : 9999;
}
</style>
<script type="text/javascript">
  
function f1() {
$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var src = button.data('src')
	  var price = button.data('price')
	  var description = button.data('description')
	  var name = button.data('name')
	  var pid = button.data('id')
	  var modal = $(this)
 	   modal.find('.modal-body img').css('display' , 'initial')
 	$('#foot').css('display' , 'inherit')
	  modal.find('#pid').val(pid)
	  modal.find('.modal-title').text(name)
 	  modal.find('.text-muted').text(description)
	  modal.find('.price').text("Rs."+price)
	  modal.find('.modal-body img').attr("src","images/" + src);
	 
	})}

function add(){
	$('#myModal').modal('show');
}

function login(){
$('#title').html("Oops!")
	  var modal = $('#body')
 	   $('#body').find('.text-muted').text("Login to continue")
	  $('#body').find('.price').text(" ")
	   $('#img').css('display' , 'none')
	$('#foot').css('display' , 'none')

	
}
</script>
</head>

<body <%String msg = (String) request.getAttribute("msg"); 
		if(msg != null){ %>onload="add()"<%} %>>
<%@ include file="header.jsp"%>
<%
			ArrayList<Image> s = (ArrayList<Image>) request.getAttribute("gallery");
int total = (int) request.getAttribute("noOfPages");
int current = (int) request.getAttribute("currentPage");

		%>
		
<div class="modal" id="myModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Success</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p><%=msg %></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
		
<div class = "border border-dark  my-3">
  <img class= "w-100" src="images/shop.jpg"  style= "height : 35rem;" alt="Card image">
</div>
	<div class="container">
		<div class="row">
		
			<div class=" col-md-3 my-3 border ">
			<form action="Display">
				<h6 class="p-3 my-3 mx-3">
						<strong>FILTERS</strong>
						</h6>
						<hr>
						<strong class="p-3">Categories </strong><br>
						<ul style="list-style-type : none">
							<li class="my-2">
							
							 <input class="form-check-input" type="radio" name="cat" id="inlineRadio1" value="all" checked />
  							 <label class="form-check-label text-muted" for="inlineRadio1">All</label>
							</li>
							<li class="my-2">
							 <input class="form-check-input" type="radio" name="cat" id="inlineRadio1" value="Bedroom">
  							 <label class="form-check-label text-muted" for="inlineRadio1">Bedroom</label>
							</li>

							<li class="my-2">
									 <input class="form-check-input" type="radio" name="cat" id="inlineRadio1" value="Living room">
  							 <label class="form-check-label text-muted" for="inlineRadio1">Living room</label>
							</li>

							<li class="my-2">
									 <input class="form-check-input" type="radio" name="cat" id="inlineRadio1" value="Kitchen">
  							 <label class="form-check-label text-muted" for="inlineRadio1">Kitchen</label>
							</li>
							
							<li class="my-2">
									 <input class="form-check-input" type="radio" name="cat" id="inlineRadio1" value="Office">
  							 <label class="form-check-label text-muted" for="inlineRadio1">Office</label>
							</li>
							
						</ul>
	
			
			
						<hr>
								<strong class="p-3">Price </strong><br>
				<div class="form-group p-3 form-inline">
					
						<input type="text" style="width:6rem" value="" placeholder="Rs.0" class="form-control" id="amount1" name="min" > 
						<span class="p-2">-</span>  
						<input type="text" style="width:6rem" value="" placeholder="Rs.100000" class="form-control" id="amount2" name="max">
						<button type="submit" style="margin-left: 60%" class=" mt-3 btn btn-outline-secondary">Apply</button>
					
					</div>
					
					</form>
			</div>
			<div class="col-9">
						<div class="row p-3">
					<div class="card-deck" style="height : 25rem ; width : 60rem ; position : relative;">
					<% for (int i = 0 ; i<2 && i<s.size() ;i++) {
						Image obj = s.get(i);%>
						
						<div class="card" >
						<a data-toggle="modal" href="#exampleModal" onclick="f1()" data-name="<%=obj.getName() %>" data-price="<%=obj.getPrice() %>" data-id="<%=obj.getPid() %>" data-description="<%=obj.getDescription() %>" data-src="<%=obj.getBase64image()%>"  style="height : 100% ; width : 100%">
							<img src="images/<%=obj.getBase64image()%>" class="card-img-top" alt="..."  style="height : 100% ; width : 100%"/>
						</a>
						</div>
						<%} %>	
						
					</div>
				</div>
				
				<div class="row p-3">
					<div class="card-deck" style="height : 25rem ; width : 60rem">
						<% for (int i = 2 ; i<4 && i<s.size() ;i++) {
						Image obj = s.get(i);%>
						
						<div class="card" >
								<a data-toggle="modal" href="#exampleModal" onclick="f1()" data-name="<%=obj.getName() %>" data-price="<%=obj.getPrice() %>" data-id="<%=obj.getPid() %>" data-description="<%=obj.getDescription() %>" data-src="<%=obj.getBase64image()%>"  style="height : 100% ; width : 100%">
							<img src="images/<%=obj.getBase64image()%>" class="card-img-top" alt="..."  style="height : 100% ; width : 100%">
						</a>
						</div>
						<%} %>	
						
					</div>
				</div>
				<div class="row p-3">
					<div class="card-deck" style="height : 25rem ; width : 60rem">
						<% for (int i = 4 ; i<6 && i<s.size() ;i++) {
						Image obj = s.get(i);%>
						<div class="card"  >
						<a data-toggle="modal" href="#exampleModal" onclick="f1()" data-name="<%=obj.getName() %>"  data-price="<%=obj.getPrice() %>" data-id="<%=obj.getPid() %>"  data-description="<%=obj.getDescription() %>" data-src="<%=obj.getBase64image()%>"  style="height : 100% ; width : 100%">
							<img src="images/<%=obj.getBase64image()%>" class="card-img-top" alt="..."  style="height : 100% ; width : 100%">
						</a>
						</div>
						<%} %>	
						<!-- data:image/;base64, -->
	
					</div>
				</div>
				
				<%-- 	<div class="row p-3">
					<div class="card-deck" style="height : 25rem ; width : 60rem; ">
						<% for (int i = 0 ; i<2 && i<s.size() ;i++) {
						Image obj = s.get(i);%>
						<div class="card" >
							<img src="images/<%=obj.getBase64image()%>" class="card-img-top" alt="..."  style="height : 100% ; width : 100%">
						</div>
						<%} %>	
						<!-- data:image/;base64, -->
	
					</div>
				</div> --%>
				
				

				<nav class = "p-3 text-muted" aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<% if(current != 1) { %>
						<li class="page-item"><a class="page-link text-dark" href="Display?page=<%=current-1%>"
							tabindex="-1"><span aria-hidden="true">&laquo;</span></a></li>
							<%}%>
					<% 
					for (int i = 1 ; i<=total ;i++) { %>
						<li class="page-item"><a class="page-link text-dark" href="Display?page=<%=i%>"><%=i%></a></li>
						<%} %>		
						<% if(current < total) { %>
						<li class="page-item"><a class="page-link text-dark" href="Display?page=<%=current+1%>"><span aria-hidden="true">&raquo;</span></a>
						</li>	<%} %>	
					</ul>
				</nav>

			</div>

		</div>
	</div>


		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg .modal-dialog-scrollable" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="title">Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
         </div>
      <div class="modal-body" id="body">
      <div class=row>
       <div class = "col-9">
       <p class="text-muted">Description</p>
       </div>
       <div class = "col-3">
       <span class="price">price</span>
       </div>
      </div>
        <img src="" id="img" class="card-img-top" alt="..."  style="height : 100% ; width : 100%"/>
      </div>
      <div class="modal-footer" id="foot">
        <%
		
if(session.getAttribute("n") != null){
	%>
      <form action="add" method="post">
          <input type="hidden" name="pid" id="pid">
          <input type="submit" name="b"  class="btn btn-dark" value="Add to cart"/> 
        <input type="submit" name="b" class="btn btn-dark" value="Buy now"/>
     	</form>
     	<%}else{ %>
     	 <input  type="button" class="btn btn-dark" onclick="login()" value="Add to cart"/> 
        <input  type="button" class="btn btn-dark" onclick="login()" value="Buy now"/>     	
     	<%} %>
      </div>
    </div>
  </div>
</div>


	<%@ include file="footer.jsp"%>
</body>
</html>