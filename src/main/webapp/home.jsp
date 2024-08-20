<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

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

.product-box {
	padding: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	gap: 100px;
}

.product-box * {
	margin: 10px 0;
}

.card {
	width: 320px;
	height: 100%;
	border: 1px solid #edededf0;
	padding: 10px 20px;
	border-radius: 5px;
	box-shadow: 0 0 7px #edededf0,0 0 10px #edededf0,0 0 15px #edededf0;
}

.card * {
	margin: 5px 0;
}

.product-img {
	text-align: center;
}

.product-name {
	letter-spacing: 1px;
	margin: 10px 0;
}

.product-price {
	letter-spacing: 1px;
	font-weight: 600;
	margin: 10px 0;
}

.btn {
	display: flex;
	justify-content: center;
	align-items: center;
}

.btn button {
	padding: 8px 10px;
	border-radius: 5px;
	border: none;
	cursor: pointer;
	color: white;
	letter-spacing: 1px;
	font-size: 14px;
	font-weight: 600;
	background-color: green;
}


</style>

</head>
<body>

<%
String user = session.getAttribute("user").toString().toUpperCase();
%>


<div class="nav-bar">

<h3><a href="home.jsp">Home</a></h3>

<ul>
	<li><a><%=user%> <i class="fa-solid fa-user"></i></a></li>
	<li><a href="login.jsp"><i class="fa-solid fa-right-from-bracket"></i></a></li>
</ul>

</div>

<div class="container">
	<div class="product-box">
		
		<%
		String url = "jdbc:mysql://localhost:3306/eshopper";
		String mysqlPassword = "password";
		
		String pName, pImg; 
		int pId,pPrice,pQuan;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,"root",mysqlPassword);
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
					<div class="btn">
						<a href="viewdetails.jsp?pId=<%= pId %>&pName=<%= pName %>&pPrice=<%= pPrice %>&pImg=<%= pImg %>&pQuan=<%= pQuan %>"><button>View Details</button></a>
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







