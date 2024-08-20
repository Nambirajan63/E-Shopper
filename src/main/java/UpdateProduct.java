

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;


public class UpdateProduct extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "jdbc:mysql://localhost:3306/eshopper";
		String user = "root";
		String mysqlPassword = "password";

		String pId = request.getParameter("productId");
		String pName = request.getParameter("productName");
		String pPrice = request.getParameter("productPrice");
		String pImg = request.getParameter("productImg");
		String pQuan = request.getParameter("productQuantity");

		PrintWriter pw = response.getWriter();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,user,mysqlPassword);
			Statement st = con.createStatement();
			st.executeUpdate("update products set ProductName='"+ pName +"', ProductPrice="+ pPrice +", ProductImg='"+ pImg +"',Quantity="+ pQuan +" where Id="+ pId);
			response.sendRedirect("adminpage.jsp");
		}
		catch(Exception e) {
			pw.println(e);
		}
	}

}
