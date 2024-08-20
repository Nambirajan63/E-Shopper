<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UPDATE PRODUCT</title>

<style>
	
@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'poppins',sans-serif;
}


body {
	width: 100vw;
	height: 100vh;
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

	.form-box {
		width: 100%;
		height: 500px;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	form {
		width: 380px;
		height: 420px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		gap: 20px;
		border-radius: 5px;
		padding: 20px;
		background-color: #edededf0;
		box-shadow: 0 0 7px #edededf0,0 0 10px #edededf0,0 0 15px #edededf0;
}
	}
	
	form h2 {
		letter-spacing: 1px;
	}
	
	form input {
		width: 300px;
		padding: 10px 15px;
		border-radius: 5px;
		outline: none;
		border: none;
		letter-spacing: 1px;
	}
	
	form input[type="submit"] {
		background-color: #11b511;
		color: white;
		font-size: 15px;
		letter-spacing: 1px;
		cursor: pointer;
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

<div class="form-box">
<form action="UpdateProduct" method="post">
	<h2>UPDATE PRODUCT</h2>
	<input type="number" name="productId" placeholder="Enter the Product Id" required>
	<input type="text" name="productName" placeholder="Enter the Product Name" required>
	<input type="number" name="productPrice" placeholder="Enter the Product Price" required>
	<input type="number" name="productQuantity" placeholder="Enter the Product Quantity" required>
	<input type="text" name="productImg" placeholder="Enter the Product Img" required>
	<input type="submit" value="Update Product">
</form>
</div>

</body>
</html>






