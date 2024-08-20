<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Details</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'poppins',sans-serif;
}

.nav-bar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	position: sticky;
	top: 0;
	background: gray;
	padding: 0 0 0 30px;
}

ul {
	list-style: none;
	padding: 20px;
	text-align: right;
}

li {
	display: inline;
	margin: 0 5px;
}

a {
	color: white;
	text-decoration: none;
	letter-spacing: 1px;
	cursor: pointer;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
}

.product {
	width: fit-content;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 100px;
	border: 2px solid #edededf0;
	box-shadow: 0 0 7px #edededf0,0 0 10px #edededf0;
	border-radius: 5px;
	margin-top: 60px;
	padding: 30px;
	position: relative;
}

.product-img {
	text-align: center;
}

.product-details {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: flex-start;
	gap: 20px;
}

.product-details button {
	padding: 8px 15px;
	border-radius: 5px;
	border: none;
	cursor: pointer;
	color: white;
	letter-spacing: 1px;
	font-size: 16px;
	background-color: green;
}

.back-arrow {
	position: absolute;
	top: 15px;
	left: 15px;
}

.back-arrow a {
	font-size: 25px;
	color: black;
}

.product-details form {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: flex-start;
	gap: 20px;
}

.product-details form input, .address {
		width: 280px;
		padding: 10px 15px;
		border-radius: 5px;
		outline: none;
		border: none;
		letter-spacing: 1px;
		background-color: #edededf0;
	}
	
.product-details form input[type="submit"] {
		background-color: #11b511;
		color: white;
		font-size: 15px;
		letter-spacing: 1px;
		cursor: pointer;
	}
	
.product-details .quantity {
	width: 210px;
}
	
.product-details .address {
	height: 60px;
}
	
	
</style>

</head>
<body>

<%
String user = session.getAttribute("user").toString();

String pId = request.getParameter("pId");
String pName = request.getParameter("pName");
String pPrice = request.getParameter("pPrice");
String pImg = request.getParameter("pImg");
String dbQuan = request.getParameter("pQuan");
%>


<div class="nav-bar">

<h3><a href="home.jsp">Home</a></h3>

<ul>
	<li><a><%=user%> <i class="fa-solid fa-user"></i></a></li>
	<li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i></a></li>
</ul>

</div>

<div class="container">
	<div class="product">
		<div class="product-img">
			<img src="./img/<%=pImg%>" width="350px" height="350px">
		</div>
		<div class="product-details">
			<h1><%=pName%></h1>
			<p>Rs. <%=pPrice%> /-</p>
			<form action="OrderFunction" method="post"> 
				<input type="hidden" name="userName" value="<%= user %>">
				<input type="hidden" name="pId" value="<%= pId %>">
				<input type="hidden" name="pName" value="<%= pName %>">
				<input type="hidden" name="pPrice" value="<%= pPrice %>">
				<input type="hidden" name="dbQuan" value="<%= dbQuan %>">
				<div>
					<label>Quantity: </label>
					<input class="quantity" type="number" name="userQuan" value="1" min="1" required>
				</div>
				<input class="phoneNo" type="number" name="userPhone" placeholder="Enter Your Phone No" required>
				<textarea class="address" name="userAddress" placeholder="Enter Your Address" required></textarea>
				<input type="submit" value="Order Now">
			</form>
			
		</div>
		<div class="back-arrow">
			<a href="home.jsp">
				<i class="fa-solid fa-arrow-left"></i>
			</a>
		</div>
	</div>
</div>


</body>
</html>