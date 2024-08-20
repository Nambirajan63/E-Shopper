<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VIEW PRODUCT</title>

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

.table-box {
	margin: 20px 0;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
}

table {
	border-collapse: collapse;
}

thead th {
	width: 220px;
	background-color: #edededf0;
	padding: 10px;
	letter-spacing: 1px;
	text-transform: uppercase;
}

tbody tr {
	 border-bottom: 2px solid #edededf0;
}

tbody tr td {
	padding: 10px;
	letter-spacing: 1px;
}



.btn {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap: 10px;
}

.btn-edit, .btn-del {
	width: 200px;
	padding: 8px 10px;
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

<div class="table-box">
	<table>
		<thead>
			<tr>
				<th>Product Id</th>
				<th>Product Image</th>
				<th>Product Name</th>
				<th>Product Price</th>
				<th>Quantity</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
		
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
				
			<tr>
				<td><%= pId %></td>
				<td><img src="./img/<%= pImg %>" width="70px" height="70px"></td>
				<td><%= pName %></td>
				<td>Rs. <%= pPrice %> /-</td>	
				<td><%= pQuan %></td>
				<td class="btn">
				<a href="editproduct.jsp?pId=<%= pId %>&pName=<%= pName %>&pPrice=<%= pPrice %>&pImg=<%= pImg %>&pQuantity=<%= pQuan %>"><button class="btn-edit"><i class="fa-solid fa-pen-to-square"></i> Edit</button></a>
				<a href="deleteproduct.jsp?pId=<%= pId %>"><button class="btn-del"><i class="fa-solid fa-trash"></i> Delete</button></a>
				</td>
			</tr>
				
				<%
				
			}
			
			
		}
		catch(Exception e) {
			out.println(e);
		}
		
		%>
		
		</tbody>
	</table>
</div>


</body>
</html>





