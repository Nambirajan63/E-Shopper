

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;


public class AddProduct extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "jdbc:mysql://localhost:3306/eshopper";
		String user = "root";
		String mysqlPassword = "password";

		String pName = request.getParameter("productName");
		int pPrice = Integer.parseInt(request.getParameter("productPrice"));
		String pImg = request.getParameter("productImg");
		String pQuan = request.getParameter("productQuantity");

		PrintWriter pw = response.getWriter();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,user,mysqlPassword);
			Statement st = con.createStatement();
			st.executeUpdate("insert into products(ProductName, ProductPrice, ProductImg, Quantity) values('"+ pName +"', "+ pPrice +", '"+ pImg +"',"+ pQuan +")");
			response.sendRedirect("adminpage.jsp");
		}
		catch(Exception e) {
			pw.println(e);
		}

	}

}
