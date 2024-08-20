<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<style>

@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

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
	margin: 0 20px;
}

a {
	color: white;
	text-decoration: none;
	letter-spacing: 1px;
}

.product-box {
	padding: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	gap: 100px;
}

.card {
	width: 320px;
	height: 100%;
	border: 2px solid #edededf0;
	padding: 10px 20px;
	border-radius: 5px;
	box-shadow: 0 0 7px #edededf0,0 0 10px #edededf0;
}

.product-box * {
	margin: 5px 0;
}

.product-img {
	text-align: center;
}

.product-name {
	letter-spacing: 1px;
}

.product-price, .product-quantity {
	letter-spacing: 1px;
	font-weight: 600;
}

.btn {
	display: flex;
	justify-content: space-between;
}

.btn button {
	padding: 5px 10px;
	border-radius: 5px;
	border: none;
	cursor: pointer;
	color: white;
	letter-spacing: 1px;
	font-size: 14px;
}

.btn-edit {
	background-color: green;
}

.btn-del {
	background-color: red;
}

</style>
</head>
<body>

<div class="nav-bar">

<h3><a href="adminpage.jsp">Admin</a></h3>

<ul>
	<li><a href="addproduct.jsp">Add Product</a></li>
	<li><a href="updateproduct.jsp">Update Product</a></li>
	<li><a href="deleteproduct.jsp">Delete Product</a></li>
	<li><a href="viewproduct.jsp">View Product</a></li>
</ul>

</div>

<div class="container">
	<div class="product-box">
		
		<%
		String url = "jdbc:mysql://localhost:3306/eshopper";
		String user = "root";
		String mysqlPassword = "password";
		
		String pName, pImg; 
		int pId,pPrice,pQuan;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,user,mysqlPassword);
			Statement st = con.createStatement();
			ResultSet result = st.executeQuery("select * from products");
			
			while(result.next()) {
				pId = result.getInt(1);
				pName = result.getString(2);
				pPrice = result.getInt(3);
				pImg = result.getString(4);
				pQuan = result.getInt(5);
				%>
				
				<div class="card">
					<div class="product-img">
						<img src="./img/<%= pImg %>" width="240px" height="240px">
					</div>
					<h3 class="product-name"><%= pName %></h3>
					<p class="product-price">₹<%= pPrice %> /-</p>
					<p class="product-quantity">Quantity - <%= pQuan %></p> 
					<div class="btn">
						<a href="editproduct.jsp?pId=<%= pId %>&pName=<%= pName %>&pPrice=<%= pPrice %>&pImg=<%= pImg %>&pQuantity=<%= pQuan %>">
							<button class="btn-edit"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
						</a>
						<a href="deleteproduct.jsp?pId=<%= pId %>">
							<button class="btn-del"><i class="fa-solid fa-trash"></i> Delete</button>
						</a>
					</div>
				</div>
				
				<%
				
			}
			
			
		}
		catch(Exception e) {
			out.println(e);
		}
		%>
	</div>
</div>

</body>
</html>









