

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

public class DeleteProduct extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "jdbc:mysql://localhost:3306/eshopper";
		String user = "root";
		String mysqlPassword = "password";

		int pId = Integer.parseInt(request.getParameter("productId"));

		PrintWriter pw = response.getWriter();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,user,mysqlPassword);
			Statement st = con.createStatement();
			st.executeUpdate("delete from products where Id="+ pId);
			response.sendRedirect("adminpage.jsp");
		}
		catch(Exception e) {
			pw.println(e);
		}
	}

}
