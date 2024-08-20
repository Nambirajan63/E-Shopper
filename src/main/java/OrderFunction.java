

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;


public class OrderFunction extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "jdbc:mysql://localhost:3306/eshopper";
		String user = "root";
		String mysqlPassword = "password";

		String userName = request.getParameter("userName");
		String pId = request.getParameter("pId");
		String pName = request.getParameter("pName");
		String pPrice = request.getParameter("pPrice");
		int dbQuan = Integer.parseInt(request.getParameter("dbQuan"));
		int userQuan = Integer.parseInt(request.getParameter("userQuan"));
		String userPhone = request.getParameter("userPhone");
		String userAddress = request.getParameter("userAddress");
		
		int finalQuantity;
		
		PrintWriter pw = response.getWriter();
		
		if(dbQuan > userQuan) {
			try {
				finalQuantity = dbQuan-userQuan;
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url,user,mysqlPassword);
				Statement st = con.createStatement();
				st.executeUpdate("update products set Quantity="+finalQuantity+" where Id="+pId);
				st.executeUpdate("insert into orderDetails values('"+userName+"','"+pName+"',"+pPrice+","+userQuan+",'"+userAddress+"','"+userPhone+"','Order is pending')");
				response.sendRedirect("home.jsp");
			}
			catch(Exception e) {
				pw.println(e);
			}
		} else {
			pw.println("Stack not available");
		}
		
	}

}
